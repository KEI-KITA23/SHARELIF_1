import 'package:flutter/material.dart';
import 'package:sharelife/friend_page.dart';
import 'package:sharelife/my_page.dart';
import 'package:sharelife/add_page.dart';
import 'package:sharelife/ranking_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
              Icons.person_add,
              color: const Color.fromARGB(255, 156, 151, 154),
              size: 40.0,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'フォロー中',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 2.0,
                  ),
                ),
              ),
              SizedBox(width: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FriendPage()),
                  );
                },
                child: Text(
                  'ともだち',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 500,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider(
                      create: (context) => LikeModel(),
                      child: Consumer<LikeModel>(
                        builder: (context, likeModel, child) {
                          return TweetTile(likeModel: likeModel);
                        },
                      ),
                    );
                  },
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

class TweetTile extends StatelessWidget {
  final LikeModel likeModel;

  const TweetTile({super.key, required this.likeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://1.bp.blogspot.com/-uAkJ4ehhFCg/XPymAIaJjSI/AAAAAAABTEs/Ubz2hOuxoKsGko03KjU_Z9HHj64xtRFygCLcBGAs/s800/toilet_study_man.png'),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('ユーザー名'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.0,
                        height: 350.0,
                        color: const Color.fromARGB(255, 35, 158, 189),
                        child: Text("スケジュール"),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              likeModel.toggleLike();
                            },
                            child: Icon(
                              likeModel.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: const Color.fromARGB(255, 236, 93, 164),
                              size: 25.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                          ),
                          Text('${likeModel.likes}'),
                          ElevatedButton(
                            onPressed: () {
                              likeModel.toggleSave(); // 保存状態を切り替え
                            },
                            child: Icon(
                              likeModel.isSaved
                                  ? Icons.bookmark // 保存された状態
                                  : Icons.bookmark_border, // 保存されていない状態
                              color: const Color.fromARGB(255, 22, 45, 217),
                              size: 30.0,
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
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        width: 90.0,
                        height: 90.0,
                        color: const Color.fromARGB(255, 33, 162, 176),
                        child: Text("写真１"),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 90.0,
                        height: 90.0,
                        color: const Color.fromARGB(255, 19, 151, 39),
                        child: Text("写真２"),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 90.0,
                        height: 90.0,
                        color: const Color.fromARGB(255, 38, 136, 216),
                        child: Text("写真３"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LikeModel with ChangeNotifier {
  int _likes = 0;
  bool _isLiked = false;
  bool _isSaved = false; // 保存の状態

  int get likes => _likes;
  bool get isLiked => _isLiked;
  bool get isSaved => _isSaved;

  void toggleLike() {
    if (_isLiked) {
      _likes--;
    } else {
      _likes++;
    }
    _isLiked = !_isLiked;
    notifyListeners();
  }

  void toggleSave() {
    _isSaved = !_isSaved; // 状態を切り替える
    notifyListeners(); // UIを更新
  }
}
