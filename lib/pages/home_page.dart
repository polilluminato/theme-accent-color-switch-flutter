import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_accent_color_switch/provider/theme_provider.dart';
import 'package:theme_accent_color_switch/widgets/color_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Titolo",
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Enable Dark Mode"),
            trailing: Switch(
              value: ref.watch(isDarkModeProvider),
              onChanged: (value) {
                ref.read(isDarkModeProvider.notifier).update((state) => value);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorButton(color: Colors.red),
              ColorButton(color: Colors.orange),
              ColorButton(color: Colors.yellow),
              ColorButton(color: Colors.green),
              ColorButton(color: Colors.lightBlue),
              ColorButton(color: Colors.indigo),
              ColorButton(color: Colors.purple),
            ],
          )
        ],
      ),
    );
  }
}
