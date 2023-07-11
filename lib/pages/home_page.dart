import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_accent_color_switch/widgets/accent_color_button.dart';
import 'package:theme_accent_color_switch/widgets/theme_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Theme & Accent Color Switch",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Theme",
                style: textTheme.headlineSmall,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ThemeButton(
                  isDark: false,
                ),
                ThemeButton(
                  isDark: true,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Accent Color",
                style: textTheme.headlineSmall,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AccentColorButton(color: Colors.red),
                AccentColorButton(color: Colors.orange),
                AccentColorButton(color: Colors.yellow),
                AccentColorButton(color: Colors.green),
                AccentColorButton(color: Colors.lightBlue),
                AccentColorButton(color: Colors.indigo),
                AccentColorButton(color: Colors.purple),
              ],
            )
          ],
        ),
      ),
    );
  }
}
