import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomWillpopScope extends StatelessWidget {
  const CustomWillpopScope({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Quit the app?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Salir'),
                ),
              ],
            );
          },
        );
        return false;
      },
      child: child,
    );
  }
}
