import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/data/api/repositories/get_all_products/get_all_products_api_repository_imp.dart';
import '../../../../data/api/repositories/update_product/update_product_api_repository_imp.dart';
import '/presentation/ui/container/home_container.dart';
import '/presentation/ui/screens/home/home_screen_view_model.dart';
import '/presentation/ui/theme/design_system.dart';
import '/presentation/ui/widgets/custom_input_field.dart';

import '/data/dto/product_dto.dart';

class EditProductScreen extends StatefulWidget {
  final ProductDto product;

  final HomeScreenViewModel homeScreenViewModel;

  const EditProductScreen({
    Key? key,
    required this.product,
    required this.homeScreenViewModel,
  }) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  String? _newTitle;
  String? _newType;
  double? _newPrice;
  final UpdateProductApiRepositoryImp updateProductImp =
      UpdateProductApiRepositoryImp();
  final _registerFormKey = GlobalKey<FormState>();
  SnackBar? _snackBar;

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DS.primaryColor,
        title: Text(
          widget.product.title,
          style: DS.appBarTitle,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: widget.product.filename,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _editForm(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveForm().then((value) async {
            if (value == true) {
              setState(() {
                _snackBar = const SnackBar(
                  content: Text('Produto atualizado'),
                );
              });
              ScaffoldMessenger.of(context).showSnackBar(_snackBar!);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeContainer(
                        getAllProductsApiRepositoryImp:
                            GetAllProductsApiRepositoryImp()),
                  ));
            } else {
              setState(() {
                _snackBar = const SnackBar(
                  content: Text('Erro ao atualizar produto'),
                );
              });
              ScaffoldMessenger.of(context).showSnackBar(_snackBar!);
            }
          });
        },
        backgroundColor: DS.secondaryColor,
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _editForm() {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomInputField(
            onSaved: (_title) {
              setState(() {
                _newTitle = _title;
              });
            },
            regEx: r".{6,}",
            labelText: "Title",
            textInputType: TextInputType.name,
            initialValue: widget.product.title,
          ),
          CustomInputField(
            onSaved: (_type) {
              setState(() {
                _newType = _type;
              });
            },
            regEx: r".{4,}",
            labelText: "Type",
            textInputType: TextInputType.name,
            initialValue: widget.product.type,
          ),
          CustomInputField(
            onSaved: (_price) {
              setState(() {
                _newPrice = double.parse(_price);
              });
            },
            regEx: r"^((?:[0-9]{1,3}[\.,]?)*[\.,]?[0-9]+)",
            labelText: "Price",
            textInputType: TextInputType.number,
            initialValue: widget.product.price.toString(),
          ),
        ],
      ),
    );
  }

  Future<bool> _saveForm() async {
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      await updateProductImp.updateProduct(
          widget.product.id, _newTitle!, _newType!, _newPrice!);
      return true;
    }
    return false;
  }
}
