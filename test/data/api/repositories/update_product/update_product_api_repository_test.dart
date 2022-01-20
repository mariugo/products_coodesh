import 'package:flutter_test/flutter_test.dart';
import 'package:products_coodesh/data/api/repositories/update_product/update_product_api_repository_imp.dart';

main() {
  final UpdateProductApiRepositoryImp updateProductApiRepositoryImp =
      UpdateProductApiRepositoryImp();

  test('Should patch a product', () async {
    var result = await updateProductApiRepositoryImp.updateProduct(
        '48', 'Muitas frutas', 'frutas mistas', 29.99);
    expect(result, true);
  });
}
