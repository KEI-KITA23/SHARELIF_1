import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sharelife/home_page.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/ranking_page.dart';
import 'scanned_result_page.dart'; // 新しい画面をインポート

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife QR Code Scanner'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final String? code =
                  barcodes.isNotEmpty ? barcodes.first.rawValue : null;

              if (code != null) {
                print('QR Code detected: $code');

                // スキャンしたQRコードの内容を持って新しい画面に遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScannedResultPage(code: code),
                  ),
                );
              }
            },
          ),
          Center(
            child: Container(
              width: 250, // スキャンエリアの幅
              height: 250, // スキャンエリアの高さ
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.transparent, // スキャンエリアの背景を透明にする
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => FirstPage()),
                      );
                    },
                    child: Icon(
                      Icons.home,
                      color: const Color.fromARGB(255, 106, 120, 115),
                      size: 55.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RankingPage()),
                      );
                    },
                    child: Icon(
                      Icons.local_fire_department,
                      color: const Color.fromARGB(255, 106, 120, 115),
                      size: 55.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyPage()),
                      );
                    },
                    child: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 106, 120, 115),
                      size: 55.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
