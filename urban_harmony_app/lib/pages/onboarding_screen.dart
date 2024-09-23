// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/pages/homepage.dart';
import 'package:urban_harmony_app/pages/signinpage.dart';
import 'package:urban_harmony_app/pages/signuppage.dart';
// import 'package:urban_harmony_app/pages/signuppage.dart'; // Uncomment and replace with correct path

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, String>> onBoardingData = [
    {
      "image": DemoImage1,
      "title": 'Transform Your Home',
      "description": 'Creating a comfortable and beautiful home for your loved ones.'
    },
    {
      "image": DemoImage3,
      "title": 'Stylish Home Makeover',
      "description": 'Enhance your home with tailored designs and stylish furniture'
    },
    {
      "image": DemoImage2,
      "title": 'Welcome Back',
      "description": ''
    },
  ];

  PageController pageController = PageController();

  int currentPage = 0;

  void onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brightOrange1,
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    onBoardingData[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5), 
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (index == onBoardingData.length - 1)
                            Padding(
                              padding: const EdgeInsets.only(top: 50), 
                              child: Image.asset(
                                AppLogoIcon, 
                                width: 100, 
                                height: 100,
                              ),
                            ),
                          Text(
                            onBoardingData[index]['title']!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              onBoardingData[index]['description']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: (currentPage == onBoardingData.length - 1)
                ? Container(
                  
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SigningPage()),
                                );
                              },  
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: WhiteColor, width: 2)
                            // gradient: LinearGradient(colors: [
                            //   brightOrange1,
                            //   const Color.fromARGB(255, 253, 202, 50),
                            //   DeepOrange1
                            // ]),
                          ),
                          child: Center(
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: WhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                        const SizedBox(height: 10),
                        GestureDetector(
                        onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignupPage()), // Navigate to SignInPage
                                );
                              },  
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              brightOrange1,
                              const Color.fromARGB(255, 253, 202, 50),
                              DeepOrange1
                            ]),
                          ),
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
                        const SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     ElevatedButton(
                        //       onPressed: () => Navigator.of(context).push(
                        //         MaterialPageRoute(builder: (context) => const SigningPage()),
                        //       ),
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: brightOrange1,
                        //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        //         minimumSize: const Size(120, 60),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //       ),
                        //       child: Text(
                        //         'Sign In',
                        //         style: TextStyle(
                        //           color: WhiteColor,
                        //           fontFamily: semibold,
                        //           fontSize: 17,
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 20),
                        //     ElevatedButton(
                        //       onPressed: () => Navigator.of(context).push(
                        //         MaterialPageRoute(
                        //           builder: (context) => const SignupPage(),
                        //         ), // Replace with your SignUp Page
                        //       ),
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: brightOrange1,
                        //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        //         minimumSize: const Size(120, 60),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //       ),
                        //       child: Text(
                        //         'Sign Up',
                        //         style: TextStyle(
                        //           color: WhiteColor,
                        //           fontFamily: semibold,
                        //           fontSize: 17,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
