import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'lpc_player.dart';
import 'lpc_sprite_sheet_loader.dart';
import 'widgets/button_interface.dart';

class LPCGame extends StatelessWidget {
  const LPCGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(),
        directional: JoystickDirectional(),
      ),
      map: WorldMapByTiled(
        'tiled/mapa2.json',
        forceTileSize: Vector2(32, 32),
      ),
      cameraConfig: CameraConfig(zoom: 2),
      overlayBuilderMap: {
        ButtonInterface.name: ButtonInterface.builder,
      },
      initialActiveOverlays: [
        ButtonInterface.name,
      ],
      player: LPCPlayer(
        position: Vector2(140, 140),
        customStatus: const CustomStatus(),
      ),
      onDispose: () => FollowerWidget.remove(LPCPlayer.customWidgetKey),
    );
  }
}
