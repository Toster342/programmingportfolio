class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  String val;
  boolean hover;
  
  // constructor
  Button(float x, float y, String val) {
    this.x = x;
    this.y = y;
    w = 40;
    h = 30;
    c1 = color(60);
    c2 = color(177);
    this.val = val;
    hover = false;
  } 
  
  // Member Methods
  void display() {
    if (hover) {
      fill(c2); 
    } else {
      fill(c1);
    }
    
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(255);
    text(val, x , y );
  }
  
  void mouseOver(float tempX, float tempY) {
    if (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2) {
      hover = true;
    } else {
      hover = false;
    }
  } 
 }
