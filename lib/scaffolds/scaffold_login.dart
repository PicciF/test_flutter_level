// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_level/constants.dart';
import 'package:test_flutter_level/globals.dart';
import 'package:test_flutter_level/models/user.dart';
import 'package:test_flutter_level/widgets/loader.dart';
import 'package:test_flutter_level/widgets/textfield_specie.dart';

import '../app_router.gr.dart';
import '../backend/api.dart';
import '../backend/app_utils.dart';

class ScaffoldLogin extends StatefulWidget {
  const ScaffoldLogin({
    super.key,
  });

  @override
  State<ScaffoldLogin> createState() => _ScaffoldLoginState();
}

class _ScaffoldLoginState extends State<ScaffoldLogin> with TickerProviderStateMixin {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    if (kDebugMode) {
      Future.delayed(Duration.zero, () async {
        // put here some code that will run after the splash screen
        if (mounted) {
          setState(() {
            userController.text = "Marco";
            passwordController.text = "Password123";
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          backgroundColor: APP_BAR_COLOR,
        ),
        //this property is used to avoid the keyboard to resize the screenmarco
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nome utente",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              SpecieTextField(
                controller: userController,
                hint: "Inserire nome utente",
                icon: const Icon(Icons.person),
              ),
              Container(
                height: 32,
              ),
              Text(
                "Password",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 16,
              ),
              SpecieTextField(
                controller: passwordController,
                hint: "Inserire password",
                obscureText: true,
                isVisiblePass: true,
                icon: const Icon(Icons.lock),
              ),
              Container(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (isLoading) {
                          showDialog(barrierDismissible: false, context: context, builder: (context) => const Loader());
                        }

                        try {
                          if (await apiLogin(passwordController.text)) {
                            debugPrint("Login effettuato");
                            global.preferences.user = User(username: userController.text);
                            global.preferences.save();
                          } else {
                            if (mounted) {
                              showSnackBar(
                                  content: const Text(
                                    "Errore - Password errata",
                                    style: TextStyle(color: COLOR_WHITE),
                                  ),
                                  context: context,
                                  isError: true);
                            }
                          }
                        } catch (e) {
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
                          Navigator.pop(context);
                        });

                        AutoRouter.of(context).replace(const ScaffoldHomeRoute());
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
