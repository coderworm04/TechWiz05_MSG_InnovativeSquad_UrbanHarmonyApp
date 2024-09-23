import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productsimage;
  final String designerName;
  final String designerimage;
  final String title;

  const ProductCard({
    Key? key,
    required this.productsimage,
    required this.designerName,
    required this.designerimage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              productsimage,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
  padding: const EdgeInsets.only(left: 11.0, bottom: 8.0),
  child: Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(designerimage),
        radius: 15,
      ),
      SizedBox(width: 10),
      Text(
        designerName,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ), 
      Spacer(), 
      Icon(
        Icons.favorite_border_outlined,
         size: 16, 
        color: Colors.grey,
      ),
      SizedBox(width: 10,),
      Icon(
        Icons.visibility,
        size: 16, 
        color: Colors.grey,
      ), 
      Text(
        '123', 
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    ],
  ),
),

        ],
      ),
    );
  }
}
