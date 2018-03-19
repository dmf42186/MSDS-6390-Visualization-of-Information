//age, sex, bmi, children, smoker, region, charges
Object[][] data = new Object[0][7];

void setup() {
  size(1400, 800);
  background(0);
  loadData(0, 100, null, 0, 1000, 0, 100, null, null, 0, 100000);
  example();
  controls();
}

void draw() {
  background(0);
  
// Chart 1
  horizontalbar(200, 0, (width-200)*1/3, height/2);                        // x1=c, y1=0, w1=(width-200)*1/3, h1=height/2
  drawTitleAxesHorizontalBar(200, 0, (width-200)*1/3, height/2);           // // x1=c, y1=0, w1=(width-200)*1/3, h1=height/2
  
// Chart 2
  histogram(600, 0, (width-200)*1/3, height/2);                            // x2=c+width*1/3, y2=0, w2=(width-200)*1/3, h2=height/2
  drawTitleAxesHistogram(600, 0, (width-200)*1/3, height/2);               // x2=c+width*1/3, y2=0, w2=(width-200)*1/3, h2=height/2
  
// Chart 3
  scatter1(1000, 0, (width-200)*1/3, height/2);                            // x3=c+width*2/3, y3=0, w3=(width-200)*1/3, h3=height/2
  drawTitleAxesScatter1(1000, 0, (width-200)*1/3, height/2);               // x3=c+width*2/3, y3=0, w3=(width-200)*1/3, h3=height/2
  
// Chart 4
  bubble(200, 400, (width-200)*1/3, height/2);                           // x4=c, y4=height/2, w4=(width-200)*1/3, h4=height/2
  drawTitleAxesBubble(200, 400, (width-200)*1/3, height/2);                // x4=c, y4=height/2, w4=(width-200)*1/3, h4=height/2
}