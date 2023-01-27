// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      info: json['info'] as String,
      description: json['description'] as String,
      points: json['points'] as int,
      slug: json['slug'] as String,
      stock: json['stock'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isNew: json['isNew'] as int,
      rating: (json['rating'] as num).toDouble(),
      numOfReviews: json['numOfReviews'] as int,
      isWishlist: json['isWishlist'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
      'description': instance.description,
      'points': instance.points,
      'slug': instance.slug,
      'stock': instance.stock,
      'images': instance.images,
      'isNew': instance.isNew,
      'rating': instance.rating,
      'numOfReviews': instance.numOfReviews,
      'isWishlist': instance.isWishlist,
    };
