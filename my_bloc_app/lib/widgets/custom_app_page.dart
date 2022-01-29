import 'package:flutter/material.dart';

class CustomAppPage extends StatelessWidget {
  const CustomAppPage({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
