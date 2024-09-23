import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/fontstyles-consts.dart';

class TabWithFiltersWidget extends StatefulWidget {
  @override
  _TabWithFiltersWidgetState createState() => _TabWithFiltersWidgetState();
}

class _TabWithFiltersWidgetState extends State<TabWithFiltersWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String selectedCategory = 'All'; // Default selected category
  final List<String> categories = [
    'All',
    'Furniture',
    'Lighting',
    'Decor',
    'Rugs and Carpets',
    'Wall Art',
    'Curtains and Blinds'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: bold,
                ),
              ),
              // Search Icon
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Filter Icon with PopupMenuButton for categories
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.filter_list, color: Colors.black), // Filter Icon
                onSelected: (String selected) {
                  setState(() {
                    selectedCategory = selected;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return categories.map<PopupMenuEntry<String>>((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),

        // Display a Card based on the selected category
        if (selectedCategory != 'All')
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  ' $selectedCategory',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
