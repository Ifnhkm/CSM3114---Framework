import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  String name = 'Irfan';
  String email = 'irfnrdzn@gmail.com';
  String phoneNumber = '011-3738235';
}

class RideRequest {
  String pickupLocation;
  String destinationLocation;
  DateTime dateTime;

  RideRequest({
    required this.pickupLocation,
    required this.destinationLocation,
    required this.dateTime,
  });
}

class Driver {
  String id;
  String name;
  String vehicleType;
  String vehicleRegistration;
  String contactNumber;
  RideRequest? rideRequest;
  String image;

  Driver({
    required this.id,
    required this.name,
    required this.vehicleType,
    required this.vehicleRegistration,
    required this.contactNumber,
    this.rideRequest,
    required this.image,
  });
}

class DriverList with ChangeNotifier {
  List<Driver> _drivers = [];

  List<Driver> get drivers => _drivers;

  void addDriver(Driver driver) {
    _drivers.add(driver);
  }

  void clearDrivers() {
    _drivers.clear();
  }
}
