import 'package:flutter/material.dart';
import 'package:sharelife/api_service.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final ApiService apiService = ApiService(); // ApiServiceインスタンスを生成
  List<dynamic> tasks = []; // サーバーから取得したタスクを保存するリスト

  // サーバーからデータを取得する関数
  Future<void> loadTasks() async {
    try {
      final fetchedTasks = await apiService.fetchTasks(); // データ取得
      setState(() {
        tasks = fetchedTasks; // 取得したデータを画面に反映
      });
    } catch (e) {
      print('データ取得失敗: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loadTasks(); // 画面初期化時にデータをロード
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク一覧'),
      ),
      body: tasks.isEmpty
          ? const Center(child: CircularProgressIndicator()) // ローディング表示
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title']), // タスクのタイトルを表示
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // タスク追加
          await apiService.createTask('新しいタスク'); // サンプルデータを追加
          loadTasks(); // リストを更新
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
