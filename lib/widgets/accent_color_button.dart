import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_accent_color_switch/provider/theme_provider.dart';

class AccentColorButton extends ConsumerWidget {
  const AccentColorButton({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerColor = ref.watch(accentColorProvider);
    double size = 32;

    return GestureDetector(
      onTap: () =>
          ref.read(accentColorProvider.notifier).update((state) => color),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: size * .1,
            color: providerColor == color ? color : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(size),
        ),
        padding: EdgeInsets.all(size * .15),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size),
          ),
        ),
      ),
    );
  }
}
