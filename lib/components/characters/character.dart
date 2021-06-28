import 'dart:ui';
import 'package:fgame/fgame-main.dart';
import 'package:flame/sprite.dart';

class Character {
  final FGame game;
  late Rect flyRect;
  late bool isDead = false;
  late bool isOffScreen = false;
  late List<Sprite> flyingSprite;
  late Sprite deadSprite;
  late double spriteIndex = 0;
  late Offset targetLocation;

  double get speed => game.tileSize * 3;

  Character(this.game) {
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = 0;
    double y = (game.screenSize.height - (game.tileSize * 1.50));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[spriteIndex.toInt()].renderRect(c, flyRect);
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      spriteIndex += 30 * t * 0.05;
      if (spriteIndex >= 2) {
        spriteIndex -= 2;
        spriteIndex = 0;
      }
    }
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget =
          Offset.fromDirection(toTarget.direction, stepDistance);
      flyRect = flyRect.shift(stepToTarget);
    } else {
      flyRect = flyRect.shift(toTarget);
      setTargetLocation();
    }
    if (flyRect.left <= 0) {
      isDead = true;
    }
  }

  void onTapDown() {}
}
