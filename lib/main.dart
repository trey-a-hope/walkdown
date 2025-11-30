import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/cubits/map/map.dart';
import 'package:walkdown/presentation/games/walkdown_game.dart';

late Logger logger;

class LoadedSpriteSheets {
  static late SpriteSheet boy;
}

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  logger = Logger(printer: PrefixPrinter(PrettyPrinter()));
  await Animations.preloadSpriteSheets();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [BlocProvider<MapCubit>(create: (context) => MapCubit())],
    child: const MyAppView(),
  );
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) => ShadApp(
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
