import 'package:english_academy_mobile/presentation/home_screen/home_screen.dart';
import 'package:english_academy_mobile/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:english_academy_mobile/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:english_academy_mobile/presentation/profiles_page/profiles_page.dart';
import 'package:english_academy_mobile/presentation/transactions_page/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MyCourseCompletedPage(),
    IndoxChatsPage(),
    TransactionsPage(),
    ProfilesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomBar(
        onChanged: (index) {
          setState(() {
            _selectedIndex = index.index;
          });
        },
      ),
    );
  }
}
