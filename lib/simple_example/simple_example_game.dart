import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'my_enemy.dart';
import 'my_player.dart';

class SimpleExampleGame extends StatelessWidget {
  const SimpleExampleGame({Key? key}) : super(key: key);

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
        objectsBuilder: {
          'goblin': (properties) => MyEnemy(properties.position),
        },
      ),
      player: MyPlayer(Vector2(140, 140)),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
      backgroundColor: const Color.fromARGB(255, 10, 53, 89),
    );
  }
}
