void pieChart(float x5, float y5, float w5, float h5, float diameter) {
  textSize(16);
  text("Frequency of smokers and non-smokers", x5+50, y5+20);
  
  int[][] sliceColors = {{255,0,0}, {0,0,255}};
  String[] categories = {"Smokers", "Non-smokers"};
  for(int i=0; i < categories.length; i++) {
    fill(sliceColors[i][0], sliceColors[i][1], sliceColors[i][2]);
    noStroke();
    rect(x5+w5/3*(i+1)-30, y5+75, 10, 10);
    fill(255);
    textSize(12);
    text(categories[i], (x5+w5/3*(i+1)-30)+15, y5+85);                             
  }
  
  stroke(255);
  line(x5, y5, x5, y5+h5);
  
  int smokers = 0;
  int non_smokers = 0;

  for (int i = 0; i < data.length; i++) {
    if (data[i][4].equals("yes")) {
       smokers += 1;
     }
    if (data[i][4].equals("no")) {
       non_smokers += 1;
     }
  }
  
  float lastAngle = 0;
  float[] angles = {smokers/(float) data.length*TWO_PI, TWO_PI - smokers/(float) data.length*TWO_PI};
 

  for (int i = 0; i < angles.length; i++) {
    if (i == 0) {
      fill(255);
      textSize(12);
      text(nf(smokers/(float) data.length*100, 1, 1) +"%", x5+(width-200)*1/3*1/2 + 15 + diameter/2*cos((lastAngle+angles[i])/2), y5+height/2*1/2 + 15 + diameter/2*sin(lastAngle+angles[i])/2);
      fill(255, 0, 0);
    } else {
      fill(255);
      textSize(12);
      text(nf(non_smokers/(float) data.length*100, 1, 1) +"%", x5+(width-200)*1/3*1/2 - 35 + diameter/2*cos((lastAngle+angles[i])/2), y5+height/2*1/2 - 35 + diameter/2*sin(lastAngle+angles[i])/2);
      fill(0, 0, 255);
    }
    noStroke();
    arc(x5+(width-200)*1/3*1/2, y5+height/2*1/2, diameter, diameter, lastAngle, lastAngle+angles[i]);
    lastAngle += angles[i];
    
  }
}