// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                InkWell(
                
                         onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(BackIcon),
                       ),
                       SizedBox(width: 20,),
                        Text(
                                             "Contact Us",
                                             style: TextStyle(
                                               fontSize: 25,
                                               fontWeight: FontWeight.w500,
                                               fontFamily: bold,
                                             ),
                                           ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Message'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _message = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
                SizedBox(height: 20),
                Text('Email: support@urbanharmony.com'),
                Text('Phone: +123-456-7890'),
                Text('Office: Urban Harmony HQ, City, Country'),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(FacebookIcon, height: 20, width: 20,),
                    SizedBox(width: 10,),
                    SvgPicture.asset(InstagramIcon,height: 20, width: 20,),
                    SizedBox(width: 10),
                    SvgPicture.asset(LinkedinIcon, height: 20, width: 20,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
