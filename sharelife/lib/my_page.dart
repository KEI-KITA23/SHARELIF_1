import 'package:flutter/material.dart';
import 'package:sharelife/main.dart';
import 'package:sharelife/keep_page.dart';
import 'package:sharelife/ranking_page.dart';
import 'package:intl/intl.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime selectedDate = DateTime.now();
  // TextEditingControllerを定義
  List<TextEditingController> _controllers =
      List.generate(24, (index) => TextEditingController());

  @override
  void dispose() {
    // コントローラーを解放
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Sharelife"),
            SizedBox(width: 173),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => KeepPage()),
                );
              },
              child: Icon(
                Icons.bookmark, // saveのアイコン
                color: const Color.fromARGB(255, 106, 120, 115), // アイコンの色
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
            ElevatedButton(
              onPressed: () {
                // メニューのアクションを追加
              },
              child: Icon(
                Icons.menu, // menuのアイコン
                color: const Color.fromARGB(255, 106, 120, 115), // アイコンの色
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
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 30.0,
            child: Center(
              child: Text(
                DateFormat('MMMM yyyy').format(selectedDate),
                style: TextStyle(
                    color: const Color.fromARGB(255, 34, 32, 32), fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      _daysInMonth(selectedDate.year, selectedDate.month),
                      (index) {
                        DateTime day = DateTime(
                            selectedDate.year, selectedDate.month, index + 1);
                        return dateWidget(day);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 24, // 24時間のスロットを作成
                    itemBuilder: (context, index) {
                      return timeSlot(index);
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
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
              SizedBox(width: 20),
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
                onPressed: () {},
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
        ],
      ),
    );
  }

  Widget timeSlot(int hour) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            '${hour.toString().padLeft(2, '0')}:00',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              height: 50.0,
              margin: EdgeInsets.only(left: 12.0),
              color: Color(0xff654f91),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 4.0),
                  color: Color(0xfffcf9f5),
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controllers[hour], // コントローラーを設定
                    decoration: InputDecoration(
                      labelText: 'Enter some text',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateWidget(DateTime date) {
    bool isToday = date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year;
    return Container(
      width: 60.0,
      decoration: BoxDecoration(
        color: isToday ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            DateFormat('d').format(date),
            style: TextStyle(
              color: isToday ? Colors.white : Colors.black,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            DateFormat('E').format(date),
            style: TextStyle(
              color: isToday ? Colors.white : Colors.black,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  int _daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }
}
