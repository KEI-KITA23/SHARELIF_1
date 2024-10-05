import 'package:flutter/material.dart';
import 'package:sharelife/main.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/ranking_page.dart';

class ScannedResultPage extends StatelessWidget {
  final String code; // QRコードの内容を保持するための変数

  const ScannedResultPage({super.key, required this.code}); // コンストラクタにcodeを追加

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // 上部の余白
          Text(
            'Scanned QR Code: $code', // QRコードの内容を表示
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 500, // 幅を指定してサイズを調整
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
                      )),
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
                      )),
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
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
