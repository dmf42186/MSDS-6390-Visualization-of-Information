// Draw Chart

void histogram(float x2, float y2, float w2, float h2) {
  
  int freq1 = 0;
  int freq2 = 0;
  int freq3 = 0;
  int freq4 = 0;
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  float mean1 = 0;
  float mean2 = 0;
  float mean3 = 0;
  float mean4 = 0;
        
  for (int i=0; i< data.length; i++) {
    if ((Float) data[i][6] < 9999) {
      freq1 = freq1+1;
      sum1 += (int) data[i][0];
    }
    else if ((Float) data[i][6] < 19999) {
      freq2 = freq2+1;
      sum2 += (int) data[i][0];
    }
    else if ((Float) data[i][6] < 29999) {
      freq3 = freq3+1;
      sum3 += (int) data[i][0];
    }
    else {
      freq4 = freq4+1;
      sum4 += (int) data[i][0];
    }
  }
  
  if (freq1 != 0) {
    mean1 = sum1/freq1;
  } else {
    mean1 = 0;
  }
  if (freq2 != 0) {
    mean2 = sum2/freq2;
  } else {
    mean2 = 0;
  }
  if (freq3 != 0) {
    mean3 = sum3/freq3;
  } else {
    mean3 = 0;
  }
  if (freq4 != 0) {
    mean4 = sum4/freq4;
  } else {
    mean4 = 0;
  }
  
  
  
  
  float l1 = map(mean1, 0, 70, 0, h2-100);
  float l2 = map(mean2, 0, 70, 0, h2-100);
  float l3 = map(mean3, 0, 70, 0, h2-100);
  float l4 = map(mean4, 0, 70, 0, h2-100);
  
  noStroke();
  fill(0,255,0);
  rect(x2+w2*1/5, y2+(h2-50)-l1, 30, l1);
  rect(x2+w2*2/5, y2+(h2-50)-l2, 30, l2);
  rect(x2+w2*3/5, y2+(h2-50)-l3, 30, l3);
  rect(x2+w2*4/5, y2+(h2-50)-l4, 30, l4);
  
}

// Create Axes and Chart Title

void drawTitleAxesHistogram(float x2, float y2, float w2, float h2) {
  textSize(16);
  fill(255);
  text("Average Age vs Insurance Charges", x2+75, 20);                          // Chart Title
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  line(x2, y2+h2, x2+w2, y2+h2);
  line(x2, y2+h2-50, x2+w2, y2+h2-50);                                          // x-axis
  line(x2, y2, x2, y2+h2);                                                      // y-axis
  
  float intervalX = w2/5;
  String[] axisX = {"0-10K", "10K-20K", "20K-30K", "Above 30K"};
  for(int i=0; i<4; i++) {
    text(axisX[i], x2+intervalX*(i+1), h2-25);                                  // x-axis labels (Charges)
  }
  
  textSize(12);
  fill(255);
  stroke(255);  
  strokeWeight(2);
  float intervalY = (h2-100)/7;
  String[] axisY = {"10", "20", "30", "40", "50", "60", "70"};
  for(int i=0; i<7; i++) {
    text(axisY[i], x2+5, y2+(h2-50)-intervalY*(i+1));                           // y-axis labels (Frequency)
  }
}