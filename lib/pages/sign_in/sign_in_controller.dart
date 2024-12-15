import 'package:dio/dio.dart';
import 'package:e_learning_klass/common/apis/user_api.dart';
import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/routes/names.dart';

import 'package:e_learning_klass/common/widgets/flutter_toast.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  /// Handles the sign-in process for email-based authentication using an API.
  Future<void> handleSignIn(String type) async {
    if (type != "email") {
      toastInfo(msg: "Unsupported login type: $type");
      return;
    }

    // Get credentials from SignInBloc state
    final state = context.read<SignInBloc>().state;
    final emailAddress = state.email.trim();
    final password = state.password.trim();

    // Validate input fields
    if (emailAddress.isEmpty) {
      toastInfo(msg: "You need to fill email address");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "You need to fill password");
      return;
    }

    // Show loading indicator
    EasyLoading.show(status: 'Logging in...');

    try {
      // Prepare login request payload
      final loginRequest = LoginRequestEntity(
        email: emailAddress,
        password: password,
      );

      // Send login request to API
      final result = await UserAPI.login(params: loginRequest);

      // Handle successful response
      if (result.accessToken != null) {
        // Save all token related data to local storage
        await Global.storageService.saveTokens(
          accessToken: result.accessToken!,
          refreshToken: result.refreshToken!,
          accessTokenExpireTime: result.accessTokenExpireTime!,
          refreshTokenExpireTime: result.refreshTokenExpireTime!,
        );

        // Optionally store expiration times if needed
        // Global.storageService.setInt(
        //     AppConstants.STORAGE_ACCESS_TOKEN_EXPIRY_KEY,
        //     int.parse(result.accessTokenExpireTime!));

        // Use 'context' safely after async call
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.application, (route) => false);
        }
      } else {
        toastInfo(msg: "Invalid credentials or user does not exist");
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      final message = _getErrorMessage(e);
      toastInfo(msg: message);
    } catch (e) {
      // Handle general errors
      toastInfo(msg: "An unexpected error occurred. Please try again.");
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// Helper to get error message from DioException
  String _getErrorMessage(DioException e) {
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 401:
          return "Incorrect email or password";
        case 500:
          return "Server error. Please try again later.";
        default:
          return "Error: ${e.response?.statusMessage ?? 'Unknown error'}";
      }
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timed out. Please try again.";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Server took too long to respond. Please try again.";
    } else if (e.type == DioExceptionType.connectionError) {
      return "Network error. Please check your connection.";
    }
    return "An unexpected error occurred. Please try again.";
  }
}
