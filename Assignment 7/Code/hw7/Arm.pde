class Arm {
  float angle = 0;
  int color_add = 0;
  float speed_add = 0;
  boolean top = true;
  
  boolean color_direction = true;
  Arm(boolean top) {
    this.top = top;
    if (top)
      this.color_add = 50;
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
    angle = (angle + 1.5) + speed_add;
  }

  void drawArm() {    
    noFill();
    strokeWeight(5);
    if (this.color_direction) {
      this.color_add += 1;
      this.speed_add += 0.01;
    } else {
      this.color_add -= 1;
      this.speed_add -= 0.01;
    }
     
    if (this.color_add > 100 || this.color_add < -100) {
      this.color_direction = !this.color_direction;
    }

    for(int k=-3; k<7; k++) {
      if (this.top) {
        stroke(143, 96+this.color_add, 54+this.color_add);
        arc(-100, 0, 200, 200+k*50, 0, HALF_PI);
        arc(+100, 0, 200, 200+k*50, PI, PI+HALF_PI);
      } else {
        stroke(203, 156+this.color_add, 114+this.color_add);
        arc(0, 100, 200+k*50, 200, PI, PI+HALF_PI);
        arc(0, -100, 200+k*50, 200, 0, HALF_PI);
      }
    }
  }  
}