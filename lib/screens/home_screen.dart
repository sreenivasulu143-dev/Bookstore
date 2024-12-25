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
  bool isLoading = false;
  List<dynamic> displayedBooks = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      displayedBooks = Myproducts.allbooks;
      isLoading = false;
    });
  }

  void searchBooks(String query) {
    final suggestions = Myproducts.allbooks.where((allBooks) {
      final bookTitle = allBooks.name.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    setState(() {
      displayedBooks = suggestions;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book Store'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: BookSearchDelegate());
              },
            ),
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            ? _buildAllBooks(Myproducts.allbooks)
                            // : isSelected == 1
                            : _buildTrendingBooks(Myproducts.trendingbooks))
                    // : isSelected == 2),
                    //_buildMyCollection(),),
                    // ],
                  ],
                ),
              ));
  }

  Widget _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 120,
          height: 40,
          margin: const EdgeInsets.only(top: 1, right: 10, left: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade100,
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

  Widget _buildAllBooks(List<dynamic> allbooks) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.895,
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
            // child: ProductCard(product: allbooks),
            child: ProductCard(
              product: allbooks,
              fit: BoxFit.fill,
              //elevation: 5,
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     Expanded(child: ProductCard(product: allbooks,),),
              //     Padding(padding: const EdgeInsets.all(8.0),child: Text(Product['name'],),),
              //   ],
              // ),
            ),
          );
        },
      );

  Widget _buildTrendingBooks(List<dynamic> trendingbooks) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          //childAspectRatio: (53 / 48),
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
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
            child: ProductCard(
              product: trendingbooks,
              fit: BoxFit.cover,
            ),
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

class BookSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = Myproducts.allbooks.where((allbook) {
      final bookTile = allbook.name.toLowerCase();
      final input = query.toLowerCase();
      return bookTile.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final allbooks = suggestions[index];
        return Center(
          child: ListTile(
            title: Text(allbooks.name),
            subtitle: Text(allbooks.category),
            leading: Image.asset(
              allbooks.image,
              width: 50,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: allbooks),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = Myproducts.allbooks.where((allbooks) {
      final bookTile = allbooks.name.toLowerCase();
      final input = query.toLowerCase();
      return bookTile.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final allbooks = suggestions[index];
        return ListTile(
          title: Text(allbooks.name),
          subtitle: Text(allbooks.category),
          leading: Image.asset(
            allbooks.image,
            width: 50,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: allbooks),
              ),
            );
          },
        );
      },
    );
  }
}
