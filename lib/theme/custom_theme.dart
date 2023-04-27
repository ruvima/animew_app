import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';

abstract class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          Pallete.blue500.value,
          const {
            100: Pallete.blue100,
            200: Pallete.blue200,
            300: Pallete.blue300,
            400: Pallete.blue400,
            500: Pallete.blue500,
            600: Pallete.blue600,
            700: Pallete.blue700,
            800: Pallete.blue800,
            900: Pallete.blue900,
          },
        ),
      ).copyWith(
        secondary: Pallete.blue500,
      ),
      scaffoldBackgroundColor: Pallete.darkBlue,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        color: Pallete.almostBlack,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Pallete.blue500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            button: theme.primaryTextTheme.button?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(
            displayColor: Colors.white,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Pallete.blue500,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Pallete.blue500,
        unselectedItemColor: Pallete.grey,
        backgroundColor: Pallete.almostBlack,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(size: 30),
        selectedIconTheme: IconThemeData(size: 30),
      ),
    );
  }
}
