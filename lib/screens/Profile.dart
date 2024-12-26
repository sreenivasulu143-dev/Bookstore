import 'dart:io';
import 'package:LanguageLearningApp/models/Datauser.dart';
import 'package:LanguageLearningApp/screens/bottomnav.dart';
import 'package:LanguageLearningApp/screens/login.dart';
import 'package:LanguageLearningApp/screens/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _imageFile;

  bool isLoading = false;
  TextEditingController _UsernametextEditingController =
      TextEditingController();
  TextEditingController _GendertextEditingController = TextEditingController();
  TextEditingController _mobiletextEditingController = TextEditingController();
  TextEditingController _AddresstextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null) {
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
              icon: Icon(Icons.logout),
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

  // Future pickImage() async {
  //   var file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (file != null) {
  //       _imageFile = File(file.path);
  //     }
  //   });
  // }

  uploadStatus() async {
    setState(() {
      isLoading = true;
    });
    //var imageUpload = await uploadImage();
    Datauser dataUser = Datauser(
        docid: '',
        imageURL: '',
        Username: _UsernametextEditingController.text,
        mobile: _mobiletextEditingController.text,
        Gender: _GendertextEditingController.text,
        Address: _AddresstextEditingController.text);
    String docId = FirebaseFirestore.instance.collection("B").doc().id;
    dataUser.docid = docId;
    await FirebaseFirestore.instance
        .collection("B")
        .doc(dataUser.docid)
        .set(dataUser.toMap());
    Fluttertoast.showToast(msg: "details uploaded");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Mybottom()));

    setState(() {
      isLoading = false;
    });
  }

//   Future<dynamic> uploadImage() async {
//     setState(() {
//       isLoading = true;
//     });
//     FirebaseStorage storage = await FirebaseStorage.instance;
//     Reference ref = storage.ref().child("A" + DateTime.now().toString());
//     UploadTask uploadTask = ref.putFile(_imageFile!);
//     TaskSnapshot snapshot = await uploadTask;
//     uploadTask.then((res) {
//       res.ref.getDownloadURL();
//     });
//     var downloadURl = await snapshot.ref.getDownloadURL();
//     Fluttertoast.showToast(msg: "image uploaded");
//     print("downloadURl $downloadURl");
//     setState(() {
//       isLoading = false;
//     });
//     return downloadURl;
//   }
}
