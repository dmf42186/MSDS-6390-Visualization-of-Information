void drawDiagram2(){
    
  noFill();
  strokeWeight(5);
  stroke(203, 156, 114);
  
  int i=50;
  
  arc(0, 100, 200+6*i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200+5*i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200+4*i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200+3*i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200+2*i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200+i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200, 200, PI, PI+HALF_PI);
  arc(0, 100, 200-i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200-2*i, 200, PI, PI+HALF_PI);
  arc(0, 100, 200-3*i, 200, PI, PI+HALF_PI);
  
  arc(0, -100, 200+6*i, 200, 0, HALF_PI);
  arc(0, -100, 200+5*i, 200, 0, HALF_PI);
  arc(0, -100, 200+4*i, 200, 0, HALF_PI);
  arc(0, -100, 200+3*i, 200, 0, HALF_PI);
  arc(0, -100, 200+2*i, 200, 0, HALF_PI);
  arc(0, -100, 200+i, 200, 0, HALF_PI);
  arc(0, -100, 200, 200, 0, HALF_PI);
  arc(0, -100, 200-i, 200, 0, HALF_PI);
  arc(0, -100, 200-2*i, 200, 0, HALF_PI);
  arc(0, -100, 200-3*i, 200, 0, HALF_PI);
  
}