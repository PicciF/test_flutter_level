// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_level/app_router.gr.dart';
import 'package:test_flutter_level/backend/api.dart';
import 'package:test_flutter_level/backend/app_utils.dart';
import 'package:test_flutter_level/constants.dart';
import 'package:test_flutter_level/globals.dart';
import 'package:test_flutter_level/models/specie.dart';
import 'package:test_flutter_level/widgets/listtile_specie.dart';
import 'package:test_flutter_level/widgets/loader.dart';

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
    Specie specie = Specie.empty();
    bool isLoading = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Speci Vulnerabili"),
          centerTitle: true,
          //set false to remove the back button for sure in every case
          automaticallyImplyLeading: false,
          backgroundColor: APP_BAR_COLOR,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 16,
              ),
              Text("Lista Specie Vulnerabili", style: Theme.of(context).textTheme.headlineMedium),
              Container(
                height: 16,
              ),
              Expanded(
                child: Scrollbar(
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: listSectioned.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ListtileSpecie(
                          specie: listSectioned[index],
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (isLoading) {
                              showDialog(
                                  barrierDismissible: false, context: context, builder: (context) => const Loader());
                            }
                            try {
                              specie = await getSpecieDetailsByName(listSectioned[index].scientificName);
                            } catch (e) {
                              //i have removed the lint warning because i had manage the warning
                              if (mounted) {
                                showSnackBar(
                                    content: Text(
                                      "Errore - $e",
                                      style: const TextStyle(color: COLOR_WHITE),
                                    ),
                                    context: context,
                                    isError: true);
                              }

                              Navigator.pop(context);
                            }

                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pop(context);
                            AutoRouter.of(context).push(ScaffoldSingleSpecieRoute(specie: specie));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (endPage) const Center(child: Text("Non ci sono altri elementi")),
            ],
          ),
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
