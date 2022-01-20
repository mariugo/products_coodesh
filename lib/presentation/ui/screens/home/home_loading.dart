import 'package:flutter/material.dart';
import 'package:products_coodesh/presentation/ui/theme/design_system.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: DS.primaryColor,
          ),
        ),
      ),
    );
  }
}
