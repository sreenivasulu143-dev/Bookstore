import 'package:LanguageLearningApp/providers/favorite_provider.dart';
import 'package:LanguageLearningApp/screens/Profile.dart';
import 'package:LanguageLearningApp/screens/cart_details.dart';
import 'package:LanguageLearningApp/screens/home_screen.dart';
import 'package:LanguageLearningApp/screens/login.dart';
import 'package:LanguageLearningApp/screens/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:LanguageLearningApp/screens/quiz_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:LanguageLearningApp/screens/user.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(LanguageLearningApp());
}

// class RegistrationScreen extends StatefulWidget {
//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   late String _email, _password;
//   var _formkey = GlobalKey<FormState>();
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent.shade100,
//         title: Text(
//           "Register",
//         ),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Container(
//         margin: EdgeInsets.all(16),
//         alignment: Alignment.center,
//         child: Center(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (items) {
//                     return items!.contains("@")
//                         ? null
//                         : "Enter valid email";
//                   },
//                   onChanged: (item) {
//                     setState(() {
//                       _email = item;
//                     });
//                   },
//                   decoration: InputDecoration(
//                       hintText: 'Enter Email',
//                       labelText: 'Email',
//                       border: OutlineInputBorder()),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   obscureText: true,
//                   keyboardType: TextInputType.text,
//                   validator: (items) {
//                     return items!.length > 6
//                         ? null
//                         : "Password must be 6 characters";
//                   },
//                   onChanged: (item) {
//                     setState(() {
//                       _password = item;
//                     });
//                   },
//                   decoration: InputDecoration(
//                       hintText: 'Enter Password',
//                       labelText: 'Password',
//                       border: OutlineInputBorder()),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   //color: Colors.blue,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       signup();
//                     },
//                     child: Text(
//                       'Register',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => Login()));
//                       },
//                       child: Text("login in")),
//                   alignment: Alignment.centerRight,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void signup() {
//     if (_formkey.currentState!.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//       FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: _email, password: _password)
//           .then((user) {
//         setState(() {
//           isLoading = false;
//         });
//         Fluttertoast.showToast(msg: "register successfull");
//         //
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (_) => Profile()),
//                 (Route<dynamic> route) => false);
//       }).catchError((onError) {
//         setState(() {
//           isLoading = false;
//         });
//         Fluttertoast.showToast(msg: "Error" + onError.toString());
//       });
//     }
//   }
// }

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
            // title: ' Story Books',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed: Colors.red,
              scaffoldBackgroundColor: Colors.white,
            ),
            //home: RegistrationScreen(),

            home: //Scaffold(
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
                //body:
                //Profile(),
                //RegistrationScreen(),
                Mybottom(),
          ));
