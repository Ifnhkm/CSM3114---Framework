import 'package:flutter/material.dart';

class DriverRegistrationPage extends StatefulWidget {
  @override
  _DriverRegistrationPageState createState() => _DriverRegistrationPageState();
}

class _DriverRegistrationPageState extends State<DriverRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _licenseIdController = TextEditingController();
  final TextEditingController _vehicleIdController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Registration'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Color.fromARGB(255, 222, 240, 255),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Driver Registration Form',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 8, 68, 172),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          icon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _contactNumberController,
                        keyboardType: TextInputType.phone,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'Contact Number',
                          icon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _licenseIdController,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'License ID',
                          icon: Icon(Icons.drive_eta),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _vehicleIdController,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'Vehicle ID Number',
                          icon: Icon(Icons.confirmation_number),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _vehicleTypeController,
                        validator: _validateInput,
                        decoration: InputDecoration(
                          labelText: 'Vehicle Type',
                          icon: Icon(Icons.directions_car),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _showRegistrationConfirmation(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                        child: Text(
                          'Register as Driver',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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

  void _showRegistrationConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Registration has been applied!',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        duration: Duration(seconds: 3),
      ),
    );

    Navigator.pop(context);
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
