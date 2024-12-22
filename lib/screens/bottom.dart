import 'package:LanguageLearningApp/main.dart';
import 'package:LanguageLearningApp/models/my_product.dart';
import 'package:LanguageLearningApp/models/product.dart';
import 'package:LanguageLearningApp/screens/reader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../providers/favorite_provider.dart';

void main() => runApp(LanguageLearningApp());

class bottom extends StatelessWidget {
  bottom(name, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '[index].name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Myreading(title: 'hello'),
    );
  }
}

class Myreading extends StatefulWidget {
  Myreading({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Myreading> createState() => _MyreadingState();
}

class _MyreadingState extends State<Myreading> {
  @override
  int _counter = 0;

  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalist = provider.favorite;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text('SUMMARY'),
        titleTextStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Document",
                  style: GoogleFonts.roboto(
                      fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
                Column(
                    children: Myproducts.allbooks
                        .map(
                          (doc) => ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReaderScreen(doc)));
                            },
                            title: Text(
                              doc.doc_title!,
                              style: GoogleFonts.nunito(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text("${doc.page_num!}Pages"),
                            trailing: Text(
                              doc.doc_date!,
                              style: GoogleFonts.nunito(color: Colors.grey),
                            ),
                            leading: Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                              size: 32.0,
                            ),
                          ),
                        )
                        .toList()),
              ],
            ),
          )),
    );
  }
}
