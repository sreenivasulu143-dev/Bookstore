import 'package:LanguageLearningApp/screens/Profile.dart';
import 'package:LanguageLearningApp/screens/login.dart';
import 'package:LanguageLearningApp/screens/home_screen.dart';
import 'package:LanguageLearningApp/screens/login.dart';
import 'package:LanguageLearningApp/screens/quiz_detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email, _password;
  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        title: Text(
          "Register",
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (items) {
                          return items!.contains("@")
                              ? null
                              : "Enter valid email";
                        },
                        onChanged: (item) {
                          setState(() {
                            _email = item;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Email',
                            labelText: 'Email',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        validator: (items) {
                          return items!.length > 6
                              ? null
                              : "Password must be 6 characters";
                        },
                        onChanged: (item) {
                          setState(() {
                            _password = item;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        //color: Colors.blue,
                        child: ElevatedButton(
                          onPressed: () {
                            signup();
                          },
                          child: Text(
                            'Register',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Login()));
                            },
                            child: Text("login in")),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void signup() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "register successfull");
        //
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Profile()),
            (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "Error" + onError.toString());
      });
    }
  }
}
