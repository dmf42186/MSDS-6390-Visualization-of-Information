void pieByCharges(float x6, float y6, float w6, float h6, float diameter) {
  textSize(16);
  fill(255);
  text("Frequency of smokers and non-smokers by low and high insurance charges", x6+50, y6+8, 325, 50);
  textSize(12);
  text("Low Charges", x6+w6*1/4-35, y6+h6-100);
  text("High Charges", x6+w6*3/4-35, y6+h6-100);
  
  int[][] sliceColors = {{255,0,0}, {0,0,255}};
  String[] categories = {"Smokers", "Non-smokers"};
  for(int i=0; i < categories.length; i++) {
    fill(sliceColors[i][0], sliceColors[i][1], sliceColors[i][2]);
    rect(x6+w6/3*(i+1)-30, y6+100, 10, 10);
    fill(255);
    text(categories[i], (x6+w6/3*(i+1)-50)+35, y6+110);                             
  }
  
  stroke(255);
  line(x6, y6, x6, y6+h6);
  
  float low_charges = 0;
  float high_charges = 0;
  int smokers_low = 0;
  int non_smokers_low = 0;
  int smokers_high = 0;
  int non_smokers_high = 0;
  
  for (int i = 0; i < data.length; i++) {
    if ((float) data[i][6] < 15000) {
       low_charges += 1;
       if (data[i][4].equals("yes")) {
       smokers_low += 1;
     }
       if (data[i][4].equals("no")) {
       non_smokers_low += 1;
     }
    }
    if ((float) data[i][6] >= 15000) {
       high_charges += 1;
       if (data[i][4].equals("yes")) {
         smokers_high += 1;
     }
       if (data[i][4].equals("no")) {
         non_smokers_high += 1;
     }
    }
  }
  
  float lastAngle_low = 0;
  float[] angles_low = {smokers_low/low_charges*TWO_PI, TWO_PI - smokers_low/low_charges*TWO_PI};
 
  for (int i = 0; i < angles_low.length; i++) {
    if (i == 0) {
      fill(255);
      text(nf(smokers_low/low_charges*100, 1, 1) +"%", x6+(width-200)*1/3*1/4 + 10 + diameter/2*cos((lastAngle_low+angles_low[i])/2), y6+height/2*1/2 + 10 + diameter/2*sin(lastAngle_low+angles_low[i])/2);
      fill(255, 0, 0);
    } else {
      fill(255);
      text(nf(non_smokers_low/low_charges*100, 1, 1) +"%", x6+(width-200)*1/3*1/4 - 30 + diameter/2*cos((lastAngle_low+angles_low[i])/2), y6+height/2*1/2 - 30 + diameter/2*sin(lastAngle_low+angles_low[i])/2);
      fill(0, 0, 255);
    }
    noStroke();
    arc(x6+w6*1/4, y6+height/2*1/2, diameter, diameter, lastAngle_low, lastAngle_low+angles_low[i]);
    lastAngle_low += angles_low[i];
  }
  
  float lastAngle_high = 0;
  float[] angles_high = {smokers_high/high_charges*TWO_PI, TWO_PI - smokers_high/high_charges*TWO_PI};
 
  for (int i = 0; i < angles_high.length; i++) {
    if (i == 0) {
      fill(255);
      text(nf(smokers_high/high_charges*100, 1, 1) +"%", x6+(width-200)*1/3*3/4 - 105 - diameter/2*cos((lastAngle_high + angles_high[i])/2), y6+height/2*1/2 - diameter/2*sin(lastAngle_high + angles_high[i]));
      fill(255, 0, 0);
    } else {
      fill(255);
      text(nf(non_smokers_high/high_charges*100, 1, 1) +"%", x6+(width-200)*1/3*3/4 + 100 + diameter/2*cos((lastAngle_high + angles_high[i])/2), y6+height/2*1/2 - 30 + diameter/2*sin(lastAngle_high + angles_high[i])/2);
      fill(0, 0, 255);
    }
    noStroke();
    arc(x6+w6*3/4, y6+height/2*1/2, diameter, diameter, lastAngle_high, lastAngle_high + angles_high[i]);
    lastAngle_high += angles_high[i];
  }
}