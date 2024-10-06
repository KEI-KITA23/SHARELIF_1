import 'package:flutter/material.dart';
import 'package:sharelife/home_page.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/qr_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '検索',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
          // プロフィールをシェアボタンの追加
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerRight, // 右側に寄せる
              child: SizedBox(
                width: 150, // ボタンの幅を少し小さくする
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => QrPage()),
                    );
                  },
                  child: Text('プロフィールをシェア'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 26, 171, 219), // ボタンの色
                    padding: EdgeInsets.symmetric(vertical: 12), // ボタンの上下の余白を調整
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('検索結果: $_searchQuery'),
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
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
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
