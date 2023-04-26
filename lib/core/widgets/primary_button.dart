import 'package:animew_app/core/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width = double.infinity,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final double width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(BordeRadiusHelper.kBorderRaidus * 2),
          ),
          fixedSize: Size(
            width,
            16,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                : Text(
                    text,
                    style: Theme.of(context).textTheme.button,
                  ),
          ],
        ),
      ),
    );
  }
}
