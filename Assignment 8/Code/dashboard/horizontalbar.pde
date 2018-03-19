// Draw Chart

void horizontalbar(float x1, float y1, float w1, float h1) {
  
  int freq1 = 0;
  int freq2 = 0;
  int freq3 = 0;
  int freq4 = 0;
        
  for (int i=0; i< data.length; i++) {
    if ((Float) data[i][6] < 9999) {
      freq1 = freq1+1;
    }
    else if ((Float) data[i][6] < 19999) {
      freq2 = freq2+1;
    }
    else if ((Float) data[i][6] < 29999) {
      freq3 = freq3+1;
    }
    else {
      freq4 = freq4+1;
    }
  }
  
  float l1 = map(freq1, 0, 800, 0, (w1-5));
  float l2 = map(freq2, 0, 800, 0, (w1-5));
  float l3 = map(freq3, 0, 800, 0, (w1-5));
  float l4 = map(freq4, 0, 800, 0, (w1-5));
  
  noStroke();
  fill(255,0,0);
  rect(x1, y1+(h1-50)-(h1-100)*1/5, l1, 25);
  rect(x1, y1+(h1-50)-(h1-100)*2/5, l2, 25);
  rect(x1, y1+(h1-50)-(h1-100)*3/5, l3, 25);
  rect(x1, y1+(h1-50)-(h1-100)*4/5, l4, 25);
   
}

// Create Axes and Chart Title

void drawTitleAxesHorizontalBar(float x1, float y1, float w1, float h1) {
  textSize(16);
  fill(255);
  text("Frequency Distribution of Insurance Charges", x1+25, 20);      // Chart Title
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  line(x1, y1+h1-50, x1+w1, y1+h1-50);
    
  float intervalX = w1/8;
  String[] axisX = {"100", "200", "300", "400", "500", "600", "700"}; 
  for(int i=0; i<7; i++) {
    text(axisX[i], x1+intervalX*(i+1), h1-25);    // x-axis labels (Charges)
  }
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  float intervalY = (h1-100)/5;
  String[] axisY = {"0-9,999", "10,000-19,999", "20,000-29,999", "Above 30,000"};
  for(int i=0; i<4; i++) {
    text(axisY[i], x1+6, (h1-50)-intervalY*(i+1)-5);    // y-axis labels (Frequency)
  }
}