import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';

class TabWithFiltersWidget extends StatefulWidget {
  @override
  _TabWithFiltersWidgetState createState() => _TabWithFiltersWidgetState();
}

class _TabWithFiltersWidgetState extends State<TabWithFiltersWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
              Expanded(
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                      fontSize: 16, // Adjusted font size for better visibility
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 3.0, 
                      ),
                    ),
                    tabs: [
                      
                      Tab(
                        child: Text(
                          'Explore',
                          style: TextStyle(
                            fontSize: 25, 
                            fontWeight: FontWeight.w800,
                            fontFamily: bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Follow',
                          style: TextStyle(
                             fontSize: 20, 
                            fontWeight: FontWeight.w800,
                            fontFamily: bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Search Icon
              IconButton(
                icon: Icon(Icons.search, color: Colors.black,),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
        
        // Filter Buttons below the TabBar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterButton(label: 'All', isSelected: true),
              FilterButton(label: 'Tropical'),
              FilterButton(label: 'Luxury'),
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.black),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Custom Filter Button widget
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  FilterButton({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

