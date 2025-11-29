import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:walkdown/presentation/games/walkdown_game.dart';

late Logger logger;

void main() async {
  logger = Logger(printer: PrefixPrinter(PrettyPrinter()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadNeutralColorScheme.light(),
        textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadNeutralColorScheme.dark(),
        textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
      ),
      themeMode: ThemeMode.dark,
      title: 'Walkdown',
      home: const WalkdownGame(),
    );
  }
}
