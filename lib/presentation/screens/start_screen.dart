part of '../games/walkdown_game.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      onPressed: () => context.read<MapCubit>().updateMap(MapJson.world),
      child: const Text('Play game'),
    );
  }
}
