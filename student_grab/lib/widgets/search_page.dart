import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_grab/models/user.dart';
import 'package:student_grab/widgets/driver_list_page.dart';

class SearchPage extends StatefulWidget {
  final User user;

  SearchPage({required this.user});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for a Ride'),
        backgroundColor: Color.fromARGB(255, 120, 187, 243),
        foregroundColor: Color.fromARGB(255, 21, 0, 50),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background-home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Color.fromARGB(255, 222, 240, 255),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        'Enter Ride Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _pickupController,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'Pickup Location',
                          hintText: 'Enter pickup location',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _destinationController,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'Destination Location',
                          hintText: 'Enter destination location',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_searching),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _selectDateAndTime(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        child: Text(
                          'Select Date and Time',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _simulateDriverAvailability(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        child: Text(
                          'Search for Drivers',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectDateAndTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _selectedTime = pickedTime;
        });
      }
    }
  }

  void _simulateDriverAvailability(BuildContext context) {
    final driverList = Provider.of<DriverList>(context, listen: false);
    driverList.clearDrivers();

    final pickupLocation = _pickupController.text;
    final destinationLocation = _destinationController.text;

    driverList.addDriver(
      Driver(
        id: 'D11',
        name: 'Ahmad Albab',
        vehicleType: 'Myvi',
        vehicleRegistration: 'AM 261 S',
        contactNumber: '011-2374362',
        rideRequest: RideRequest(
          pickupLocation: pickupLocation,
          destinationLocation: destinationLocation,
          dateTime: _selectedDate,
        ),
        image: 'images/person1.jpeg',
      ),
    );
    driverList.addDriver(
      Driver(
        id: 'D22',
        name: 'Farah Zuliana',
        vehicleType: 'Bezza',
        vehicleRegistration: 'RS 823 W',
        contactNumber: '010-6734829',
        rideRequest: RideRequest(
          pickupLocation: pickupLocation,
          destinationLocation: destinationLocation,
          dateTime: _selectedDate,
        ),
        image: 'images/person2.jpeg',
      ),
    );
    driverList.addDriver(
      Driver(
        id: 'D31',
        name: 'Osman Mansor',
        vehicleType: 'Alza',
        vehicleRegistration: 'AL 823 Z',
        contactNumber: '017-9437221',
        rideRequest: RideRequest(
          pickupLocation: pickupLocation,
          destinationLocation: destinationLocation,
          dateTime: _selectedDate,
        ),
        image: 'images/person1.jpeg',
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DriverListPage()),
    );
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
