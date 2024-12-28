import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: user != null
          ? StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("B")
                  .doc(user!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data?.data() == null) {
                  return Center(child: Text("No data available"));
                }
                Map<String, dynamic>? userData =
                    snapshot.data?.data() as Map<String, dynamic>?;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: userData?["imageURL"] != null &&
                                    userData?["imageURL"]!.isNotEmpty
                                ? Image.network(
                                    userData?["imageURL"] ?? '',
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                    errorBuilder: (context, object, stack) {
                                      return Container(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.redAccent,
                                        ),
                                      );
                                    },
                                  )
                                : Icon(Icons.person, size: 35),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ProfileItem(
                        title: 'Username',
                        value: userData?['Username'] ?? 'N/A',
                        iconData: Icons.person_outline,
                      ),
                      ProfileItem(
                        title: 'Phone',
                        value: userData?['mobile'] ?? 'N/A',
                        iconData: Icons.phone_outlined,
                      ),
                      ProfileItem(
                        title: 'Address',
                        value: userData?['Address'] ?? 'N/A',
                        iconData: Icons.telegram_outlined,
                      ),
                      ProfileItem(
                        title: 'Gender',
                        value: userData?['Gender'] ?? 'N/A',
                        iconData: Icons.person_outline,
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(child: Text('No user logged in')),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.value,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Icon(iconData),
          trailing: Text(value.isEmpty ? 'N/A' : value),
        ),
        Divider(color: Colors.white60),
      ],
    );
  }
}
