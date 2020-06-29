import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/battle/controller/game_controller.dart';
import 'package:flutter_app/battle/model/game_model.dart';
import 'package:flutter_app/battle/view/game_view.dart';

class Battle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BattleState();
}

class BattleState extends State<Battle> {
  var globalRoute;

  @override
  Widget build(BuildContext context) {
    //接收参数示范
    var param = ModalRoute.of(context).settings.arguments;
    print(param);
    var game = _GameImpl(param, context);

    globalRoute = game.controller.getHandler(context);
    GestureBinding.instance.pointerRouter.addGlobalRoute(globalRoute);
    return game.widget;
  }

  @override
  void dispose() {
    super.dispose();
    if (globalRoute != null)
      GestureBinding.instance.pointerRouter.removeGlobalRoute(globalRoute);
  }
}

class _GameImpl extends Game {
  var _msg = "";
  BuildContext context;
  Paint paint = Paint();
  GameModel model;
  GameView view;
  GameController controller;

  _GameImpl(this._msg, this.context) {
    model = GameModel();
    view = GameView(model);
    controller = GameController(model);
  }

  @override
  void render(Canvas canvas) {
    // view部分
//    drawText(canvas, _msg, 300, 100, fontSize: 30);
    paint.color = Colors.white;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, getScreenWidth(context), getScreenHeight(context)),
        paint);
    view.render(canvas, paint);
  }

  //获取屏幕长宽
  double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  void update(double t) {
    // model部分
    model.update();
  }

  //屏幕上绘制文字方法
  void drawText(Canvas canvas, String text, double x, double y,
      {double fontSize = 12,
      String fontFamily = "zcool-gdh",
      double maxWidth = 1000,
      TextDirection textDirection = TextDirection.ltr,
      alignment: Alignment.center,
      color: Colors.white}) {
    final textStyle = TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: fontSize,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: textDirection,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: maxWidth,
    );
    final offset = (alignment == Alignment.center)
        ? Offset(x - textPainter.width / 2, y - textPainter.height / 2)
        : Offset(x, y - textPainter.height / 2);
    textPainter.paint(canvas, offset);
  }
}
