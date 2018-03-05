void drawCenter(float rad) {
  // BEGIN DECLARE/INITIALIZE VARIABLES
  
  // Inner Circle 
  float circleradius1 = rad;
  float circle1_x = 0;
  float circle1_y = 0;
  
  // Middle Circle
  // Outer Circle 
  float circleradius2 = rad + 25;
  float circle2_x = 0;
  float circle2_y = 0;
  
  // Outer Circle 
  float circleradius3 = rad + 50;
  float circle3_x = 0;
  float circle3_y = 0;
  
  
  // Draw Circles
    
  fill(255);
  ellipse(circle2_x, circle2_y, circleradius3, circleradius3);
  
  fill(200);
  ellipse(circle1_x, circle1_y, circleradius2, circleradius2);
  
  fill(0);
  ellipse(circle1_x, circle1_y, circleradius1, circleradius1);
}