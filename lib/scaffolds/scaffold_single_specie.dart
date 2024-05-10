// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test_flutter_level/constants.dart';
import 'package:test_flutter_level/models/specie.dart';

class ScaffoldSingleSpecie extends StatefulWidget {
  const ScaffoldSingleSpecie({
    super.key,
    required this.specie,
  });

  final Specie specie;

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
          backgroundColor: APP_BAR_COLOR,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Text("dettaglio"));
  }
}
