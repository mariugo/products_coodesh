import 'dart:convert';

import 'package:products_coodesh/data/api/repositories/update_product/update_product_api_repository.dart';
import 'package:http/http.dart' as http;

class UpdateProductApiRepositoryImp extends UpdateProductApiRepository {
  @override
  Future<bool> updateProduct(
      String id, String newTitle, String newType, double newPrice) async {
    final _url = Uri.parse(
        'https://products-coodesh-default-rtdb.firebaseio.com/products/$id.json');

    final _response = await http.patch(
      _url,
      body: jsonEncode({
        'title': newTitle,
        'type': newType,
        'price': newPrice,
        'created': DateTime.now().toString(),
      }),
    );

    if (_response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Erro ao atualizar produto');
    }
  }
}
