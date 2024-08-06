import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent, // 设置背景颜色
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(icon: Icons.home, label: '首頁', index: 0),
          _buildNavItem(icon: Icons.apps, label: '應用', index: 1),
          _buildNavItem(icon: Icons.person, label: '我的', index: 2),
          _buildNavItem(icon: Icons.logout, label: '登出', index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      {required IconData icon, required String label, required int index}) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white70,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
