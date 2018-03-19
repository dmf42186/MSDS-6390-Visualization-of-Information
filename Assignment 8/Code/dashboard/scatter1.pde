// Draw Chart

void scatter1(float x3, float y3, float w3, float h3) {
  for(int i=0; i< data.length; i++) {
    float x = map((Float)data[i][2], 0, 60, 0, w3);
    float y = map((Float)data[i][6], 0, 70000, (h3-50), 50);
    
    noStroke();
    fill(125,0,255);
    ellipse(x3+x, y3+y, 5, 5);
  }
}

// Create Axes and Chart Title

void drawTitleAxesScatter1(float x3, float y3, float w3, float h3) {
  textSize(16);
  fill(255);
  text("Scatter Plot for Insurance Charges vs BMI", x3+50, 20);                                // Chart Title
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  line(x3, y3+h3, x3+w3, y3+h3);
  line(x3, y3+(h3-50), x3+w3, y3+(h3-50));                                                     // x-axis
  line(x3, y3, x3, y3+h3);                                                                     // y-axis
  
  float intervalX = w3/6;
  String[] axisX = {"10", "20", "30", "40", "50", "60"};
  for(int i=0; i<5; i++) {
    text(axisX[i], x3+intervalX*(i+1), y3+(h3-25));                                            // x-axis labels (BMI)
  }
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  float intervalY = (h3-100)/7;
  String[] axisY = {"10,000", "20,000", "30,000", "40,000", "50,000", "60,000", "70,000"};
  for(int i=0; i<7; i++) {
    text(axisY[i], x3+1, (h3-50)-intervalY*(i+1));                                             // y-axis labels (Charges)
  }
}