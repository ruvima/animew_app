import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Pallete.grey,
      thickness: 1.0,
    );
  }
}
