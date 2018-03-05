float angle=0;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  noFill();
  ellipseMode(CENTER);
} 
  
void draw() {
  background(51);
  translate(width/2, height/2);
  drawCenter(25);  
    
  pushMatrix();
  rotate(radians(angle));
  drawDiagram1();
  popMatrix();
  
  rotate(radians(-angle));
  drawDiagram2(); 
  angle = angle + 1;
}

  
  