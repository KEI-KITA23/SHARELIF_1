import 'package:flutter/material.dart';
import 'package:sharelife/main.dart';
import 'package:sharelife/ranking_page.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/add_page.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

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
                MaterialPageRoute(builder: (context) => AddPage()),
              );
            },
            child: Icon(
              Icons.person_add, // 人のアイコン
              color: const Color.fromARGB(255, 156, 151, 154), // アイコンの色
              size: 40.0, // アイコンのサイズ
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // 水平方向に中央揃え
            crossAxisAlignment: CrossAxisAlignment.center, // 縦方向に中央揃え
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                child: Text(
                  'フォロー中',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'ともだち',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 2.0,
                  ),
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
                        child: Text("スケジュール"),
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.save, // 保存アイコン
                              color: const Color.fromARGB(
                                  182, 22, 45, 217), // アイコンの色
                              size: 30.0, // アイコンのサイズ
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
                        child: Text("写真１"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 90.0, // 幅
                        height: 90.0, // 高さ
                        color: const Color.fromARGB(255, 19, 151, 39), // 背景色
                        child: Text("写真２"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 90.0, // 幅
                        height: 90.0, // 高さ
                        color: const Color.fromARGB(255, 38, 136, 216), // 背景色
                        child: Text("写真３"),
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
