import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  int price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    int? price,
    int? quantity,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        isRecommended: isRecommended ?? this.isRecommended,
        isPopular: isPopular ?? this.isPopular,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      isRecommended: map['isRecommended'],
      isPopular: map['isPopular'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  static List<Product> products = [
    //TODO add sample products

    //TODO dont forget to add appropriate image Url
    Product(
        id: 1,
        name: 'Mukena 1',
        category: 'Mukena',
        description: 'This is mukena 1',
        imageUrl: 'https://fikashop.com/wp-content/uploads/2020/03/m034-1.jpeg',
        price: 50000,
        isRecommended: true,
        isPopular: true),
    Product(
        id: 2,
        name: 'Mukena 2',
        category: 'Mukena',
        description: 'This is mukena 2',
        imageUrl:
            'https://s4.bukalapak.com/img/4778080082/w-1000/MUKENA_AQILLA_EXTRA_JUMBO_.jpg',
        price: 50000,
        isRecommended: true,
        isPopular: false),
    Product(
        id: 3,
        name: 'Mukena 3',
        category: 'Mukena',
        description: 'This is mukena 3',
        imageUrl: 'https://cdn.elevenia.co.id/g/7/2/9/1/0/3/28729103_B.jpg',
        price: 50000,
        isRecommended: false,
        isPopular: false),
    Product(
        id: 4,
        name: 'HomeDress 1',
        category: 'HomeDress',
        description: 'This is homedress 1',
        imageUrl:
            'https://th.bing.com/th/id/OIP.bi3F4YemopeBeIO_tt1bIQHaHa?pid=ImgDet&rs=1',
        price: 30000,
        isRecommended: true,
        isPopular: false),
    Product(
        id: 5,
        name: 'HomeDress 2',
        category: 'HomeDress',
        description: 'This is homedress 2',
        imageUrl:
            'https://s1.bukalapak.com/img/6838424321/w-1000/batik_sikak_daun_sirih_baju_daster_wanita_tidur_hamil_muslim.jpg',
        price: 30000,
        isRecommended: false,
        isPopular: true),
  ];
}
