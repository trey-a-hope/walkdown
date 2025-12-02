import 'package:bonfire/bonfire.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/domain/services/launch_service.dart';
import 'package:walkdown/domain/services/modal_service.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:walkdown/data/configuration/gap_sizes.dart';
import 'package:walkdown/presentation/extensions/bool_extensions.dart';

class ComputerDecoration extends GameDecoration with Vision, TapGesture {
  final String url;
  bool _active = false;

  bool get active => _active;
  set active(bool value) {
    if (_active != value) {
      _active = value;
      _updateAnimation();
    }
  }

  bool _observedPlayer = false;

  ComputerDecoration({required this.url, required super.position})
    : super.withAnimation(
        animation: Animations.computerOff,
        size: Vector2.all(Globals.tileSize),
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Collider property in Sprite Fusion is overriden if object is mapped out
    // in the objectsBuilder
    add(RectangleHitbox(size: size));
  }

  void _updateAnimation() {
    logger.d('Setting animation to ${active ? 'computer' : 'computer off'}');
    this.setAnimation(active ? Animations.computerOn : Animations.computerOff);
  }

  @override
  void update(double dt) {
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (_) => _observedPlayer = true,
        notObserved: () => _observedPlayer = false,
        radiusVision: Globals.tileSize,
      );
    }

    super.update(dt);
  }

  @override
  void onTap() => _toggle();

  void _toggle() async {
    final textTheme = ShadTheme.of(context).textTheme;
    final launchService = context.read<LaunchService>();
    final modalService = context.read<ModalService>();

    if (_observedPlayer) {
      if (!active) {
        await TalkDialog.show(context, [
          Say(
            padding: EdgeInsets.all(GapSizes.mediumGap.mainAxisExtent),
            text: [
              TextSpan(text: 'This is the ', style: textTheme.h4),
              TextSpan(
                text: '\"Gift Grab\"',
                style: textTheme.h4.copyWith(color: Colors.blue),
              ),
              TextSpan(text: ' game, lets play!', style: textTheme.h4),
            ],
          ),
        ]);

        final confirm = await modalService.shadConfirmationDialog(
          context,
          title: const Text('Open Gift Grab'),
          description: const Text('Press yes to confirm'),
        );

        if (!confirm.falseIfNull()) return;

        logger.d('opening $url');
        launchService.launch(url);

        active = true;
      } else {
        active = false;
      }
    } else {
      logger.d('you are not close enough to turn on the computer');
    }
  }
}
