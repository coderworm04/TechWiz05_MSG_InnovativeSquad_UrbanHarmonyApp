// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/colors-consts.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with SingleTickerProviderStateMixin {
  int currentPageIndex = 3;
  late TabController _tabController;

  void _onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children: [
            
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Container(
                
                decoration: BoxDecoration(
                  // color: Colors.grey[300], // Background color of the tab bar
                  // borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: null, // Active tab color
                        ),
                      labelColor: BlackColor, // Active tab text color
                      unselectedLabelColor: const Color.fromARGB(255, 126, 126, 126), // Inactive tab text color
                      labelStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: bold, // Make sure to define the font if it's custom
                      ), // Active tab text style
                      unselectedLabelStyle: TextStyle(
                        fontSize: 22, // Smaller font size for inactive tabs
                        fontWeight: FontWeight.w500,
                        fontFamily: bold, // Regular font for unselected tabs
                      ), // Inactive tab text style
                      tabs: [
                        Tab(text: "Activity"),
                        Tab(text: "Messages"),
                      ],
                    )
              ),
            ),
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Notifications Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text("New Comment on your post"),
                          subtitle: Text("John Doe commented: Great work!"),
                        ),
                        ListTile(
                          title: Text("New Follower"),
                          subtitle: Text("Jane Smith started following you."),
                        ),
                        // Add more notifications here
                      ],
                    ),
                  ),
                  // Messages Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text("Message from John"),
                          subtitle: Text("Hey! How are you?"),
                        ),
                        ListTile(
                          title: Text("Message from Jane"),
                          subtitle: Text("Looking forward to our meeting."),
                        ),
                        // Add more messages here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
