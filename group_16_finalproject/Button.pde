boolean rectPressed = false;
PImage img;

class Button {
  int xpos, ypos, widthval, heightval;

  Button(int x, int y, int w, int h) {
    xpos = x;
    ypos = y;
    widthval = w;
    heightval = h;
  }
  
  void display() {
    ellipse(xpos, ypos, widthval, heightval);
    //rect(xpos, ypos, widthval, heightval);
  }
}

class NewGame extends Button {
  int transparency;
  NewGame(int xpos, int ypos, int widthval, int heightval, int t) {
    super(xpos, ypos, widthval, heightval);
    transparency = t;
  }
  
  void display() {
    fill(0, transparency);
    ellipse(xpos, ypos, widthval, heightval);
    //rect(xpos, ypos, widthval, heightval);
    fill(255);
    textSize(30);
    //textFont("Arial", 40);
    text("Click to" + "\n" + "start", xpos, ypos - 5);
  }
}

//class Instruction extends Button {
//  int transparency;
//  Instruction(int xpos, int ypos, int widthval, int heightval, int t) {
//    super(xpos, ypos, widthval, heightval);
//    transparency = t;
//  }
  
//  void display() {
//    fill(0, transparency);
//    rect(xpos, ypos, widthval, heightval);
//    fill(255);
//    textSize(16);
//    text("How to play", width/2, height/2 + 106);
//  }
//}

/*
class Pause extends Button {
  int transparency;
  Pause(int xpos, int ypos, int widthval, int heightval, int t) {
    super(xpos, ypos, widthval, heightval);
    transparency = t;
    img = loadImage("pause-button.png");
  }
  
  void display() {
    image(img, xpos, ypos);
    img.resize(0, 50);
  }
  
}

*/