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
          onPageStarted: (String url) {
            // check if user order complete
          },
          onPageFinished: (String url) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.approvalUrl));
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thanh toán thành công'),
          content: Text('Cảm ơn bạn đã thanh toán học phí.'),
          actions: [
            TextButton(
              onPressed: () {
                // Đóng dialog và quay lại trang trước
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
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
