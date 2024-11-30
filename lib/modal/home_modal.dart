class ProductModal {
  late int id;
  var price;
  late String  title, description, category, image;
  Rating? rating;

  ProductModal({
    required this.id,
    required this.description,
    required this.category,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory ProductModal.fromJson(Map m1) {
    return ProductModal(
      id: m1['id'],
      description: m1['description'],
      category: m1['category'],
      title: m1['title'],
      image: m1['image'],
      price: m1['price'],
      rating: Rating.fromJson(m1['rating']),
    );
  }
}

class Rating {
  var rate, count;

  Rating({
    required this.count,
    required this.rate,
  });

  factory Rating.fromJson(Map m1) {
    return Rating(
      count: m1['count'],
      rate: m1['rate'],
    );
  }
}
