import 'package:animew_app/core/constants.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';

class CustomInkwellButton extends StatelessWidget {
  const CustomInkwellButton({
    Key? key,
    required this.child,
    this.backgroundColor = Pallete.blue800,
    required this.onTap,
  }) : super(key: key);
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              BordeRadiusHelper.kBorderRaidus,
            ),
          ),
          child: child,
        ));
  }
}
