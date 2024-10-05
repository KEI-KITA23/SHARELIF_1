import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // QRコードのパッケージをインポート
import 'package:sharelife/main.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/ranking_page.dart';
import 'package:sharelife/scan_page.dart';

String qrText = "https://example.com";

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // 右側の余白を追加
            child: IconButton(
              icon: Icon(Icons.qr_code, size: 60), // アイコンサイズを60に設定
              onPressed: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ScanPage()),
                    );//スキャンページに移動
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Expanded(
            child: Center(
              child: QrImageView(
                data: qrText, // QRコードに含めるデータ
                size: 300.0, // QRコードのサイズ
              ),
            ),
          ),
          Center(
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
        ],
      ),
    );
  }
}
