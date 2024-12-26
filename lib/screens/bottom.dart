import 'package:LanguageLearningApp/models/product.dart';
import 'package:LanguageLearningApp/screens/reader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomReader extends StatelessWidget {
  final Product product;

  const BottomReader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: product.name,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Myreading(product: product),
    );
  }
}

class Myreading extends StatefulWidget {
  final Product product;

  Myreading({Key? key, required this.product}) : super(key: key);

  @override
  State<Myreading> createState() => _MyreadingState();
}

class _MyreadingState extends State<Myreading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(widget.product.name),
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
                widget.product.name,
                style: GoogleFonts.nunito(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
              // Text(
              //   "Recent Document",
              //   style: GoogleFonts.roboto(
              //     fontSize: 48.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 400,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.center,
                // child: Text(
                //   widget.product.name,
                //   style: GoogleFonts.nunito(
                //     fontSize: 48.0,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //     backgroundColor: Colors.black.withOpacity(0.5),
                //   ),
                // ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReaderScreen(widget.product),
                    ),
                  );
                },
                title: Text(
                  widget.product.doc_title!,
                  style: GoogleFonts.nunito(),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text("${widget.product.page_num!} Pages"),
                trailing: Text(
                  widget.product.doc_date!,
                  style: GoogleFonts.nunito(color: Colors.grey),
                ),
                leading: Image.asset(
                  widget.product.image,
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
