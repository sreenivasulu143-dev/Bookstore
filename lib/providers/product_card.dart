import 'package:LanguageLearningApp/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
 final Product product;
 const ProductCard({super.key,required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.deepOrange.withOpacity(0.1),
      ),
      child: Column(
        children: [
         // Row(
         //    crossAxisAlignment: CrossAxisAlignment.start,
         //    mainAxisAlignment: MainAxisAlignment.center,
         //    children: [
         //      GestureDetector(
         //        onTap: ()=> provider.toggleFavorite(widget.product),
         //      child: Icon(
         //        provider.isExit(widget.product)
         //        ? Icons.library_add_check_rounded
         //       : Icons.library_add_check_outlined,
         //        color: Colors.blueGrey,
             // ),
            //   ),
            // ],
           //),
          SizedBox(
            height: 180,
            width: 180,
            child: Image.asset( widget.product.image,fit: BoxFit.contain,),
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
              fontSize: 11,color: Colors.brown,
            ),
          ),
        //Text('\$''${widget.product.price}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        //],
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        //children: [
        //   GestureDetector(
        //     onTap: ()=> provider.toggleFavorite(widget.product),
        //     child: Icon(size: 10,
        //       provider.isExit(widget.product)
        //           ? Icons.done_rounded
        //           : Icons.add_shopping_cart_sharp,
        //
        //       color: Colors.black,
        //     ),
         // ),
        ],
      ),
    );
  }
}
