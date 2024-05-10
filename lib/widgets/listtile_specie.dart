import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
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
    return Card(
      child: ListTile(
        trailing: Text("ID: ${specie.taxonId}", style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (specie.subspecies.isNotEmpty) ...[
              Text(
                "Subspecies: ${specie.subspecies}",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Container(width: 8)
            ],
            if (specie.rank.isNotEmpty)
              Text(
                "Rank: ${specie.rank}",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        title: Tooltip(
          message: !kIsWeb && specie.scientificName.length > 30 ? specie.scientificName : "",
          child: AutoSizeText(specie.scientificName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              minFontSize: 16,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        ),
        onTap: doOnPressed,
      ),
    );
  }

  doOnPressed() {
    onPressed?.call();
  }
}
