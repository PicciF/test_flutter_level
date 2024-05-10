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
          title: const Text("Dettaglio"),
          centerTitle: true,
          backgroundColor: APP_BAR_COLOR,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16,
              ),
              if (widget.specie.mainCommonName.isNotEmpty)
                Text(
                  widget.specie.mainCommonName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                )
              else
                Text(
                  widget.specie.scientificName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              Container(
                height: 32,
              ),
              Text(
                "ID: ${widget.specie.taxonId}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              Text(
                "Regno: ${widget.specie.kingdom}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              Text(
                "Phylum: ${widget.specie.phylum}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              Text(
                "Classification: ${widget.specie.classification}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              Text(
                "Ordine: ${widget.specie.order}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              Text(
                "Famiglia: ${widget.specie.family}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              Text(
                "Genere: ${widget.specie.genus}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              if (widget.specie.terrestrialSystem) ...[
                Text(
                  "Fa parte del sistema terrestre",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: 16,
                ),
              ],
              if (widget.specie.marineSystem) ...[
                Text(
                  "Fa parte del sistema marino",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: 16,
                ),
              ],
              if (widget.specie.freshwaterSystem) ...[
                Text(
                  "Fa parte del sistema d'acqua dolce",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: 16,
                ),
              ],
            ],
          ),
        ));
  }
}
