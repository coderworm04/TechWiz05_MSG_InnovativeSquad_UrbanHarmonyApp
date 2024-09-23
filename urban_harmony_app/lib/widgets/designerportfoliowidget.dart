import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';

class DesignersProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const DesignersProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(name, style: TextStyle(
                fontFamily: bold, 
              ),),
        ],
      ),
    );
  }
}
