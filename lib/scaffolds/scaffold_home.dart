// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

class ScaffoldHome extends StatefulWidget {
  const ScaffoldHome({
    super.key,
  });

  @override
  State<ScaffoldHome> createState() => _ScaffoldHomeState();
}

class _ScaffoldHomeState extends State<ScaffoldHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Home',
      ),
    );
  }
}
