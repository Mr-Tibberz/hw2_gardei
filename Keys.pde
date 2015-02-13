static class Keys {
  //Movement keys
  static boolean W = false; //up
  static boolean A = false; //left
  static boolean S = false; //down
  static boolean D = false; //right
  static boolean UP = false;
  static boolean DOWN = false;
  static boolean LEFT = false;
  static boolean RIGHT = false;
  static boolean SPACE = false;
  static boolean ENTER = false;

  static boolean PREV_W = false; //up
  static boolean PREV_A = false; //left
  static boolean PREV_S = false; //down
  static boolean PREV_D = false; //right
  static boolean PREV_UP = false;
  static boolean PREV_DOWN = false;
  static boolean PREV_LEFT = false;
  static boolean PREV_RIGHT = false;
  static boolean PREV_SPACE = false;
  static boolean PREV_ENTER = false;  
  
  static boolean canMakeBox = false;
  static PVector mouse;

  static void Update() {
    Keys.PREV_W = Keys.W;
    Keys.PREV_A = Keys.A;
    Keys.PREV_S = Keys.S;
    Keys.PREV_D = Keys.D;
    Keys.PREV_UP = Keys.UP;
    Keys.PREV_DOWN = Keys.DOWN;
    Keys.PREV_LEFT = Keys.LEFT;
    Keys.PREV_RIGHT = Keys.RIGHT;
    Keys.PREV_SPACE = Keys.SPACE;
    Keys.PREV_ENTER = Keys.ENTER;
  }
  static void Set(int code, boolean pressed) {
    switch(code) {
    case 87:
      Keys.W = pressed;
      break;
    case 65:
      Keys.A = pressed;
      break;
    case 83:
      Keys.S = pressed;
      break;
    case 68:
      Keys.D = pressed;
      break;
    case 38:
      Keys.UP = pressed;
      break;
    case 40:
      Keys.DOWN = pressed;
      break;
    case 37:
      Keys.LEFT = pressed;
      break;
    case 39:
      Keys.RIGHT = pressed;
      break;
    case 32:
      Keys.SPACE = pressed;
      break;
    case 10:
      Keys.ENTER = pressed;
      break;
    }
  }
}

void keyPressed() {
  Keys.Set(keyCode, true);
}
void keyReleased() {
  Keys.Set(keyCode, false);
}

void mousePressed() {
   Keys.mouse = new PVector(mouseX, mouseY);
    //mouse = cam.transformInverseMatrix(mouse); //convert from screenspace into wrold space.   
    Keys.canMakeBox = true;
    
}
void mouseReleased(){
    Keys.canMakeBox = false;
}
