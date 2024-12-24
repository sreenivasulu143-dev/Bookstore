import 'dart:io';

import 'package:LanguageLearningApp/main.dart';
import 'package:LanguageLearningApp/models/Datauser.dart';
import 'package:LanguageLearningApp/screens/home_screen.dart';
import 'package:LanguageLearningApp/screens/login.dart';
import 'package:LanguageLearningApp/screens/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _imageFile = null;
  bool isLoading = false;
  TextEditingController _UsernametextEditingController =
      TextEditingController();
  TextEditingController _GendertextEditingController = TextEditingController();
  TextEditingController _mobiletextEditingController = TextEditingController();
  TextEditingController _AddresstextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((firebaseuser) {
      if (firebaseuser == null) {
        // user not logged in
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Login()),
            (Route<dynamic> rr) => false);
      } else {
        //user already login
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        title: Text("profile"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((onValue) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistrationScreen()));
                });
              }),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  _imageFile == null
                      ? Text("no image choosen")
                      : Image.file(
                          _imageFile!,
                          height: 150,
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Icon(Icons.add_a_photo)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _UsernametextEditingController,
                    decoration: InputDecoration(
                        hintText: "enter name",
                        labelText: "User name",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _mobiletextEditingController,
                    decoration: InputDecoration(
                        hintText: "enter Mobile number",
                        labelText: "Mobile",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _GendertextEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter Gender",
                        labelText: "Gender",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextField(
                  //   controller: ,
                  //   decoration: InputDecoration(
                  //       hintText: "enter Mobile number",
                  //       labelText: "Mobile",
                  //       border: OutlineInputBorder()),
                  // ),
                  TextField(
                    controller: _AddresstextEditingController,
                    decoration: InputDecoration(
                        hintText: " enter Address",
                        labelText: "Address",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mybottom(),
                            ));
                        uploadImage();
                        uploadStatus();
                      },
                      child: Text("Upload Details"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future pickImage() async {
    var file =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file as File?;
    });
  }

  uploadStatus() async {
    setState(() {
      isLoading = true;
    });
    var imageUpload = await uploadImage();
    Datauser dataUser = new Datauser(
        docid: '',
        imageURL: '',
        Username: '',
        Gender: '',
        Address: '',
        mobile: '');
    dataUser.imageURL = imageUpload.toString();
    dataUser.Username = _UsernametextEditingController.text;
    dataUser.mobile = _mobiletextEditingController.text;
    dataUser.Gender = _GendertextEditingController.toString();
    dataUser.Address = _AddresstextEditingController.text;
    // String docId =
    // FirebaseFirestore.instance.collection("path").document().documentID;
    //dataUser.docid = docId;
    //await FirebaseFirestore.instance
    //.collection("user")
    //.document(dataUser.docid)
    //.setData(dataUser.toMap());
    Fluttertoast.showToast(msg: "details uploaded");

    // setState(() {
    // isLoading = false;
    // });
  }

  Future<dynamic> uploadImage() async {
    // setState(() {
    //   isLoading = true;
    // });
    FirebaseStorage storage = await FirebaseStorage.instance;
    Reference ref = storage.ref().child("path" + DateTime.now().toString());
    // UploadTask uploadTask = await ref.putFile(path);
    //uploadTask.then((res) {
    // res.ref.getDownloadURL();
    //});
    //TaskSnapshot snapshot = await UploadTask.onComplete;
    //var downloadURl = await snapshot.ref.getDownloadURL();
    Fluttertoast.showToast(msg: "image uploaded");
    // print("downloadURl $downloadURl");
    // setState(() {
    //   isLoading = false;
    // });
    //return downloadURl;
  }
}
