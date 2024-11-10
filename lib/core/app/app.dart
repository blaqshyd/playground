import 'package:flutter/material.dart';

import '../../features/file_upload/view/upload_file.screen.dart';

class PGApp extends StatelessWidget {
  const PGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PG',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/upload',
      routes: {
        '/': (context) => const Scaffold(),
        '/upload': (context) => const UploadFileScreen(),
      },
    );
  }
}
