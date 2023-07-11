import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_accent_color_switch/provider/theme_provider.dart';
import 'package:theme_accent_color_switch/utils/screen_utils.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({Key? key, required this.isDark}) : super(key: key);

  final bool isDark;

  Color getBorderColor(Color providerColor, Brightness providerBrightness) {
    if (isDark) {
      return providerBrightness == Brightness.dark
          ? providerColor
          : Colors.transparent;
    } else {
      return providerBrightness == Brightness.light
          ? providerColor
          : Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerColor = ref.watch(accentColorProvider);
    final darkModeProvider = ref.watch(isDarkModeProvider);
    double size = 32;

    return GestureDetector(
      onTap: () => ref
          .read(isDarkModeProvider.notifier)
          .update((state) => isDark ? Brightness.dark : Brightness.light),
      child: Container(
          width: getScreenWidth(context) * .4,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: size * .1,
              color: getBorderColor(providerColor, darkModeProvider),
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
