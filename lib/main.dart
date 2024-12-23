import 'package:LanguageLearningApp/providers/favorite_provider.dart';
import 'package:LanguageLearningApp/screens/Profile.dart';
import 'package:LanguageLearningApp/screens/cart_details.dart';
import 'package:LanguageLearningApp/screens/home_screen.dart';
import 'package:LanguageLearningApp/screens/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LanguageLearningApp/screens/quiz_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:LanguageLearningApp/screens/user.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LanguageLearningApp());
}

class LanguageLearningApp extends StatefulWidget {
  @override
  State<LanguageLearningApp> createState() => _LanguageLearningAppState();
}

class _LanguageLearningAppState extends State<LanguageLearningApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ],
          child: MaterialApp(
              title: ' Story Books',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorSchemeSeed: Colors.red,
                scaffoldBackgroundColor: Colors.white,
              ),
              //home: RegistrationScreen(),

              home: Scaffold(
                // appBar: AppBar(
                //   title: Text(
                //     'BOOKS STORE ',
                //     // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // centerTitle: true,
                // actions: [
                // IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoriteScreen(),)), icon: const Icon(Icons.add_shopping_cart),),
                // ],
                //  leading: Icon(
                //   Icons.sort,
                //    size: 28,
                //  ),
                // backgroundColor: Colors.white,
                // elevation: 0,
                //),
                //   actions: [
                //     Padding(
                //       padding: EdgeInsets.only(right: 16),
                //       child: Icon(
                //         Icons.search,
                //         color: Colors.grey,
                //         size: 28,
                //       ),
                //     ),
                //   ],
                //   // IconButton(
                // ),
                body: Profile(),
                //RegistrationScreen(),
                //Mybottom(),
              )));
//Mybottom(), //Scaffold(
//appBar: AppBar(title: Text('Home')),
}

class Mybottom extends StatefulWidget {
  @override
  State<Mybottom> createState() => _MybottomState();
}

class _MybottomState extends State<Mybottom> {
  int currentIndex = 0;
  int selectedPage = 0;
  bool isLoading = false;
  final _pageOptions = [
    HomeScreen(),
    //CartDetails(),
    QuizScreen(),
    Users(),
  ];
  var list = [
    Center(
      child: Text('home'),
    ),
    Center(
      child: Text('play_lesson'),
    ),
    Center(
      child: Text('quiz'),
    ),
    Center(
      child: Text('account'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BOOKS STORE ',
          // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // actions: [
        // IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoriteScreen(),)), icon: const Icon(Icons.add_shopping_cart),),
        // ],
        leading: Icon(
          Icons.sort,
          size: 28,
        ),
        backgroundColor: Colors.white,
        elevation: 0,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 28,
            ),
          ),
        ],
        //  IconButton(
        // onPressed: () => Navigator.push(
        // context,
        // MaterialPageRoute(
        // builder: (context) => const FavoriteScreen(),
      ),

      // icon: const Icon(Icons.add_shopping_cart),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: selectedPage,
        backgroundColor: Colors.deepOrange.shade50,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(
          // icon: Icon(Icons.book_sharp), label: 'MyBooks',),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Test'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        elevation: 5.0,
        onTap: (index) {
          setState(() {
            isLoading = true;
            selectedPage = index;
          });
        },
      ),
    );
  }
}
