import 'package:flutter/material.dart';

import '/data/api/repositories/get_all_products/get_all_products_api_repository_imp.dart';
import '/data/dto/product_dto.dart';
import '/presentation/ui/screens/home/home_error.dart';
import '/presentation/ui/screens/home/home_loading.dart';
import '/presentation/ui/screens/home/home_screen.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.getAllProductsApiRepositoryImp,
  }) : super(key: key);

  final GetAllProductsApiRepositoryImp getAllProductsApiRepositoryImp;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductDto>>(
      future: getAllProductsApiRepositoryImp.getAllProducts(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeScreen(productList: snapshot.data!);
        }
        if (snapshot.hasError) {
          return HomeError(
            error: 'Erro: ' + snapshot.error.toString(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
