import 'package:LanguageLearningApp/details/details_screen.dart';
import 'package:LanguageLearningApp/models/my_product.dart';
import 'package:LanguageLearningApp/models/product.dart';
import 'package:LanguageLearningApp/providers/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreeen();
}

class _HomeScreeen extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //   TabBar(
              //     indicator: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.greenAccent),
              //     labelPadding: EdgeInsets.only(top: 10),
              //     unselectedLabelColor: Colors.black12,
              //     indicatorSize: TabBarIndicatorSize.tab,

              // children: [
              // const Text(
              //   "All Books",
              //   style: TextStyle(
              //     fontSize: 27,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildProductCategory(
                    index: 0,
                    name: "ALL BOOKS",
                  ),
                  _buildProductCategory(index: 1, name: "TRENDING BOOKS"),
                  //_buildProductCategory(index: 2, name: "MY COLLECTON"),
                ],
              ),
              const SizedBox(height: 13),
              Expanded(
                  child: isSelected == 0
                      ? _buildAllBooks()
                      : isSelected == 1
                          ? _buildTrendingBooks()
                          : isSelected == 2),
              //_buildMyCollection(),),
              // ],
            ],
          ),
        ));
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 120,
          height: 40,
          margin: const EdgeInsets.only(top: 1, right: 25, left: 50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.black : Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            //TabBar(indicatorColor: Colors.black,indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   unselectedLabelcolor:Colors.black,
            //   indicatorSize:TabBarIndicatorSize.tab,
            // ),
            // (
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllBooks() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (40 / 69),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        itemCount: Myproducts.allbooks.length,
        itemBuilder: (Context, index) {
          final allbooks = Myproducts.allbooks[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: allbooks),
              ),
            ),
            child: ProductCard(product: allbooks),
          );
        },
      );

  _buildTrendingBooks() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (53 / 48),
          crossAxisSpacing: 2,
          mainAxisSpacing: 6,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: Myproducts.trendingbooks.length,
        itemBuilder: (context, index) {
          final trendingbooks = Myproducts.trendingbooks[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: trendingbooks),
              ),
            ),
            child: ProductCard(product: trendingbooks),
          );
        },
      );
// _buildMyCollection()=> GridView.builder(
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
//   childAspectRatio: (54 / 120),
//   crossAxisSpacing: 12,
//   mainAxisSpacing: 12,),
//   scrollDirection: Axis.vertical,
//   itemCount: Myproducts.mycollection.length,
//   itemBuilder: (context, index){
//     final mycollection = Myproducts.mycollection[index];
//     return ProductCard(product: mycollection);
//   },
// );
}
