import 'package:demo2171/RegisteredClubs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class clubProfile extends StatelessWidget {
  dynamic profile;
  clubProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final TextEditingController clubName = TextEditingController();
    final TextEditingController clubPres = TextEditingController();
    final TextEditingController socialMedia = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController meetDay = TextEditingController();
    final TextEditingController meetTime = TextEditingController();

    clubName.text = profile["ClubName"];
    clubPres.text = profile["ClubPres"];
    socialMedia.text = profile["SocialMedia"];
    email.text = profile["email"];
    phone.text = profile["phone"];
    meetDay.text = profile["meetDay"];
    meetTime.text = profile["meetTime"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        title: const Center(
            child: Text(
          "Club Profile",
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
            onPressed: () {
              print(profile);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Club Name",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(clubName),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Club President",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(clubPres),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Social Media",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(socialMedia),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Email",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(email),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Phone Number",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(phone),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Meet Time",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(meetTime),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Meet Day",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(meetDay)
        ],
      ),
    );
  }

  Widget textfield(TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 10),
      child: SizedBox(
        height: 60,
        width: 350,
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: textEditingController,
          onChanged: (value) {
            value = value;
          },
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 1, 43, 119),
            filled: true,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
            contentPadding: const EdgeInsets.only(left: 14, top: 23),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
