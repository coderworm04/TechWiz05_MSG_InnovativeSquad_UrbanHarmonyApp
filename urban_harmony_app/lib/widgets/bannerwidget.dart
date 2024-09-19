import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner Image at the Top
        Container(
          width: double.infinity,
          height: 100.0, // Adjust height if needed
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(BannerImage), // Your image here
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
