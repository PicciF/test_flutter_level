import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.isSmall = false,
  });
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: SizedBox(
          height: isSmall ? 32 : 64,
          width: isSmall ? 32 : 64,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
