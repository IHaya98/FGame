import 'package:fgame/components/characters/character.dart';
import 'package:fgame/fgame-main.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:angles/angles.dart';

class PirateWoman extends Character {
  double get speed => game.tileSize * 2;
  PirateWoman(FGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyingSprite = <SpriteComponent>[];
    SpriteComponent sprite1 = SpriteComponent.fromSprite(
        60, 60, Sprite('actors/pirate-woman.png', width: 60, height: 60));
    //sprite1.angle = Angle.degrees(270.0).radians;
    sprite1.renderFlipX = true;
    flyingSprite.add(sprite1);

    SpriteComponent sprite2 = SpriteComponent.fromSprite(60, 60,
        Sprite('actors/pirate-woman.png', x: 320, width: 60, height: 60));
    //sprite2.angle = Angle.degrees(270.0).radians;
    flyingSprite.add(sprite2);

    SpriteComponent dead1 = SpriteComponent.fromSprite(
        60,
        60,
        Sprite('actors/pirate-woman.png',
            x: 390, y: 340, width: 60, height: 60));
    //dead1.angle = Angle.degrees(270.0).radians;
    deadSprite = dead1;
  }
}
