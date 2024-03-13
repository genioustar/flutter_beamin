// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      docId: json['docId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      isDiscount: json['isDiscount'] as bool?,
      stock: json['stock'] as int?,
      discountRate: (json['discountRate'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'isDiscount': instance.isDiscount,
      'stock': instance.stock,
      'discountRate': instance.discountRate,
      'imageUrl': instance.imageUrl,
      'timestamp': instance.timestamp,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      cartDocId: json['cartDocId'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      timestamp: json['timestamp'] as int?,
      count: json['count'] as int?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'cartDocId': instance.cartDocId,
      'uid': instance.uid,
      'email': instance.email,
      'timestamp': instance.timestamp,
      'count': instance.count,
      'product': instance.product,
    };
