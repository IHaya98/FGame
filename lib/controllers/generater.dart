import 'package:fgame/components/characters/character.dart';
import 'package:fgame/fgame-main.dart';

class CharacterGenerator {
  final FGame game;
  final int maxSpawnInterval = 1500;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 15;
  late int currentInterval;
  late int nextSpawn;

  CharacterGenerator(this.game) {
    start();
    game.generateCharacter();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.characters.forEach((Character character) => character.isDead = true);
  }

  void update(double t) {
    int nowTimeStamp = DateTime.now().millisecondsSinceEpoch;

    int livingFlies = 0;
    game.characters.forEach((Character character) {
      if (!character.isDead) livingFlies += 1;
    });
    if (nowTimeStamp >= nextSpawn && livingFlies < maxFliesOnScreen) {
      game.generateCharacter();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimeStamp + currentInterval;
    }
    if (currentInterval <= 500) {
      killAll();
      start();
    }
  }
}
