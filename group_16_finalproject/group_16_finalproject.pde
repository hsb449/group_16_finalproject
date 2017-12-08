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

int frameDiv;

PImage songImage;
Minim minim;
AudioPlayer Audio;

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

int fallRate2;

//Game screen initialization
int gameScreen = 0;
PImage ornament;
PFont holFont;
PImage santa;
PImage reindeer;

//Button initializations
NewGame newGame;
NewGame newGame2;
NewGame newGame3;


void setup() {
  size(700, 950);
  
  minim = new Minim(this);
  
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

  santa = loadImage("santa.png");
  santa.resize(32, 10);
  reindeer = loadImage("reindeer.png");
  reindeer.resize(40, 40);
  //image(reindeer, 100, 100);
  ornament = loadImage("ornament.jpg");
  //zigBlack = createFont("Ziggurat-Black", 40);
  //textFont(zigBlack);
  holFont = createFont("candy.ttf", 80);
  //textFont(holFont);
  //scale(0.01, 0.01);
  
  
  
  // Create new game button
  newGame = new NewGame(465, 175, 150, 150, 50);
  newGame.songText = "Jingle Bells";
  newGame.difficultyText = "[[Hard]]";
  
  newGame2 = new NewGame(217, 348, 160, 160, 50);
  newGame2.songText = "Sleigh Ride";
  newGame2.difficultyText = "[[Medium]]";
  
  newGame3 = new NewGame(420, 620, 145, 145, 50);
  newGame3.songText = "Frosty the Snowman";
  newGame3.difficultyText = "[[Easy]]";
  
  //216, 354
  //424, 611
  //177, 788
}

void draw() {
  background(0);
  cursor(santa);
  //cursor(reindeer);
  //image(reindeer, mouseX + 10, mouseY + 10);
  //image(reindeer, 100, 100);
  
  if (gameScreen == 0) {
    initScreen();
    newGame.display();
    newGame2.display();
    newGame3.display();
    //println(mouseX + ", " + mouseY);
  } if (gameScreen == 1) {
    gameScreen();
    
  }
 if (gameScreen == 2) {
    gameScreen();
    
  }
 if (gameScreen == 3) {
    gameScreen();
    
  }
  
}

// INITIAL SCREEN
void initScreen() {
  image(ornament, 0, 0, width, height);
  image(reindeer, mouseX + 50, mouseY);
  textAlign(CENTER);
  textSize(80);
  textFont(holFont);
  text("Keyboard DDR", width/2, height/2 + 35);
}

// GAME PLAY SCREEN
void gameScreen() {
  
  background(songImage);
  
  Audio.play();
  
  image(dKey, 25, 800);
  image(fKey, 200, 800);
  image(jKey, 375, 800);
  image(kKey, 550, 800);
  
  int index = (int) random(0, 4);
  Notes note = new Notes(nums[index]);
  note.fallRate = fallRate2;
  
  if (frameCount % frameDiv == 0) {
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
    songImage = loadImage("jingleBells.jpg");
    Audio = minim.loadFile("jingleBellsAudio.mp3");
    frameDiv = 15;
    fallRate2 = 15;
  }
  if (overButton(217, 348, 160)) {
    gameScreen = 2;
    songImage = loadImage("sleighRide.jpg");
    Audio = minim.loadFile("sleighRide.mp3");
    frameDiv = 20;
    fallRate2 = 12;
  }
  if (overButton(420, 620, 145)) {
    gameScreen = 3;
    songImage = loadImage("frostyTheSnowman.jpg");
    Audio = minim.loadFile("frostyTheSnowman.mp3");
    frameDiv = 30;
    fallRate2 = 10;
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