import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_grab/models/user.dart';

class RequestRidePage extends StatelessWidget {
  final Driver driver;
  final DateTime date;
  final String pickupLocation;
  final String destinationLocation;

  RequestRidePage({
    required this.driver,
    required this.date,
    required this.pickupLocation,
    required this.destinationLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Ride'),
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
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Date : ${DateFormat.yMd().add_jm().format(date)}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Pickup Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(pickupLocation, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Destination Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(destinationLocation, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Card(
                  color: Color.fromARGB(255, 145, 251, 251),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Driver Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('${driver.image}'),
                            radius: 40,
                          ),
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Center(
                                child: Text(
                                  '${driver.name}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              subtitle: Center(
                                child: Text(
                                  '(${driver.vehicleType})',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.directions_car),
                              title: Text(
                                'Vehicle Registration',
                                style: TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                '${driver.vehicleRegistration}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone),
                              title: Text(
                                'Contact Number',
                                style: TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                '${driver.contactNumber}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Ride Requested'),
                        content: Text(
                          'Your ride with ${driver.name} (${driver.vehicleType}) has been requested. '
                          'Please wait for the driver to accept your request.',
                          style: TextStyle(fontSize: 16),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).popUntil(
                                  (route) => route.settings.name == '/');
                            },
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    primary: Color.fromARGB(255, 78, 155, 185),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.car_crash, size: 20),
                      SizedBox(width: 5),
                      Text('Request Ride', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
