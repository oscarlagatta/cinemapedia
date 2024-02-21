import 'package:flutter/material.dart';

import 'package:cinemapedia/router/app_router.dart';
import 'package:cinemapedia/theme/app_theme.dart';

void main() => runApp(CinemaPedia());

class CinemaPedia extends StatelessWidget {
  const CinemaPedia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      title: 'Cinemapedia',
    );
  }
}
