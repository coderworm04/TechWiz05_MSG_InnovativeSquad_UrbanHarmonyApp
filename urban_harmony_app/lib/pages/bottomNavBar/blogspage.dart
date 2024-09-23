import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';
import 'package:urban_harmony_app/consts/fontstyles-consts.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/custombottomnavigationbar.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  int currentPageIndex = 2;

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
                Text("Blogs",style: TextStyle(
                  fontSize: 25,
                  fontWeight:FontWeight.w500,
                  fontFamily: bold, 
                ),),
                SvgPicture.asset(ForwardIcon)
              ],),
              SizedBox(height: 20),
              // Blog post items
              BlogPostCard(
                imageUrl: DemoImage0,
                title: "Understanding Modern Interior Design",
                description: "Explore the trends and ideas in modern interior design.",
              ),
              BlogPostCard(
                imageUrl: DemoImage1,
                title: "Top 10 Furniture Trends of 2024",
                description: "A deep dive into this year's furniture trends.",
              ),
              BlogPostCard(
                imageUrl: DemoImage3,
                title: "Maximizing Small Spaces",
                description: "Tips and tricks for making the most of small areas.",
              ),
              // Add more BlogPostCard as needed
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

class BlogPostCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const BlogPostCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Blog post image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}