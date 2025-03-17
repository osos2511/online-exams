import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/explore/explore_tab/view/explore_tab_view.dart';
import 'package:online_exams/presentation/screens/tabs/profile/view/profile_view.dart';
import 'package:online_exams/presentation/screens/tabs/results/results_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ExploreTab(),
    const ResultsTab(),
     ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}