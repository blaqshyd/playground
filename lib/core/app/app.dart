import 'package:flutter/material.dart';
import 'package:playground/features/auth/view/splash_view.dart';

import '../../features/file_upload/view/upload_file.screen.dart';
import '../../features/payment/flutter_payment.dart';

class PGApp extends StatelessWidget {
  const PGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PG',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/upload': (context) => const UploadFileScreen(),
        '/payment': (context) => const PaypalPayment(),
      },
    );
  }
}
