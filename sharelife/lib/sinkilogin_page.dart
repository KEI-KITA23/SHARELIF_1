import 'package:flutter/material.dart';
import 'package:sharelife/sinki_page.dart';
import 'package:sharelife/login_page.dart';

void main() {
  runApp(SinkiloginPage());
}

class SinkiloginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharelife Example',
      home: HomePage(), // HomePageに切り替え
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 上に寄せる
          children: [
            SizedBox(height: 250), // 上にスペースを確保
            Text(
              'Sharelife',
              style: TextStyle(
                fontSize: 100, // フォントサイズを大きく
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50), // 「Sharelife」とボタンの間にスペースを追加
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SinkiPage()),
                );
                // 新規登録ボタンの処理
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 134, 227, 137), // 緑色のボタン
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                '新規登録',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20), // ボタン同士のスペースを追加
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                // ログインボタンの処理
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 253, 86, 142), // ピンク色のボタン
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                'ログイン',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
