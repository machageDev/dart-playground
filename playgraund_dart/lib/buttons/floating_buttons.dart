import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curved Bottom Nav Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CurvedBottomNavExample(),
    );
  }
}

class CurvedBottomNavExample extends StatefulWidget {
  @override
  State<CurvedBottomNavExample> createState() => _CurvedBottomNavExampleState();
}

class _CurvedBottomNavExampleState extends State<CurvedBottomNavExample> {
  int _page = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    AddPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // make nav bar float over body
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _page = index),
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, // makes it float
        color: Colors.blue,
        buttonBackgroundColor: Colors.white,
        height: 60,
        index: _page,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.blue), // center floating btn
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() => _page = index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

// Example pages
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("🏠 Home Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("🔍 Search Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("➕ Add Something", style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("👤 Profile Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("⚙️ Settings Page", style: TextStyle(fontSize: 24)),
    );
  }
}
