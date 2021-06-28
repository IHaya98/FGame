import 'package:fgame/components/characters/character.dart';
import 'package:fgame/fgame-main.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class PirateWoman extends Character {
  double get speed => game.tileSize * 2;
  PirateWoman(FGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('actors/pirate-woman.png', width: 60, height: 60));
    flyingSprite
        .add(Sprite('actors/pirate-woman.png', x: 320, width: 60, height: 60));
    deadSprite = Sprite('actors/pirate-woman.png',
        x: 390, y: 340, width: 60, height: 60);
  }
}
