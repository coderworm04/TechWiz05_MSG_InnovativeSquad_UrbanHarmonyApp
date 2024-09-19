import 'package:flutter/material.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';

class DesignsPage extends StatefulWidget {
  const DesignsPage({super.key});

  @override
  _DesignsPageState createState() => _DesignsPageState();
}

class _DesignsPageState extends State<DesignsPage> {
  int currentPageIndex = 1;

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
          child: Text("DesignsPage"),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
