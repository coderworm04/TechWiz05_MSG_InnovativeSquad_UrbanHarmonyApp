import 'package:flutter/material.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  int currentPageIndex = 2;

  void _onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("BlogsPage"),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
