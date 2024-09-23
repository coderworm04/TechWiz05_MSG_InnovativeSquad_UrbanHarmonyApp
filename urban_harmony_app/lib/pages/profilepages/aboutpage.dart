import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_harmony_app/consts/export-consts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                       InkWell(
                         onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(BackIcon),
                       ),
                       SizedBox(width: 20,),
                        Text(
                                             "About Us",
                                             style: TextStyle(
                                               fontSize: 25,
                                               fontWeight: FontWeight.w500,
                                               fontFamily: bold,
                                             ),
                                           ),
                  
                ],
              ),
            SizedBox(height: 10),
            Text(
              'Our mission is to make home interiors accessible and easy for everyone. Urban Harmony offers a comprehensive platform for design inspirations, products, and professional consultations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Virtual design catalogs'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Professional consultation bookings'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('High-quality product listings'),
            ),
            SizedBox(height: 20),
            Image.asset(DemoImage0), 
            SizedBox(height: 20),
            Text(
              'Contact us for more information about our services.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
