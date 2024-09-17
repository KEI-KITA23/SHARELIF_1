import 'package:flutter/material.dart';
import 'package:sharelife/main.dart';
import 'package:sharelife/ranking_page.dart';
import 'package:sharelife/my_page.dart';

class KeepPage extends StatelessWidget {
  const KeepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          squareRow(
            text1: "フィットネス",
            text2: "勉強",
          ),
          SizedBox(height: 40),
          squareRow(
            text1: "旅行",
            text2: "平日",
          ),
          SizedBox(height: 40),
          squareRow(text1: "休日", text2: "その他"),
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
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
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
                    Icons.local_fire_department, // rankingのアイコン
                    color: const Color.fromARGB(255, 106, 120, 115), // アイコンの色
                    size: 55.0, // アイコンのサイズ
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
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

class squareRow extends StatelessWidget {
  final String text1; // 追加された文字列引数
  final String text2;

  // コンストラクタで文字列を受け取るように修正
  const squareRow({
    super.key,
    required this.text1, // 文字列引数を必須に設定
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        // RoundedRectangleウィジェットに引数としてtextを渡す
        RoundedRectangle(text: text1),
        SizedBox(width: 40),
        // 同じくRoundedRectangleウィジェットに引数としてtextを渡す
        RoundedRectangle(text: text2),
      ],
    );
  }
}

class RoundedRectangle extends StatelessWidget {
  final String text; // 文字列の引数を追加

  const RoundedRectangle({
    super.key,
    required this.text, // 引数として受け取る
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.0, // 幅
      height: 190.0, // 高さ
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 84, 247, 108), // 背景色
        borderRadius: BorderRadius.circular(16.0), // 角の丸み
        border: Border.all(
          color: const Color.fromARGB(255, 45, 41, 41),
          width: 5.0,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text, // 引数から受け取った文字列を表示
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
