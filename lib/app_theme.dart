import 'package:fitness_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppThemeData {
  final BuildContext context;

  AppThemeData(this.context);

  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorConstans.midnightBlue,
        appBarTheme: AppBarTheme(
          titleTextStyle:
              context.textTheme.bodyMedium?.copyWith(color: Colors.white),
          color: ColorConstans.midnightBlue,
        ),
        cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          elevation: 20,
        ),
      );
}
