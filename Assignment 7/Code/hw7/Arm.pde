class Arm {
  float angle = 0;
  boolean top = true;
  
  Arm(boolean top) {
    this.top = top;
    stroke(255);
    noFill();
    ellipseMode(CENTER);
    background(51);
  }

  void rotateArm() {
    pushMatrix();
    if (this.top)
      rotate(radians(angle));
    else
      rotate(radians(-angle));
    drawArm();    
    popMatrix();
    angle = angle + 1;
  }

  void drawArm() {    
    noFill();
    strokeWeight(5);
  
    for(int k=-3; k<7; k++) {
      if (this.top) {
        stroke(143, 96, 54);
        arc(-100, 0, 200, 200+k*50, 0, HALF_PI);
        arc(+100, 0, 200, 200+k*50, PI, PI+HALF_PI);
      } else {
        stroke(203, 156, 114);
        arc(0, 100, 200+k*50, 200, PI, PI+HALF_PI);
        arc(0, -100, 200+k*50, 200, 0, HALF_PI);
      }
    }
  }  
}