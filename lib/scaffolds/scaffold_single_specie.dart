// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test_flutter_level/constants.dart';

class ScaffoldSingleSpecie extends StatefulWidget {
  const ScaffoldSingleSpecie({
    super.key,
  });

  @override
  State<ScaffoldSingleSpecie> createState() => _ScaffoldSingleSpecieState();
}

class _ScaffoldSingleSpecieState extends State<ScaffoldSingleSpecie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("dettaglio"),
          centerTitle: true,
          //set false to remove the back button for sure in every case
          automaticallyImplyLeading: false,
          backgroundColor: APP_BAR_COLOR,
        ),
        body: const Text("dettaglio"));
  }
}
