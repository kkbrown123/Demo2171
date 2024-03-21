import 'package:demo2171/ClubForum.dart';
import 'package:demo2171/SearchPage.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  List<dynamic> profileLst = [];
  MenuPage({super.key, required this.profileLst});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Registered Clubs screen
               
                print('Navigate to Registered Clubs');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClubForum(
                              profileLst: getLst(),
                            )));
              },
              child: Text('Registered Clubs'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Club Search screen
                print('Navigate to Club Search');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClubList(profileList: getLst(),)));
              },
              child: Text('Club Search'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Notifications screen
                print('Navigate to Notifications');
              },
              child: Text('Notifications'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to User Profile screen
                print('Navigate to User Profile');
              },
              child: Text('User Profile'),
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
