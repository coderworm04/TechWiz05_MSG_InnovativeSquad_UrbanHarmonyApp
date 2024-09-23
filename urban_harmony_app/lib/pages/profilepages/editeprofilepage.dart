// ignore_for_file: unused_element, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Initial values for profile fields
  String name = 'Hassan';
  String phone = '03009268904';
  String address = 'Karachi';
  String email = 'hassan@gmail.com';

  // Function to display a dialog for editing profile info
  Future<void> _editProfileItem(String title, String initialValue, Function(String) onSave) async {
    TextEditingController controller = TextEditingController(text: initialValue);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new $title'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog without saving
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context); 
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(BackIcon),
                      
                  ),
                  
                  
                ],
              ),
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(DemoImage0),
              ),
              const SizedBox(height: 20),
              
              // Dynamic profile items
              itemProfile('Name', name, CupertinoIcons.person, () {
                _editProfileItem('Name', name, (newValue) {
                  setState(() {
                    name = newValue;
                  });
                });
              }),
              const SizedBox(height: 20),
              
              itemProfile('Phone', phone, CupertinoIcons.phone, () {
                _editProfileItem('Phone', phone, (newValue) {
                  setState(() {
                    phone = newValue;
                  });
                });
              }),
              const SizedBox(height: 20),
        
              itemProfile('Address', address, CupertinoIcons.location, () {
                _editProfileItem('Address', address, (newValue) {
                  setState(() {
                    address = newValue;
                  });
                });
              }),
              const SizedBox(height: 20),
        
              itemProfile('Email', email, CupertinoIcons.mail, () {
                _editProfileItem('Email', email, (newValue) {
                  setState(() {
                    email = newValue;
                  });
                });
              }),
              const SizedBox(height: 20),
        
              // Button to save or edit profile
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brightOrange1, // Set background color
                    padding: const EdgeInsets.all(15), // Set padding
                  ),
                  onPressed: () {
                    // Logic to save profile
                  },
                  child: const Text('Save Changes'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget to show each profile item with edit capability
  itemProfile(String title, String subtitle, IconData iconData, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: const Color.fromARGB(255, 211, 159, 3).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
        onTap: onTap, // Trigger the onTap function passed as argument
      ),
    );
  }
}
