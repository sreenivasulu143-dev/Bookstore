class Product {
  final int id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity;
  final String? doc_title;
  final String? doc_url;
  final String? doc_date;
  final int? page_num;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
    required this.doc_title,
    required this.doc_url,
    required this.doc_date,
    required this.page_num,
});
}