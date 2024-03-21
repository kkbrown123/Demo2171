import 'package:demo2171/information.dart';
import 'package:demo2171/menu.dart';
import 'package:flutter/material.dart';

class ClubList extends StatefulWidget {
  List<dynamic> profileList;
  ClubList({super.key, required this.profileList});

  @override
  _ClubListState createState() => _ClubListState(profileList: profileList);
}

class _ClubListState extends State<ClubList> {
  List<dynamic> profileList;
  _ClubListState({required this.profileList});
  final TextEditingController _searchController = TextEditingController();
  InformationPage info = InformationPage();
  List<dynamic> lst = [];
  List<dynamic> RegisterLst = [];

  List<dynamic> filteredList = [];

  @override
  void initState() {
    super.initState();
    lst = info.getLst();
    filteredList = lst;
    RegisterLst = profileList;
  }

  void _filterList(String query) {
    setState(() {
      filteredList = lst
          .where((club) =>
              club["ClubName"].toLowerCase().contains(query.toLowerCase()) ||
              club["ClubPres"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print(RegisterLst);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuPage(profileLst: RegisterLst)));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        title: TextField(
          controller: _searchController,
          onChanged: _filterList,
          decoration: const InputDecoration(
            hintText: 'Search by ClubName or ClubPres',
            hintStyle: TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
          ),
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${filteredList[index]["ClubName"]}@ ${filteredList[index]["meetTime"]} on ${filteredList[index]["meetDay"]}'),
            subtitle: Text(
                '${filteredList[index]["ClubPres"]} contact @${filteredList[index]["email"]}'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Register'),
                    content:
                        const Text('Would you like to register for this Club?'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (RegisterLst.contains(filteredList[index])) {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Register Error'),
                                  content: const Text(
                                      'You Have already registered for this club '),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            Navigator.of(context).pop();
                            RegisterClub(filteredList[index]);
                          }
                        },
                        child: Text('Yes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                  ;
                },
              );
            },
          );
        },
      ),
    );
  }

  RegisterClub(dynamic profile) {
    RegisterLst.add(profile);
  }
}
