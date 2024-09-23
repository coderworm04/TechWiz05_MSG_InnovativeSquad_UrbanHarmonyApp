// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SvgPicture
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/consts/fontstyles-consts.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/settingpage.dart';
import 'package:urban_harmony_app/pages/profilepages/aboutpage.dart';
import 'package:urban_harmony_app/pages/profilepages/appointmentpage.dart';
import 'package:urban_harmony_app/pages/profilepages/contactpage.dart';
import 'package:urban_harmony_app/pages/profilepages/editeprofilepage.dart';
import 'package:urban_harmony_app/pages/signinpage.dart';
import 'package:urban_harmony_app/pages/signuppage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPageIndex = 4;

  void _onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: [
              // Profile heading with top designer and edit icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                       Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Profile Picture with Edit Icon
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage(DemoImage0), // Replace with your profile image asset
                  ),
                  Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                    },
                  ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Profile Options
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.calendar_month, color: Colors.grey),
                title: Text('Appointment'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AppointmentPage()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info_outline, color: Colors.grey),
                title: Text('About Us'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.contact_mail, color: Colors.grey),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactPage()));
                },
              ),
              Divider(),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SigningPage()));
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
