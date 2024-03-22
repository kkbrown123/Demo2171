import 'package:demo2171/RegisteredClubs.dart';
import 'package:demo2171/SearchPage.dart';
import 'package:demo2171/main.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  List<dynamic> profileLst = [];
  MenuPage({super.key, required this.profileLst});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        title: const Center(
            child: Text(
          "Main Menu",
          style: TextStyle(
              color: Colors.white,
              fontFamily: '/assets/fonts/Poppins/Poppins-ExtraLight.ttf/'),
        )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Registered Clubs screen
                print('Navigate to Registered Clubs');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisteredClubs(
                      profileLst: getLst(),
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Registered Clubs'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Club Search screen
                print('Navigate to Club Search');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClubSearch(
                      profileList: getLst(),
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Club Search'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Notifications screen
                print('Navigate to Notifications');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Notifications'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to User Profile screen
                print('Navigate to User Profile');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('User Profile'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> getLst() {
    return profileLst;
  }
}
