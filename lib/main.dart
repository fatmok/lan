import 'package:flutter/material.dart';
import 'sign_in_page2.dart'; // 导入 SignInPage2
import 'company_page.dart'; // 导入 CompanyPage
import 'application_page.dart'; // 确保导入 ApplicationPage
import 'sales_shipments_page.dart'; // 确保导入 SalesShipmentsPage
import 'profile_page.dart'; // 确保导入 ProfilePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.lightBlueAccent, // 设置全局底部导航栏的背景颜色
          selectedItemColor: Colors.white, // 设置选中项目的颜色
          unselectedItemColor: Colors.white70, // 设置未选中项目的颜色
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const SignInPage2(), // 使用 const 确保引用正确的 SignInPage2 组件
        '/company': (context) => CompanyPage(),
        '/application': (context) => const ApplicationPage(),
        '/salesShipment': (context) => const SalesShipmentsPage(),
        '/profile': (context) => ProfilePage(
              loginName: (ModalRoute.of(context)!.settings.arguments
                  as Map)['loginName'],
              companyName: (ModalRoute.of(context)!.settings.arguments
                  as Map)['companyName'],
            ),
      },
    );
  }
}
