import 'package:flutter/material.dart';

import '/data/api/repositories/delete_procut/delete_product_api_repository_imp.dart';
import '/data/api/repositories/get_all_products/get_all_products_api_repository_imp.dart';
import '/presentation/ui/container/home_container.dart';
import '/presentation/ui/screens/edit_product/edit_product_screen.dart';
import '/presentation/ui/theme/design_system.dart';
import '/data/dto/product_dto.dart';

class HomeScreenViewModel {
  final ProductDto product;
  HomeScreenViewModel({
    required this.product,
  });

  Future<void> showMyDialoag(BuildContext context, String id) async {
    if (id.isNotEmpty) {
      final DeleteProductApiRepositoryImp deleteProductApiRepositoryImp =
          DeleteProductApiRepositoryImp();
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: const Text(
            'Deletar produto',
            style: DS.alertDialogTitle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('Você deseja excluir este produto?'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Esta ação é irreversível',
                  style: DS.typeField,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => deleteProductApiRepositoryImp
                  .deleteProcutApiRepository(id)
                  .then(
                    (_) => Future.delayed(
                      const Duration(
                        seconds: 3,
                      ),
                    ).then(
                      (value) => const AlertDialog(
                        content: Text('Produto deletado'),
                      ),
                    ),
                  )
                  .then(
                    (_) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeContainer(
                          getAllProductsApiRepositoryImp:
                              GetAllProductsApiRepositoryImp(),
                        ),
                      ),
                    ),
                  ),
              child: const Text(
                'Ok',
                style: DS.ctaText,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: DS.ctaText,
              ),
            ),
          ],
        ),
      );
    }
    return;
  }

  navigateToEditProductScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => EditProductScreen(
            homeScreenViewModel: HomeScreenViewModel(
              product: product,
            ),
            product: product),
      ),
    );
  }
}
