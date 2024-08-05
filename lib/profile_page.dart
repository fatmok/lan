import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String loginName;
  final String companyName;

  const ProfilePage({
    Key? key,
    required this.loginName,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('個人資料'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '登入名稱: $loginName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '已選公司名稱: $companyName',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
