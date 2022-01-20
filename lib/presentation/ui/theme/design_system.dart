import 'package:flutter/material.dart';

class DS {
  static const Color primaryColor = Color(0xFF0700D6);
  static const Color secondaryColor = Color(0xFF7200d6);
  static const Color starsRatingColor = Color(0xFFcfd600);
  static const Color editButtonColor = Color(0xFFd600cf);
  static const Color deleteButtonColor = Color(0xFFd60700);
  static const Color secondaryTextColor = Color(0xFFBDBDBD);

  static const appBarTitle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const titleField = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const typeField = TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 14,
    color: secondaryTextColor,
  );

  static const alertDialogTitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: DS.primaryColor,
  );

  static const ctaText = TextStyle(
    color: DS.primaryColor,
  );
}
