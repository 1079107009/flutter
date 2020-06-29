import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flutter_app/battle/model/game_model.dart';

class GameView {
  GameModel _model;

  GameView(this._model) {
    Flame.images.load("battle/swat/upper/idle.png");
    Flame.images.load("battle/swat/upper/fire.png");
    Flame.images.load("battle/swat/upper/tilt.png");
    Flame.images.load("battle/swat/upper/vertical.png");
    Flame.images.load("battle/swat/lower/idle.png");
    for (int i = 0; i < 5; i++)
      Flame.images.load("battle/swat/lower/jump$i.png");
    for (int i = 0; i < 12; i++)
      Flame.images.load("battle/swat/lower/run$i.png");
  }

  void render(Canvas canvas, Paint paint) {
    var swat = _model.swat;
    Image image = Flame.images.loadedFiles["battle/swat/lower/idle.png"];
    if (swat.movingCount != 0)
      image = Flame.images.loadedFiles[
          "battle/swat/lower/run${swat.movingCount ~/ 3 % 12}.png"];
    if (image == null) return; //图片加载是异步的，渲染可能在未加载完成前开始，判断一下，如果图片为空，则不渲染
    canvas.save();
    canvas.translate(swat.x.toDouble(), 0);
    if (!swat.facingRight) canvas.scale(-1, 1);
    canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(-50, 0, 100, 100),
        paint); //想下为什么是-50
    image = Flame.images.loadedFiles["battle/swat/upper/idle.png"];
    canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(-50, 0, 100, 100),
        paint);
    canvas.restore();
  }
}
