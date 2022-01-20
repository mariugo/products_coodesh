import 'package:flutter_test/flutter_test.dart';
import 'package:products_coodesh/data/api/repositories/delete_procut/delete_product_api_repository_imp.dart';

main() {
  final DeleteProductApiRepositoryImp deleteProductApiRepositoryImp =
      DeleteProductApiRepositoryImp();

  /*

  Be aware of running this test, because on get all products, should return
  a 50 length list, so make apropriate adjustments.

  */
  test('Should delete product id = 49', () async {
    var result =
        await deleteProductApiRepositoryImp.deleteProcutApiRepository('49');
    expect(result, true);
  });
}
