import 'package:flutter/material.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/add_page.dart';
import 'package:sharelife/ranking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: firstPage(),
    );
  }
}

class firstPage extends StatelessWidget {
  const firstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharelife'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => addPage()),
              );
            },
            child: Icon(
              Icons.person_add, // 人のアイコン
              color: const Color.fromARGB(255, 156, 151, 154), // アイコンの色
              size: 40.0, // アイコンのサイズ
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center, // 水平方向に中央揃え
            crossAxisAlignment: CrossAxisAlignment.center, // 縦方向に中央揃え
            children: [
              Text(
                'フォロー中',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'ともだち',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 500, // 幅を指定してサイズを調整
                child: ListView(
                  shrinkWrap: true, // リストの高さに合わせてサイズを調整
                  children: [
                    TweetTile(),
                    TweetTile(),
                    TweetTile(),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
                      MaterialPageRoute(builder: (context) => rankingPage()),
                    );
                  },
                  child: Icon(
                    Icons.local_fire_department, // homeのアイコン
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
                      MaterialPageRoute(builder: (context) => myPage()),
                    );
                  },
                  child: Icon(
                    Icons.person, // homeのアイコン
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

class TweetTile extends StatelessWidget {
  const TweetTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, //左端揃え
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://1.bp.blogspot.com/-uAkJ4ehhFCg/XPymAIaJjSI/AAAAAAABTEs/Ubz2hOuxoKsGko03KjU_Z9HHj64xtRFygCLcBGAs/s800/toilet_study_man.png'),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            //縦に文字を並べる
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //横に文字を並べる
                children: [
                  Text('ユーザー名'),
                ],
              ),
              SizedBox(
                height: 15,
              ), //縦幅の確保
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.0, // 幅
                        height: 350.0, // 高さ
                        color: const Color.fromARGB(255, 35, 158, 189), // 背景色
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.favorite, // ハートのアイコン
                              color: const Color.fromARGB(
                                  255, 236, 93, 164), // アイコンの色
                              size: 25.0, // アイコンのサイズ
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.save, // 保存アイコン
                              color: const Color.fromARGB(
                                  182, 22, 45, 217), // アイコンの色
                              size: 30.0, // アイコンのサイズ
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 90.0, // 幅
                        height: 90.0, // 高さ
                        color: const Color.fromARGB(255, 33, 162, 176), // 背景色
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 90.0, // 幅
                        height: 90.0, // 高さ
                        color: const Color.fromARGB(255, 8, 53, 50), // 背景色
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 90.0, // 幅
                        height: 90.0, // 高さ
                        color: const Color.fromARGB(255, 22, 82, 131), // 背景色
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
