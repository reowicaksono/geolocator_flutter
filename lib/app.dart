import 'package:flutter/material.dart';

import 'package:presence_app/router.dart';

final _appRoute = AppRouter();

class PrecenseApp extends StatelessWidget {
  const PrecenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRoute.config(),
    );
  }
}
