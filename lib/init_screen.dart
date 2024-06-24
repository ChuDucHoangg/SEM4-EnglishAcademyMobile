import 'package:english_academy_mobile/presentation/course_screen/course_screen.dart';
import 'package:english_academy_mobile/presentation/entrance_test_screen/entrance_test_screen.dart';
import 'package:english_academy_mobile/presentation/home_screen/home_screen.dart';
import 'package:english_academy_mobile/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/widgets/custom_bottom_app_bar.dart';

class InitScreen extends StatefulWidget {
  final int initialIndex;

  const InitScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  late int _selectedIndex;

  final List<Widget> _screens = [
    HomeScreen(),
    CourseScreen(),
    EntranceTestScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomAppBar(
        onChanged: (index) {
          setState(() {
            _selectedIndex = index.index;
          });
        },
      ),
    );
  }
}
