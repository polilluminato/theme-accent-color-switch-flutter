import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_accent_color_switch/provider/theme_provider.dart';
import 'package:theme_accent_color_switch/utils/screen_utils.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({Key? key, required this.isDark}) : super(key: key);

  final bool isDark;

  Color getBorderColor(Color acProvider, Brightness tProvider) {
    if (isDark) {
      return tProvider == Brightness.dark ? acProvider : Colors.transparent;
    } else {
      return tProvider == Brightness.light ? acProvider : Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acProvider = ref.watch(accentColorProvider);
    final tProvider = ref.watch(brightnessProvider);
    double size = 32;

    return InkWell(
      onTap: () => ref
          .read(brightnessProvider.notifier)
          .update((state) => isDark ? Brightness.dark : Brightness.light),
      child: Container(
          width: getScreenWidth(context) * .4,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: size * .1,
              color: getBorderColor(acProvider, tProvider),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            size: getScreenWidth(context) * .2,
          )),
    );
  }
}
