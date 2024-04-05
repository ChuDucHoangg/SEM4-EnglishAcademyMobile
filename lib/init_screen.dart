import 'package:english_academy_mobile/presentation/course_screen/course_detail_screen/course_detail_screen.dart';
import 'package:english_academy_mobile/presentation/home_screen/home_screen.dart';
import 'package:english_academy_mobile/presentation/course_screen/course_screen.dart';
import 'package:english_academy_mobile/presentation/indox_screen/indox_screen.dart';
import 'package:english_academy_mobile/presentation/profiles_screen/profiles_screen.dart';
import 'package:english_academy_mobile/presentation/transactions_screen/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_bar.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CourseScreen(),
    IndoxScreen(),
    TransactionsScreen(),
    ProfilesScreen(),
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
