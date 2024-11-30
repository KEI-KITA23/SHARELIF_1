import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://todo-api-drizzle.kimjh2995.workers.dev';

  // GETリクエスト: タスク一覧を取得
  Future<List<dynamic>> fetchTasks() async {
    final url = Uri.parse('$baseUrl/api/tasks');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('サーバーエラー: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('リクエスト失敗: $e');
    }
  }

  // POSTリクエスト: 新しいタスクを作成
  Future<void> createTask(String taskTitle) async {
    final url = Uri.parse('$baseUrl/api/tasks');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'title': taskTitle});

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode != 201) {
        throw Exception('タスク作成エラー: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('リクエスト失敗: $e');
    }
  }
}
