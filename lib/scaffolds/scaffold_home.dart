// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_flutter_level/backend/api.dart';
import 'package:test_flutter_level/globals.dart';
import 'package:test_flutter_level/models/specie.dart';

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
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text(global.species.length.toString()),
          onPressed: () async {
            Specie specei = await getSpecieDetailsByName("Abarema abbottii");
            debugPrint(specei.kingdom);
          },
        ),
      ),
    );
  }
}
