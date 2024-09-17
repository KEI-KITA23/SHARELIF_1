import 'package:flutter/material.dart';
import 'package:sharelife/main.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/ranking_page.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife'),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center, // 水平方向に中央揃え
            crossAxisAlignment: CrossAxisAlignment.center, // 縦方向に中央揃え
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
                    Icons.home, // homeのアイコン
                    color: const Color.fromARGB(255, 106, 120, 115), // アイコンの色
                    size: 55.0, // アイコンのサイズ
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RankingPage()),
                    );
                  },
                  child: Icon(
                    Icons.local_fire_department, // ランキングのアイコン
                    color: const Color.fromARGB(255, 106, 120, 115), // アイコンの色
                    size: 55.0, // アイコンのサイズ
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyPage()),
                    );
                  },
                  child: Icon(
                    Icons.person, // 人のアイコン
                    color: const Color.fromARGB(255, 106, 120, 115), // アイコンの色
                    size: 55.0, // アイコンのサイズ
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
