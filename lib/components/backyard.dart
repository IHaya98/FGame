import 'dart:ui';
import 'package:fgame/fgame-main.dart';
import 'package:flame/sprite.dart';

class Backyard {
  final FGame game;
  late Sprite bgSprite;
  late Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(0, 0, game.tileSize * 9, game.tileSize * 20);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
