void drawDiagram1(){
    
  noFill();
  strokeWeight(5);
  stroke(143, 96, 54);
  
  int i = 50;
  
  arc(-100, 0, 200, 200+6*i, 0, HALF_PI);
  arc(-100, 0, 200, 200+5*i, 0, HALF_PI);
  arc(-100, 0, 200, 200+4*i, 0, HALF_PI);
  arc(-100, 0, 200, 200+3*i, 0, HALF_PI);
  arc(-100, 0, 200, 200+2*i, 0, HALF_PI);
  arc(-100, 0, 200, 200+i, 0, HALF_PI);
  arc(-100, 0, 200, 200, 0, HALF_PI);
  arc(-100, 0, 200, 200-i, 0, HALF_PI);
  arc(-100, 0, 200, 200-2*i, 0, HALF_PI);
  arc(-100, 0, 200, 200-3*i, 0, HALF_PI);
    
  arc(+100, 0, 200, 200+6*i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200+5*i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200+4*i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200+3*i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200+2*i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200+i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200-i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200-2*i, PI, PI+HALF_PI);
  arc(+100, 0, 200, 200-3*i, PI, PI+HALF_PI);
  
}