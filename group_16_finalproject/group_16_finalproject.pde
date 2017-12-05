// A portion of this project was inspired by code found on the OpenProcessing website. 
// "Guitar Hero/Osu! mania infinite mode" by Jeppe Brown Richardson
//main page ornament image from http://ournerdhome.com/8-bit-holiday-ornaments/

// 0: Initial Screen
// 1: Game Screen
// 2: Game Over Screen
// 3: How to play


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage jingleBells;
Minim minim;
AudioPlayer jingleBellsAudio;

PImage dKey;
PImage fKey;
PImage jKey;
PImage kKey;

PImage dKey1;
PImage fKey1;
PImage jKey1;
PImage kKey1;

ArrayList noteList = new ArrayList();
int[] nums;

//Game screen initialization
int gameScreen = 0;
PImage ornament;
PFont holFont;

//Button initializations
NewGame newGame;


void setup() {
  size(700, 950);
  
  minim = new Minim(this);
  
  jingleBells = loadImage("jingleBells.jpg");
  jingleBellsAudio = minim.loadFile("jingleBellsAudio.mp3");
  //jingleBellsAudio.play();
  
  
  dKey = loadImage("dKey.png");
  fKey = loadImage("fKey.png");
  jKey = loadImage("jKey.png");
  kKey = loadImage("kKey.png");
  
  dKey1 = loadImage("dKey1.png");
  fKey1 = loadImage("fKey1.png");
  jKey1 = loadImage("jKey1.png");
  kKey1 = loadImage("kKey1.png");
  
  nums = new int[4];
  
  nums[0] = 25;
  nums[1] = 200;
  nums[2] = 375;
  nums[3] = 550;

  ornament = loadImage("ornament.jpg");
  //zigBlack = createFont("Ziggurat-Black", 40);
  //textFont(zigBlack);
  holFont = createFont("candy.ttf", 80);
  //textFont(holFont);
  
  // Create new game button
  newGame = new NewGame(465, 175, 150, 150, 50);
  
  //216, 354
  //424, 611
  //177, 788
}

void draw() {
  if (gameScreen == 0) {
    initScreen();
    newGame.display();
    //println(mouseX + ", " + mouseY);
  } else if (gameScreen == 1) {
    gameScreen();
    //pause.display();
    
    //condition for game over
  }
  
}

// INITIAL SCREEN
void initScreen() {
  image(ornament, 0, 0, width, height);
  textAlign(CENTER);
  textSize(80);
  textFont(holFont);
  text("Keyboard DDR", width/2, height/2 + 35);
}

// GAME PLAY SCREEN
void gameScreen() {
  
  background(jingleBells);
  
  jingleBellsAudio.play();
  
  image(dKey, 25, 800);
  image(fKey, 200, 800);
  image(jKey, 375, 800);
  image(kKey, 550, 800);
  
  int index = (int) random(0, 4);
  Notes note = new Notes(nums[index]);
  
  if (frameCount % 45 == 0) {
    noteList.add(note);
  }
  
  for (int h = 0; h < noteList.size(); h++) {
    Notes no = (Notes) noteList.get(h);
    no.run();
    if (key == 'd' && no.location.y >= 775 && no.location.y <= 825 && no.location.x == 25 && keyPressed) {
      noteList.remove(h);
    }
    if (key == 'f' && no.location.y >= 775 && no.location.y <= 825 && no.location.x == 200 && keyPressed) {
      noteList.remove(h);
    }
    if (key == 'j' && no.location.y >= 775 && no.location.y <= 825 && no.location.x == 375 && keyPressed) {
      noteList.remove(h);
    }
    if (key == 'k' && no.location.y >= 775 && no.location.y <= 825 && no.location.x == 550 && keyPressed) {
      noteList.remove(h);
    }
  }
  

}


void mousePressed() {
  if (overButton(465, 175, 150)) {
    gameScreen = 1;
  }
  
  //if (overButton(350, 495, 150, 50)) {
  //  gameScreen = 1;
  //} else if (overButton(600, 40, 50, 50)) {
  //  if (looping) {
  //    noLoop();
  //  } else {
  //    loop();
  //  }
  //} else if (gameScreen == 2) {
  //  gameScreen = 0;
  //} else if (overButton(350, 550, 150, 50)) {
  //  gameScreen = 3;
  //}
}


// Check whether mouse is hovering over the button area
//boolean overButton(int xpos, int ypos, int widthval, int heightval) {
boolean overButton(int xpos, int ypos, int diameter) {
  //if (mouseX >= xpos && mouseX <= xpos + widthval && mouseY >= ypos && mouseY <= ypos + heightval) {
  float disX = xpos - mouseX;
  float disY = ypos - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2) {
    return true;
  } else {
    return false;
  }
}