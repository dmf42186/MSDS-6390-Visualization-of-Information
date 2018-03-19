// Draw Chart

void bubble(float x4, float y4, float w4, float h4){
  int freq1 = 0;
  int freq2 = 0;
  int freq3 = 0;
  int freq4 = 0;
  
  for (int i=0; i< data.length; i++) {
    if (((String) data[i][1]).equals("female")) {
      if (((String) data[i][4]).equals("no")) {
        freq1 += 1;
      } else {
        freq2 += 1;
      }
    } else {
      if (((String) data[i][4]).equals("no")) {
        freq3 += 1;
      } else {
        freq4 += 1;
      }
    }
  }
    
  float size1 = map(freq1, 0, 1338, 0, 200);
  float size2 = map(freq2, 0, 1338, 0, 200);
  float size3 = map(freq3, 0, 1338, 0, 200);
  float size4 = map(freq4, 0, 1338, 0, 200);
  
  noStroke();
  fill(255,0,255);
  
  ellipse(x4+w4*1/3, y4+(h4-50)-(h4-100)*1/3, size1, size1);
  ellipse(x4+w4*1/3, y4+(h4-50)-(h4-100)*2/3, size2, size2);
  ellipse(x4+w4*2/3, y4+(h4-50)-(h4-100)*1/3, size3, size3);
  ellipse(x4+w4*2/3, y4+(h4-50)-(h4-100)*2/3, size4, size4);
}

// Create Axes and Chart Title

void drawTitleAxesBubble(float x4, float y4, float w4, float h4) {
  textSize(16);
  fill(255);
  text("Smoking Habit by Gender", x4+100, y4+20);                      // Chart Title
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  line(x4, y4+(h4-50), x4+w4, y4+(h4-50));
  
  float intervalX = w4/3;
  String[] axisX = {"Female", "Male"};
  for(int i=0; i<2; i++) {
    text(axisX[i], x4+intervalX*(i+1), y4+(h4-25));                    // x-axis labels (Charges)
  }
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  float intervalY = (h4-100)/3;
  String[] axisY = {"Non-Smoker", "Smoker"};
  for(int i=0; i<2; i++) {
    text(axisY[i], x4+1, y4+(h4-50)-intervalY*(i+1));                  // y-axis labels (Frequency)
  }
}