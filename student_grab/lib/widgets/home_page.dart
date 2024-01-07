import 'package:flutter/material.dart';
import 'package:student_grab/models/user.dart';
import 'package:student_grab/widgets/driver_registration_page.dart';
import 'package:student_grab/widgets/search_page.dart';
import 'package:student_grab/widgets/feedback.dart';

class HomePage extends StatelessWidget {
  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Grab Application'),
        backgroundColor: Color.fromARGB(255, 120, 187, 243),
        foregroundColor: Color.fromARGB(255, 21, 0, 50),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background-home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            right: 30,
            child: Image.asset(
              'images/logostudentgrab.png',
              width: 250,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Welcome,',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${user.name}!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildRoundedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(user: user),
                        ),
                      );
                    },
                    label: 'Search for a Ride',
                    icon: Icons.search,
                    backgroundColor: Colors.transparent,
                    textColor: Color.fromARGB(255, 29, 31, 147),
                    borderColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  _buildRoundedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverRegistrationPage(),
                        ),
                      );
                    },
                    label: 'Register as Driver',
                    icon: Icons.drive_eta,
                    backgroundColor: Colors.transparent,
                    textColor: Color.fromARGB(255, 29, 31, 147),
                    borderColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoText(
                  icon: Icons.email,
                  label: user.email,
                ),
                SizedBox(height: 8),
                _buildInfoText(
                  icon: Icons.phone,
                  label: user.phoneNumber,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                _showFeedbackBottomSheet(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                primary: Color.fromARGB(255, 86, 163, 208),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Icon(
                Icons.feedback,
                size: 25,
                color: Color.fromARGB(255, 18, 36, 101),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FeedbackForm();
      },
    );
  }

  Widget _buildInfoText({
    required IconData icon,
    required String label,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildRoundedButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required Color borderColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onPrimary: textColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textColor,
            size: 24,
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
