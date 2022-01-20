import 'package:flutter_test/flutter_test.dart';
import 'package:products_coodesh/data/api/repositories/get_all_products/get_all_products_api_repository_imp.dart';
import 'package:products_coodesh/data/dto/product_dto.dart';

main() {
  final GetAllProductsApiRepositoryImp getAllProductsApiRepositoryImp =
      GetAllProductsApiRepositoryImp();

  test('Should get a list of products', () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result, isInstanceOf<List<ProductDto>>());
  });

  test('Should return first title as Raw organic brown eggs in a basket',
      () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result.first.description, 'Raw organic brown eggs in a basket');
  });

  test('Should not contain Test in its description', () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result.first.description.contains('Test'), false);
  });

  test('First id should be 0', () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result.first.id, '0');
  });

  //Enable this test if you have not done the delete one

  // test('Should return a 50 items list', () async {
  //   var result = await getAllProductsApiRepositoryImp.getAllProducts();
  //   expect(result.length, 50);
  // });

  test('Should return price as a double', () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result.first.price, isA<double>());
  });

  test('Should return height as a double', () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result.first.height, isA<double>());
  });

  test('Should return width as a double', () async {
    var result = await getAllProductsApiRepositoryImp.getAllProducts();
    expect(result.first.width, isA<double>());
  });
}

/*
"description": "Raw organic brown eggs in a basket",
        "filename": "https://firebasestorage.googleapis.com/v0/b/products-coodesh.appspot.com/o/images%2F0.jpg?alt=media&token=4233d893-2a67-4333-b251-d8074652dd24",
        "height": 600,
        "price": 28.1,
        "rating": 4,
        "title": "Brown eggs",
        "type": "dairy",
        "width": 400
        */
