import 'package:ephiway/utils/app_router/app_router.gr.dart';
import 'package:ephiway/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setupLocator();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = getIt<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Gilroy",
        primarySwatch: Colors.blue,
      ),
    );
  }
}