// );
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
    //QuizScreen(),
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
      // appBar: AppBar(
      //   title: Text(
      //     'BOOKS STORE ',
      //      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   ),),
      //centerTitle: true,
      backgroundColor: Colors.white,
      //elevation: 0,

      // actions: [
      // IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoriteScreen(),)), icon: const Icon(Icons.add_shopping_cart),),
      // ],
      // leading: Icon(
      //   Icons.sort,
      //   size: 28,
      // ),

      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: 16),
      //     child: IconButton(icon:
      //       Icon(Icons.search,
      //       color: Colors.grey,
      //       size: 28,
      //     ),
      //       onPressed: (){},
      //   ),
      //   ),
      // ],
      //  IconButton(
      // onPressed: () => Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (context) => const FavoriteScreen(),
      //),

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
          //BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Test'),
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

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:LanguageLearningApp/providers/favorite_provider.dart';
// import 'package:LanguageLearningApp/screens/Profile.dart';
// import 'package:LanguageLearningApp/screens/home_screen.dart';
// import 'package:LanguageLearningApp/screens/quiz_screen.dart';
// import 'package:LanguageLearningApp/screens/user.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'details/details_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(LanguageLearningApp());
// }
//
// class LanguageLearningApp extends StatefulWidget {
//   @override
//   State<LanguageLearningApp> createState() => _LanguageLearningAppState();
// }
//
// class _LanguageLearningAppState extends State<LanguageLearningApp> {
//   @override
//   Widget build(BuildContext context) => MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => FavoriteProvider()),
//         ],
//         child: MaterialApp(
//           title: 'Story Books',
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             colorSchemeSeed: Colors.red,
//             scaffoldBackgroundColor: Colors.white,
//           ),
//           home: Mybottom(),
//         ),
//       );
// }
//
// class Mybottom extends StatefulWidget {
//   @override
//   State<Mybottom> createState() => _MybottomState();
// }
//
// class _MybottomState extends State<Mybottom> {
//   int selectedPage = 0;
//   final _pageOptions = [
//     HomeScreen(),
//     QuizScreen(),
//     Users(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Books Store',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Icon(
//           Icons.sort,
//           size: 28,
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 16),
//             child: IconButton(
//               icon: Icon(Icons.search, color: Colors.grey, size: 28),
//               onPressed: () {
//                 showSearch(context: context, delegate: BookSearchDelegate());
//               },
//             ),
//           ),
//         ],
//       ),
//       body: _pageOptions[selectedPage],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: Colors.black,
//         selectedItemColor: Colors.blue,
//         currentIndex: selectedPage,
//         backgroundColor: Colors.deepOrange.shade50,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Test'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle), label: 'Account'),
//         ],
//         elevation: 5.0,
//         onTap: (index) {
//           setState(() {
//             selectedPage = index;
//           });
//         },
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int isSelected = 0;
//   bool isLoading =
//       false; // Update this to false since we are not fetching from an API
//   List<dynamic> allBooks = [
//     {
//       'title': 'The Great Gatsby',
//       'author': 'F. Scott Fitzgerald',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': 'Moby Dick',
//       'author': 'Herman Melville',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': '1984',
//       'author': 'George Orwell',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//   ];
//   List<dynamic> trendingBooks = [
//     {
//       'title': 'The Catcher in the Rye',
//       'author': 'J.D. Salinger',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': 'To Kill a Mockingbird',
//       'author': 'Harper Lee',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//   ];
//   List<dynamic> displayedBooks = [];
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       displayedBooks = allBooks;
//       isLoading = false;
//     });
//   }
//
//   void searchBooks(String query) {
//     final suggestions = allBooks.where((book) {
//       final bookTitle = book['title'].toLowerCase();
//       final input = query.toLowerCase();
//
//       return bookTitle.contains(input);
//     }).toList();
//
//     setState(() {
//       displayedBooks = suggestions;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildProductCategory(index: 0, name: "ALL BOOKS"),
//                       _buildProductCategory(index: 1, name: "TRENDING BOOKS"),
//                     ],
//                   ),
//                   const SizedBox(height: 13),
//                   Expanded(
//                     child: isSelected == 0
//                         ? _buildBookGrid(displayedBooks)
//                         : _buildBookGrid(trendingBooks),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
//
//   Widget _buildProductCategory({required int index, required String name}) =>
//       GestureDetector(
//         onTap: () => setState(() => isSelected = index),
//         child: Container(
//           width: 120,
//           height: 40,
//           margin: const EdgeInsets.only(top: 1, right: 10, left: 10),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: isSelected == index ? Colors.red : Colors.red.shade100,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Text(
//             name,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       );
//
//   Widget _buildBookGrid(List<dynamic> books) => GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: (3 / 4),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: books.length,
//         itemBuilder: (context, index) {
//           final book = books[index];
//           return GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DetailsScreen(product: book),
//               ),
//             ),
//             child: Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Expanded(
//                     child: Image.network(
//                       book['imageUrl'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       book['title'],
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
// }
//
// class BookSearchDelegate extends SearchDelegate {
//   final List<dynamic> allBooks = [
//     {
//       'title': 'The Great Gatsby',
//       'author': 'F. Scott Fitzgerald',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': 'Moby Dick',
//       'author': 'Herman Melville',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': '1984',
//       'author': 'George Orwell',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': 'The Catcher in the Rye',
//       'author': 'J.D. Salinger',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//     {
//       'title': 'To Kill a Mockingbird',
//       'author': 'Harper Lee',
//       'imageUrl': 'https://via.placeholder.com/150'
//     },
//   ];
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     final suggestions = allBooks.where((book) {
//       final bookTitle = book['title'].toLowerCase();
//       final input = query.toLowerCase();
//
//       return bookTitle.contains(input);
//     }).toList();
//
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final book = suggestions[index];
//
//         return ListTile(
//             title: Text(book['title']),
//             subtitle: Text(book['author']),
//             leading:
//                 Image.network(book['imageUrl'], width: 50, fit: BoxFit.cover),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailsScreen(product: book),
//                 ),
//               );
//             });
//       },
//     );
//   }
//
//
//   }
// }
