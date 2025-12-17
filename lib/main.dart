import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:walkdown/data/enums/audio_files.dart';
import 'package:walkdown/domain/services/launch_service.dart';
import 'package:walkdown/domain/services/modal_service.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/cubits/map/map.dart';
import 'package:walkdown/presentation/games/walkdown_game.dart';

// Global logger instance used throughout the app
late Logger logger;

void main() async {
  // Initialize Flutter bindings before any async operations
  await WidgetsFlutterBinding.ensureInitialized();

  // Set up logging with pretty printer
  logger = Logger(printer: PrefixPrinter(PrettyPrinter()));

  // Preload game sprite sheets
  await Animations.preloadSpriteSheets();

  // Preload background music
  await FlameAudio.audioCache.loadAll([AudioFiles.backgroundMusic.path]);

  // Launch the app
  runApp(const MyApp());
}

// Root widget that sets up dependency injection for services and state management
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    // Provide services to the widget tree
    providers: [
      RepositoryProvider<LaunchService>(create: (context) => LaunchService()),
      RepositoryProvider<ModalService>(create: (context) => ModalService()),
    ],
    child: MultiBlocProvider(
      // Provide state management cubits to the widget tree
      providers: [BlocProvider<MapCubit>(create: (context) => MapCubit())],
      child: const MyAppView(),
    ),
  );
}

// Main app view that configures theme and launches the game
class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) => ShadApp(
    // Light theme configuration
    theme: ShadThemeData(
      brightness: Brightness.light,
      colorScheme: const ShadNeutralColorScheme.light(),
      textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
    ),
    // Dark theme configuration
    darkTheme: ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: const ShadNeutralColorScheme.dark(),
      textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
    ),
    themeMode: ThemeMode.dark, // App uses dark mode by default
    title: 'Walkdown',
    home: const WalkdownGame(),
  );
}
