// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/colors-consts.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/pages/signinpage.dart'; // Import your SignInPage

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordVisible = false; 

  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  String? _selectedRole; // For storing selected role
  final List<String> _roles = ['Customer', 'Designer']; // Role options

void _signUp() {
  if (_formKey.currentState!.validate()) {
    // API call logic can be added here
    print('Username: ${_usernameController.text}, Email: ${_emailController.text}, Password: ${_passwordController.text}, Role: $_selectedRole');
    
    // Navigate to SignInPage after successful sign-up
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigningPage()), // Navigate to SignInPage
    );
  }
}

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  brightOrange1,
                  LightOrange1,
                  DeepOrange1,
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 22,),
                child: Text(
                  "Welcome\nSign up",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: WhiteColor,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30.0),
                  child: SingleChildScrollView(
                     child: Form(
                    key: _formKey, // Wrap form with the formKey
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            label: Text(
                              "Username",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: DeepOrange1,
                              ),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: DeepOrange1, width: 1.5)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check, color: Colors.grey),
                            label: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: DeepOrange1,
                              ),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: DeepOrange1, width: 1.5)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible, 
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: DeepOrange1,
                              ),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: DeepOrange1, width: 1.5)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _selectedRole,
                          hint: Text(
                            "Select Role",
                            style: TextStyle(color: DeepOrange1),
                          ),
                          items: _roles.map((String role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRole = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: DeepOrange1, width: 1.5)),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a role';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              brightOrange1,
                              const Color.fromARGB(255, 253, 202, 50),
                              DeepOrange1,
                            ]),
                          ),
                          child: GestureDetector(
                            onTap: _signUp, // Call sign-up function
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: WhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SigningPage()), // Navigate to SignInPage
                                  );
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: DeepOrange1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
               
                  ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
