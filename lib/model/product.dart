import 'package:freezed_annotation/freezed_annotation.dart';

//dart run build_runner build 이렇게 커맨드에 처줘야함.
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product {
  factory Product({
    String? docId,
    String? title,
    String? description,
    int? price,
    bool? isDiscount,
    int? stock,
    double? discountRate,
    String? imageUrl,
    int? timestamp,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
sealed class Cart with _$Cart {
  factory Cart({
    String? cartDocId,
    String? uid,
    String? email,
    int? timestamp,
    int? count,
    Product? product,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
