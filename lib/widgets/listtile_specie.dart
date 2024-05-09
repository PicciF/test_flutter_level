import 'package:flutter/material.dart';
import 'package:test_flutter_level/models/specie.dart';

class ListtileSpecie extends StatelessWidget {
  const ListtileSpecie({
    required this.specie,
    this.onPressed,
    super.key,
  });

  final Specie specie;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 40,
      leading: Text(specie.category),
      subtitle: Text(
        specie.kingdom,
      ),
      title: Text(specie.scientificName),
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
      onTap: doOnPressed,
    );
  }

  doOnPressed() {
    onPressed?.call();
  }
}
