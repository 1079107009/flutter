import 'package:flutter/material.dart';
import 'package:flutter_app/battle/model/game_model.dart';

class GameController {
  GameModel _model;

  GameController(this._model);

  void Function(PointerEvent)
      handler; //函数类型，function前是返回值，括号里是参数的类型（PointerEvent类）

  void Function(PointerEvent) getHandler(BuildContext context) {
    handler = (PointerEvent e) {
      if (e is PointerDownEvent) {
//        print('pointer down at (${e.position.dx},${e.position.dy})');
        if (e.position.dx > getScreenWidth(context) / 2)
          _model.swat.movingRight = true;
        else
          _model.swat.movingLeft = true;
      } else if (e is PointerUpEvent) {
//        print('pointer up at (${e.position.dx},${e.position.dy})');
        if (e.position.dx > getScreenWidth(context) / 2)
          _model.swat.movingRight = false;
        else
          _model.swat.movingLeft = false;
      } else if (e is PointerMoveEvent) {
        print(
            'pointer move from (${e.position.dx - e.delta.dx},${e.position.dy - e.delta.dy}) to ' +
                '(${e.position.dx},${e.position.dy})');
      }
    };
    return handler;
  }

  //获取屏幕长宽
  double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
