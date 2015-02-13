class Lose {

  PFont f;
  
  Lose(){
    f = createFont("Arial", 16, true);
  }
  
  void draw(){
    textFont(f, 16);
    fill(255);
    text("LOSE!", 10, 20);
  }


}
