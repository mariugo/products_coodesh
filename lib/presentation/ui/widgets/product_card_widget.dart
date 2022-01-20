import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:products_coodesh/presentation/ui/screens/home/home_screen_view_model.dart';
import 'package:products_coodesh/presentation/ui/theme/design_system.dart';
import 'package:products_coodesh/presentation/ui/widgets/rating_stars_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String type;
  final String created;
  final int rating;
  final double price;
  final String filename;
  final String id;
  final HomeScreenViewModel homeScreenViewModel;

  const ProductCardWidget({
    Key? key,
    required this.title,
    required this.type,
    required this.created,
    required this.rating,
    required this.price,
    required this.filename,
    required this.id,
    required this.homeScreenViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      curve: Curves.easeIn,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: filename,
                progressIndicatorBuilder: (_, __, download) {
                  if (download.progress != null) {
                    const Center(
                      child: CircularProgressIndicator(
                        color: DS.primaryColor,
                      ),
                    );
                  }
                  return const Center(
                    child: Text('Imagem carregada'),
                  );
                },
                fit: BoxFit.cover,
                height: 400,
                width: 600,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: DS.titleField,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${type[0].toUpperCase()}${type.substring(1)}',
                  style: DS.typeField,
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(DateTime.parse(created)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingStars(rating: rating),
                    Text(
                      'R\$:' + price.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                homeScreenViewModel.navigateToEditProductScreen(context),
            child: const Icon(
              Icons.mode_edit,
              color: DS.editButtonColor,
              size: 26,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () => homeScreenViewModel.showMyDialoag(context, id),
            child: const Icon(
              Icons.delete,
              color: DS.deleteButtonColor,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
