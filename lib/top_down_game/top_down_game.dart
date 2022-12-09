import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'armchair_decoration.dart';
import 'robot_enemy.dart';
import 'soldier_player.dart';

class TopDownGame extends StatelessWidget {
  const TopDownGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        'tiled/top_down/map.json',
        objectsBuilder: {
          'enemy': (prop) => ZombieEnemy(prop.position),
          'armchair': (prop) => ArmchairDecoration(prop.position),
        },
      ),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(),
        directional: JoystickDirectional(),
        actions: [
          JoystickAction(
            actionId: 1,
            margin: const EdgeInsets.all(50),
          ),
        ],
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
      player: SoldierPlayer(Vector2(64 * 17, 64 * 4)),
      lightingColorGame: Colors.black.withOpacity(0.7),
    );
  }
}
