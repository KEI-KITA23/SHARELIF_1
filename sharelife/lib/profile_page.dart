import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileModel(),
      child: MaterialApp(
        home: const ProfilePage(),
      ),
    );
  }
}

class ProfileModel extends ChangeNotifier {
  String name = 'ごぶた';
  String bio = '自己紹介内容がここに表示されます。';

  void updateProfile(String newName, String newBio) {
    name = newName;
    bio = newBio;
    notifyListeners(); // 変更を通知
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProfileModel>(
          builder: (context, profile, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_picture.png'), // 画像をassetsフォルダに追加してください
                ),
                const SizedBox(height: 16),
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  profile.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FollowingListPage()),
                        );
                      },
                      child: Column(
                        children: const [
                          Text(
                            '120',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'フォロー中',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FollowersListPage()),
                        );
                      },
                      child: Column(
                        children: const [
                          Text(
                            '80',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'フォロワー',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilePage()),
                    );
                  },
                  child: const Text('プロフィールを編集'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileModel>(context);
    final TextEditingController _nameController = TextEditingController(text: profileModel.name);
    final TextEditingController _bioController = TextEditingController(text: profileModel.bio);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '名前',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '名前を入力してください',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '自己紹介',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _bioController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '自己紹介を入力してください',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // プロフィールの更新
                profileModel.updateProfile(_nameController.text, _bioController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('プロフィールが更新されました')),
                );
                Navigator.pop(context); // 編集ページを閉じる
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}

class FollowingListPage extends StatelessWidget {
  const FollowingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('フォロー中リスト'),
      ),
      body: ListView.builder(
        itemCount: 10, // ダミーのフォローユーザー数
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('ユーザー名 ${index + 1}'),
            subtitle: const Text('このユーザーの自己紹介がここに表示されます。'),
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.png'), // 画像をassetsフォルダに追加してください
            ),
          );
        },
      ),
    );
  }
}

class FollowersListPage extends StatelessWidget {
  const FollowersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('フォロワーリスト'),
      ),
      body: ListView.builder(
        itemCount: 10, // ダミーのフォロワー数
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('フォロワー ${index + 1}'),
            subtitle: const Text('このユーザーの自己紹介がここに表示されます。'),
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.png'), // 画像をassetsフォルダに追加してください
            ),
          );
        },
      ),
    );
  }
}