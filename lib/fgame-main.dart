import 'dart:math';
import 'dart:ui';
import 'package:fgame/components/backyard.dart';
import 'package:fgame/components/characters/character.dart';
import 'package:fgame/components/characters/pirate-woman.dart';
import 'package:fgame/components/characters/samurai.dart';
import 'package:fgame/controllers/generater.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FGame extends Game {
  late Size screenSize;
  late double tileSize;
  late Backyard background;
  late List<Character> characters;
  late Random rnd;
  late CharacterGenerator generator;

  FGame() {
    initialize();
  }

  void initialize() async {
    characters = <Character>[];
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    generator = CharacterGenerator(this);
  }

  void generateCharacter() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize * 2.025);
    double y = (screenSize.height - tileSize * 1.50);
    switch (rnd.nextInt(2)) {
      case 0:
        characters.add(Samurai(this, x, y));
        break;
      case 1:
        characters.add(PirateWoman(this, x, y));
        break;
    }
  }

  void render(Canvas c) {
    background.render(c);
    characters.forEach((Character character) => character.render(c));
  }

  void update(double t) {
    characters.forEach((Character character) => character.update(t));
    characters.removeWhere((Character character) => character.isOffScreen);
    generator.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {}
}
