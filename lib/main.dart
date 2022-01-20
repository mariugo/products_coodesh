import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/api/repositories/get_all_products/get_all_products_api_repository_imp.dart';
import '/presentation/ui/container/home_container.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products Coodesh',
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeContainer(
        getAllProductsApiRepositoryImp: GetAllProductsApiRepositoryImp(),
      ),
    );
  }
}
