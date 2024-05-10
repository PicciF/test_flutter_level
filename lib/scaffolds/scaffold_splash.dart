// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_level/app_router.gr.dart';
import 'package:test_flutter_level/backend/api.dart';
import 'package:test_flutter_level/constants.dart';
import 'package:test_flutter_level/globals.dart';

class ScaffoldSplash extends StatefulWidget {
  const ScaffoldSplash({super.key});

  @override
  State<ScaffoldSplash> createState() => _ScaffoldSplashState();
}

class _ScaffoldSplashState extends State<ScaffoldSplash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async {
      global.splashAlreadyDone = true;
      try {
        global.species = await getSpeciesByCategory(CATEGORY_VULNERABLE);
      } catch (e) {
        debugPrint(e.toString());
      }

      if (global.isLoggedIn) {
        if (mounted) {
          AutoRouter.of(context).replace(const ScaffoldHomeRoute());
        }
      } else {
        if (mounted) {
          AutoRouter.of(context).replace(const ScaffoldHomeRoute());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height / 3),
            Text("Test Flutter Level",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: COLOR_PRIMARY)),
            Container(height: 64),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
