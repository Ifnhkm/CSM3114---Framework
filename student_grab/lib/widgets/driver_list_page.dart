import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_grab/models/user.dart';
import 'package:student_grab/widgets/request_ride_page.dart';
import 'package:student_grab/widgets/search_page.dart';

class DriverListPage extends StatefulWidget {
  @override
  _DriverListPageState createState() => _DriverListPageState();
}

class _DriverListPageState extends State<DriverListPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SearchPage(user: User())),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Driver List'),
          backgroundColor: Color.fromARGB(255, 120, 187, 243),
          foregroundColor: Color.fromARGB(255, 52, 44, 63),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background-home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<DriverList>(
              builder: (context, driverList, child) {
                final filteredDrivers = _filterDrivers(driverList.drivers);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    SizedBox(height: 20),
                    Text(
                      'Available Drivers',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredDrivers.length,
                        itemBuilder: (context, index) {
                          final driver = filteredDrivers[index];
                          return Card(
                            color: Color.fromARGB(255, 196, 233, 235),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16),
                              title: Text(
                                '${driver.name} (${driver.vehicleType})',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ID Number: ${driver.id}'),
                                  Text(
                                      'Vehicle Registration: ${driver.vehicleRegistration}'),
                                  Text(
                                      'Contact Number: ${driver.contactNumber}'),
                                ],
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  _requestRide(context, driver);
                                },
                                child: Text('Request Ride'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: 'Search for drivers...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
            setState(() {});
          },
        ),
      ),
    );
  }

  List<Driver> _filterDrivers(List<Driver> drivers) {
    final query = _searchController.text.toLowerCase();
    return drivers.where((driver) {
      return driver.name.toLowerCase().contains(query) ||
          driver.vehicleType.toLowerCase().contains(query);
    }).toList();
  }

  void _requestRide(BuildContext context, Driver driver) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RequestRidePage(
          driver: driver,
          date: driver.rideRequest?.dateTime ?? DateTime.now(),
          pickupLocation: driver.rideRequest?.pickupLocation ?? "N/A",
          destinationLocation: driver.rideRequest?.destinationLocation ?? "N/A",
        ),
      ),
    ).then((value) {});
  }
}
