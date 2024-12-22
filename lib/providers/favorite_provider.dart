import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorite = [];

  List<Product> get favorite => _favorite;

  void toggleFavorite(Product product) {
    if (_favorite.contains(product)) {
      _favorite.remove(product);
    } else {
      _favorite.add(product);
    }
    notifyListeners();
  }

  bool isExit(Product product) {
    final isExit = _favorite.contains(product);
    return isExit;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
