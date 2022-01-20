import 'package:flutter/material.dart';

import '/presentation/ui/screens/home/home_screen_view_model.dart';
import '/presentation/ui/theme/design_system.dart';
import '/data/dto/product_dto.dart';
import '/presentation/ui/widgets/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final List<ProductDto> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DS.primaryColor,
        title: const Text(
          'Products Coodesh',
          style: DS.appBarTitle,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (_, index) => ProductCardWidget(
            homeScreenViewModel: HomeScreenViewModel(
              product: productList[index],
            ),
            title: productList[index].title,
            type: productList[index].type,
            created: productList[index].created,
            rating: productList[index].rating,
            price: productList[index].price,
            filename: productList[index].filename,
            id: productList[index].id,
          ),
        ),
      ),
    );
  }
}
