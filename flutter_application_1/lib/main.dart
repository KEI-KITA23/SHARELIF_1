import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
        ),
        body: Center(
          child: QrCodeGenerator(
            data: "https://example.com",
          ),
        ),
      ),
    );
  }
}

class QrCodeGenerator extends StatelessWidget {
  final String data;

  QrCodeGenerator({required this.data});

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: 200.0,
      gapless: false,
      foregroundColor: Colors.black,
    );
  }
}
