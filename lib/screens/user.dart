import 'dart:io';
import 'package:LanguageLearningApp/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(LanguageLearningApp());
}

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACCOUNT',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('ACCOUNT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            // _imageFile == null
            //     ? Text("No Image choosen")
            //     : Image.file(_imageFile),
            // ElevatedButton(
            //   onPressed: () {
            //     pickImage();
            //   },
            //   child: Icon(Icons.add_a_photo),
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       upladImage();
            //     },
            //     child: Text("upload image")),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/files/jack.jpeg'),
            ),
            SizedBox(
              height: 20,
            ),
            itemProfile('NAME', 'JACK', CupertinoIcons.person),
            SizedBox(
              height: 10,
            ),
            itemProfile('MOBILE', '9533388462', CupertinoIcons.phone),
            SizedBox(
              height: 10,
            ),
            itemProfile('ADDRESS', 'Telangana address, HYDERABAD city',
                CupertinoIcons.location),
            SizedBox(
              height: 10,
            ),
            itemProfile(
                'EMAIL', 'srinusrinivas1359@gmail.com', CupertinoIcons.mail),
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

// Future pickImage() async {
//   var file = await ImagePicker.pickImage(source: ImageSource.gallery);
//   setState(() {
//     _imageFile = file;
//   });
// }
}
