import 'package:e_learning_klass/common/apis/user_api.dart';
import 'package:flutter/material.dart';

class NavBavController {
  final BuildContext context;
  NavBavController({required this.context});

  String? userName;
  String? userEmail;
  String? userAvatarUrl;

  Future<void> fetchCurrentUser() async {
    try {
      final currentUser = await UserAPI.getCurrentUser();

      if (currentUser.success && currentUser.data != null) {
        userName =
            "${currentUser.data?.firstName} ${currentUser.data?.lastName}";
        userEmail = currentUser.data?.email;
        userAvatarUrl = currentUser.data?.avatarUrl;

        if (context.mounted) {
          (context as Element).markNeedsBuild();
        }
      } else {
        print("Failed to fetch user information.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> init() {
    print("...Navbar controller init method...");
    return fetchCurrentUser();
  }
}
