import 'dart:convert';
import 'package:http/http.dart' as http;

import '/data/dto/product_dto.dart';
import 'get_all_products_api_repository.dart';

class GetAllProductsApiRepositoryImp extends GetAllProductsApiRepository {
  @override
  Future<List<ProductDto>> getAllProducts() async {
    final _url = Uri.parse(
        'https://products-coodesh-default-rtdb.firebaseio.com/products.json');
    final _response = await http.get(_url);
    if (_response.statusCode == 200) {
      final _json = jsonDecode(_response.body) as List;
      List<ProductDto> _productsList =
          _json.map((_product) => ProductDto.fromJson(_product)).toList();
      return _productsList;
    }
    throw Exception('Erro ao carregar lista de produtos');
  }
}
