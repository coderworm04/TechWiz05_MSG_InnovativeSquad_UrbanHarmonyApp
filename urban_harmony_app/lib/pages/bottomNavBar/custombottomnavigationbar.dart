import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_harmony_app/consts/colors-consts.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
// Import Badge if it's from a package, e.g. import 'package:your_package/badge.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final void Function(int) onDestinationSelected;

  const CustomBottomNavigationBar({
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: (index) {
        onDestinationSelected(index);
        // Navigate to the respective page
        String routeName;
        switch (index) {
          case 0:
            routeName = '/';
            break;
          case 1:
            routeName = '/designspage';
            break;
          case 2:
            routeName = '/blogspage';
            break;
          case 3:
            routeName = '/notificationpage';
            break;
          case 4:
            routeName = '/profilepage';
            break;
          default:
            routeName = '/';
        }
        Navigator.pushReplacementNamed(context, routeName);
      },
      indicatorColor: brightOrange1,
      selectedIndex: currentPageIndex,
      destinations: <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(Icons.public_sharp),
          icon: Icon(Icons.public_sharp),
          label: 'home',
        ),
        NavigationDestination(
          icon: Icon(Icons.brush),
          label: 'design',  
        ),
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            BlogIcon,
            width: 22.5,
            height: 22.5,
            color: Colors.black, 
          ),
          icon: SvgPicture.asset(
            BlogIcon,
            width: 22.5,
            height: 22.5,
            color: const Color.fromARGB(255, 58, 58, 58), 
          ),
          label: 'Design',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_2_rounded),
          label: 'profile',
        ),
      ],
    );
  }
}
