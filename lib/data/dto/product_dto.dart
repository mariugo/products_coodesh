import '/domain/entity/product_entity.dart';

class ProductDto extends ProductEntity {
  final String id;
  final String title;
  final String type;
  final String description;
  final String filename;
  final double height;
  final double width;
  final double price;
  final int rating;
  final String created;

  ProductDto({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.height,
    required this.width,
    required this.price,
    required this.rating,
    required this.created,
  }) : super(
          identificador: id,
          titulo: title,
          tipo: type,
          descricao: description,
          arquivo: filename,
          altura: height,
          largura: width,
          preco: price,
          nota: rating,
          criado: created,
        );

  factory ProductDto.fromJson(Map<String, dynamic> _json) => ProductDto(
        created: _json['created'],
        description: _json['description'],
        filename: _json['filename'],
        height: _json['height'],
        id: _json['id'],
        price: _json['price'],
        rating: _json['rating'],
        title: _json['title'],
        type: _json['type'],
        width: _json['width'],
      );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'height': height,
      'width': width,
      'price': price,
      'rating': rating,
      'created': created,
    };
  }
}
