// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_harmony_app/consts/colors-consts.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';
import 'package:urban_harmony_app/widgets/bannerwidget.dart';
import 'package:urban_harmony_app/widgets/productcard.dart';
import 'package:urban_harmony_app/widgets/tabhome.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  // Sample dynamic data
  final List<Map<String, String>> designers = [
    {
      "productsimage": DemoImage0,
      "name": "Hassan",
      "designerimage" : DemoImage4,
      "title": "Interior Designer",
    },
    {
      "productsimage": DemoImage2,
      "name": "Hassan",
      "designerimage" : DemoImage3,
      "title": "Interior Designer",
    },
    {
      "productsimage": DemoImage1,
      "name": "Hassan",
      "designerimage" : DemoImage4,
      "title": "Interior Designer",
    },
    {
      "productsimage": DemoImage0,
      "name": "Hassan",
      "designerimage" : DemoImage4,
      "title": "Interior Designer",
    },
    // Add more designers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            BannerWidget(),
            TabWithFiltersWidget(),
            ...designers.map((designer) {
              return ProductCard( // Ensure you're using DesignerCard here
                productsimage: designer["productsimage"]!,
                title: designer["title"]!,
                designerName: designer["name"]!,
                designerimage: designer["designerimage"]!,
              );
            }).toList(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
