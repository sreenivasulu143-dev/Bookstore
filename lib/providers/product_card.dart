import 'package:LanguageLearningApp/providers/favorite_provider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final dynamic product;
  final BoxFit fit;

  const ProductCard({Key? key, required this.product, this.fit = BoxFit.cover})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return
        // Container(
        Card(
      elevation: 5,
      //width: MediaQuery.of(context).size.width / 2,
      // decoration: BoxDecoration(
      // borderRadius: BorderRadius.circular(8.0),
      //color: Colors.deepOrange.withOpacity(0.1),
      //),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              'assets/books/coco.jpg'
              'assets/books/dragon.jpg'
              'assets/books/revenant.jpg'
              'assets/books/got.jpg'
              'assets/books/tangled1.jpg'
              'assets/books/it1.jpg'
              'assets/books/interest.jpg'
              'assets/books/matrix1.jpg'
              'assets/books/fire.jpg'
              'assets/books/earth1.jpg'
              'assets/books/Mahabharata.jpg'
              'assets/books/world.jpg'
              'assets/books/exorist1.jpg'
              'assets/books/god.jpg'
              'assets/books/moana.jpg'
              'assets/books/sherk.jpg'
              'assets/books/up.jpg'
              'assets/books/wall.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 180,
            width: 180,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.product.category,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
