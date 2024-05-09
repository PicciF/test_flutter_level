// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_flutter_level/globals.dart';

class ScaffoldHome extends StatefulWidget {
  const ScaffoldHome({
    super.key,
  });

  @override
  State<ScaffoldHome> createState() => _ScaffoldHomeState();
}

class _ScaffoldHomeState extends State<ScaffoldHome> {
  int pageSize = 20;
  final scrollController = ScrollController();
  bool endPage = false;

  //list of species to be displayed, add more items to see infinite scrolling
  final listSectioned = global.species.sublist(0, 20); // List.generate(20, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_loadMore);
    scrollController.addListener(_reachEnd);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    int end = listSectioned.length + pageSize;
    //the 40 is for remove bad effect when the user reach the end of the list
    if (end > global.species.length) {
      end = global.species.length;
    }
    if (scrollController.position.maxScrollExtent - scrollController.position.pixels < 40) {
      setState(() {
        listSectioned.addAll(global.species.sublist(listSectioned.length, end));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: listSectioned.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('${listSectioned[index].scientificName} $index'),
                ),
              );
            },
          ),
        ),
        if (endPage) const Center(child: Text("Non ci sono altri elementi")),
      ],
    ));
  }

  void _reachEnd() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
        listSectioned.length == global.species.length) {
      setState(() {
        endPage = true;
      });
    } else {
      setState(() {
        endPage = false;
      });
    }
  }
}
