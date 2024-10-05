import 'package:flutter/material.dart';
import 'package:sharelife/sinkilogin_page.dart';

void main() {
  runApp(SinkiPage());
}

class SinkiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    // 新規登録処理を追加
    print('Username: $username');
    print('Email: $email');
    print('Password: $password');
  }

  void _goBack() {
    Navigator.pop(context); // 前の画面に戻る
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サインアップ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'ユーザーネーム',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'メールアドレスもしくは電話番号',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'パスワード',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // パスワードを隠す
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('サインアップ'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SinkiloginPage()),
                );
                // ログインボタンの処理
          },
        child: Icon(Icons.arrow_back), // 戻るアイコン
        tooltip: '戻る',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // 左下に配置
    );
  }
}
