import 'package:products_coodesh/data/api/repositories/delete_procut/delete_product_api_repository.dart';
import 'package:http/http.dart' as http;

class DeleteProductApiRepositoryImp implements DeleteProductApiRepository {
  @override
  Future<bool> deleteProcutApiRepository(String id) async {
    final _url = Uri.parse(
        'https://products-coodesh-default-rtdb.firebaseio.com/products/$id.json');

    final _response = await http.delete(_url);
    if (_response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Erro ao deletar produto');
    }
  }
}
