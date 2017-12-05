// A portion of this project was inspired by code found on the OpenProcessing website. 
// "Guitar Hero/Osu! mania infinite mode" by Jeppe Brown Richardson

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


void setup() {
  size(700, 950);
  
  minim = new Minim(this);
  
  jingleBells = loadImage("jingleBells.jpg");
  jingleBellsAudio = minim.loadFile("jingleBellsAudio.mp3");
  jingleBellsAudio.play();
  
  
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


}

void draw() {
  background(jingleBells);
  
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