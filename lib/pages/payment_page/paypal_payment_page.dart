import 'package:e_learning_klass/pages/payment_page/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPaymentPage extends StatefulWidget {
  final String approvalUrl;
  const PaypalPaymentPage({super.key, required this.approvalUrl});

  @override
  State<PaypalPaymentPage> createState() => _PaypalPaymentPageState();
}

class _PaypalPaymentPageState extends State<PaypalPaymentPage> {
  late WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpAuthRequest: (request) {},
          onHttpError: (error) {},
          onProgress: (progress) {},
          onUrlChange: (change) {},
          onPageStarted: (String url) {
            if (url.contains('capture')) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentSuccessPage(),
                ),
              );
            }
          },
          onPageFinished: (String url) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const PaymentSuccessPage(),
            //   ),
            // );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.approvalUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayPal Payment'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
