class Notes {
  PVector location;
  
  Notes(int i) {
    location = new PVector(i, 0);
  }
  
  
  void display() {
    if (location.x == 25) {
      image(dKey1, location.x, location.y);
    }
    if (location.x == 200) {
      image(fKey1, location.x, location.y);
    }
    if (location.x == 375) {
      image(jKey1, location.x, location.y);
    }
    if (location.x == 550) {
      image(kKey1, location.x, location.y);
    }
  }
  
  void fall() {
    location.y += 5;
  }
  
  void run() {
    display();
    fall();
  }
}