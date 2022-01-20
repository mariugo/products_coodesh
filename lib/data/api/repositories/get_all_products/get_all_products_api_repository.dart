import '/data/dto/product_dto.dart';

abstract class GetAllProductsApiRepository {
  Future<List<ProductDto>> getAllProducts();
}
