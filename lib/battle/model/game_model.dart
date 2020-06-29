class GameModel {
  var swat = SWAT();

  void update() {
    swat.update();
  }
}

class SWAT {
  int x = 0; //坐标
  int movingCount = 0; //移动状态
  bool facingRight = true; //朝向状态

  bool movingRight = false;
  bool movingLeft = false;

  void update() {
    if (movingLeft) {
      x--;
      facingRight = false;
    }
    if (movingRight) {
      x++;
      facingRight = true;
    }

    if (movingRight || movingLeft)
      movingCount++;
    else
      movingCount = 0;
  }
}
