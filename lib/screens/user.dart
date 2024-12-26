import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'account',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ProfileScreeen(),
    );
  }
}

class ProfileScreeen extends StatefulWidget {
  @override
  State<ProfileScreeen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreeen> {
  User? user;
  Map<String, dynamic>? userData;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection("B")
            .doc(user!.uid)
            //.doc("G6Z1irQvF9v4aY3WIbiO")
            .get();
        if (doc.exists) {
          setState(() {
            userData = doc.data() as Map<String, dynamic>?;
            isloading = false;
          });
        } else {
          print("document does not exist");
          setState(() {
            isloading = false;
          });
        }
      }
    } catch (e) {
      print('error fetching user data:$e');
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        title: Text("profile"),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : userData != null
              ? Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/files/jack.jpeg'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      itemProfile('NAME', userData?['Username'] ?? '',
                          CupertinoIcons.person),
                      SizedBox(
                        height: 10,
                      ),
                      itemProfile('MOBILE', userData?['mobile'] ?? '',
                          CupertinoIcons.phone),
                      SizedBox(
                        height: 10,
                      ),
                      itemProfile('ADDRESS', userData?['Address'] ?? '',
                          CupertinoIcons.location),
                      SizedBox(
                        height: 10,
                      ),
                      itemProfile('GENDER', userData?['Gender'] ?? '',
                          CupertinoIcons.person),
                      SizedBox(
                        height: 10,
                      ),
                      itemProfile('EMAIL', 'srinusrinivas1359@gmail.com',
                          CupertinoIcons.mail),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                          ),
                          child: Text('Edit Profile'),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text('no data availale'),
                ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.deepOrange.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}

// Future pickImage() async {
//   var file = await ImagePicker.pickImage(source: ImageSource.gallery);
//   setState(() {
//     _imageFile = file;
//   });
// }
