import 'package:flutter/material.dart';
import 'package:urban_harmony_app/consts/colors-consts.dart';
import 'package:urban_harmony_app/consts/fontstyles-consts.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String _selectedDate = '';
  String _selectedDesigner = '';
  final List<String> designers = ['Designer 1', 'Designer 2', 'Designer 3'];
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Consultation', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: bold,
                    ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text('Choose a designer:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: designers.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedDesigner = newValue!;
                });
              },
              hint: Text('Select a designer'),
              validator: (value) =>
                  value == null ? 'Please select a designer' : null,
            ),
            SizedBox(height: 20),
            Text('Select a date:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text =
                        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                    _selectedDate = _dateController.text;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Special Instructions (Optional)',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    brightOrange1,
                    const Color.fromARGB(255, 253, 202, 50),
                    DeepOrange1,
                  ]),
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_selectedDesigner.isNotEmpty && _selectedDate.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Appointment booked successfully!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select all fields!')),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      "Submit Appointment",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: WhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
