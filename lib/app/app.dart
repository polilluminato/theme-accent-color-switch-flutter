import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_accent_color_switch/app/router.dart';
import 'package:theme_accent_color_switch/provider/theme_provider.dart';

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  late final router = buildRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: ref.watch(accentColorProvider),
        brightness: ref.watch(brightnessProvider),
      ),
    );
  }
}
