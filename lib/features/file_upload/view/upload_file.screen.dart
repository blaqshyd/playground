import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:playground/services/upload_service.dart';

import '../../../services/picker_service.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  _UploadFileScreenState createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  final ValueNotifier<File?> _pickedFilesNotifier = ValueNotifier(null);

  void _pickImages() async {
    File? pickedImages = await ImagePickerService.pickImageGallery();

    _pickedFilesNotifier.value = pickedImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: _pickedFilesNotifier,
              builder: (context, file, child) {
                log(file.toString());
                return file != null
                    ? Image.file(file)
                    : const Text('No image picked');
              },
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: _pickedFilesNotifier,
              builder: (context, file, child) {
                log('2$file');
                return ElevatedButton(
                  onPressed: () async {
                  await  UploadImageService().uploadImage(file!);
                    // throw Exception('dynamic');
                  },
                  child: const Text('Upload'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
