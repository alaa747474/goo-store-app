import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    Key? key,
    required this.finalToken,
  }) : super(key: key);
  final String finalToken;

  @override
  Widget build(BuildContext context) {
    final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
      Factory(() => EagerGestureRecognizer())
    };
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Theme.of(context).scaffoldBackgroundColor)
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/751056?payment_token=$finalToken'));
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Card details',
        onPressed: () => Navigator.pop(context),
      ),
      body: WebViewWidget(
        controller: controller,
        gestureRecognizers: gestureRecognizers,
      ),
    );
  }
}
