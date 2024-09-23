// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';
import 'package:urban_harmony_app/pages/products/detail_page.dart';
import 'package:urban_harmony_app/widgets/categorywidget.dart';
import 'package:urban_harmony_app/widgets/designerportfoliowidget.dart';

class DesignsPage extends StatefulWidget {
  const DesignsPage({super.key});

  @override
  _DesignsPageState createState() => _DesignsPageState();
}

class _DesignsPageState extends State<DesignsPage> {
  int currentPageIndex = 1;

  final List<Map<String, String>> designers = [
    {
      "imageUrl": DemoImage0,
      "name": "Nabeel",
    },
    {
      "imageUrl": DemoImage0,
      "name": "Neha",
    },
    {
      "imageUrl": DemoImage0,
      "name": "Mazz",
    },
    {
      "imageUrl": DemoImage0,
      "name": "Ebad",
    },
    ];

    final List<Map<String, String>> categorys = [
    {
      "categoryimage": DemoImage0,
      "title": "Furniture",
    },
    {
      "categoryimage": DemoImage2,
      "title": "Lighting",
    },
    {
      "categoryimage": DemoImage0,
      "title": "Decor",
    },
    {
      "categoryimage": DemoImage2,
      "title": "Rugs and Carpets",
    },
    ];

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
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Top Designer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: bold,
                    ),
                  ),
                  SvgPicture.asset(ForwardIcon),
                ],
              ),
              SizedBox(height: 30),
        
              // Top designer data start
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: designers.map((designer) {
                    return DesignersProfileCard(
                      imageUrl: designer["imageUrl"]!,
                      name: designer["name"]!,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categorys",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: bold,
                    ),
                  ),
                  SvgPicture.asset(ForwardIcon),
                ],
              ),
              SizedBox(height: 30,), 
              ...categorys.map((categorys) {
              return CategoryCard(  
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(),  
                    ),
      );
    },
                categoryimage: categorys["categoryimage"]!,
                title: categorys["title"]!,
              );
            }).toList(),
          
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Gallery Design",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: bold,
                    ),
                  ),
                  SvgPicture.asset(ForwardIcon),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(DemoImage0), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: (MediaQuery.of(context).size.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage("assets/images/image_2.png"), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: (MediaQuery.of(context).size.width - 80) / 2,
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage("assets/images/image_3.png"), fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      Container(
                        width: (MediaQuery.of(context).size.width - 80) / 2,
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage("assets/images/image_4.png"), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: (MediaQuery.of(context).size.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage("assets/images/image_5.png"), fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
