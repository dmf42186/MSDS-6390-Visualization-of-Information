float interval = 1200/18;
String[] teams = {"CLE", "DAL", "DEN", "GSW", "HOU", "IND", "LAC"};
int[][] teamColors = {
  {128,0,255},
  {255,128,0},
  {0,0,255},
  {255,0,0},
  {0,255,0},
  {255,255,0},
  {255,0,255}
};

void setup() {    
  size(1110, 800);
  background(0);
  drawGraph();
}

void drawGraph() {
  drawLegend();
  drawLines();
  drawTitleAxes();
}

void drawTitleAxes() {
  //fill(255);
  //stroke(0);
  //rect(0, 35, 35, 640);
  textSize(36);
  text("Kobe Bryant's Field Goal % vs. Selected Teams by Year", 100, 60);
  textSize(12);
  stroke(255);  
  strokeWeight(5);
  line(0, 700, width, 700);
  String[] axisX = {"1996-97", "1997-98", "1998-99", "1999-00", "2000-01", "2001-02", "2002-03", "2003-04", "2004-05", 
  "2005-06", "2006-07", "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13"};
  
  for(int i=0; i<17; i++) {
    text(axisX[i], interval*(i), 725);
  }
  
  textSize(15);
  for(int i=0; i<10; i++) {
    String[] axisY = {"30%", "35%", "40%", "45%", "50%", "55%", "60%", "65%", "70%", "75%"};
    text(axisY[i], 5, (height - 150) - 63*i);
  }
}

void drawLegend() {
  int xpos = 650;
  int ypos = 650;
  for(int i=0; i<7; i++) {
    noStroke();
    fill(teamColors[i][0], teamColors[i][1], teamColors[i][2]);
    rect(xpos + 55*(i+1), ypos , 10, 10);
    fill(255);
    textSize(16);
    text(teams[i], xpos + 12 + 55*(i+1), ypos+10);
  }
}

void drawLine(int rowN, float start, float end) {
  noFill();
  

  float c1 = start + (end - start) / 7.;
  float c2 = end + (end - start) / 7.;
  
  if (rowN == 0) {
      start = end;
      c1 = end;
      c2 = end;
  }  
  bezier(
    interval*rowN - interval,
    map(start, 0.25, 0.75, 600, 100),
    interval*rowN+interval*1/3 - interval,
    map(c1, 0.25, 0.75, 600, 100),
    interval*rowN+interval*2/3 - interval,
    map(c2, 0.25, 0.75, 600, 100),
    interval*(rowN+1) - interval,
    map(end, 0.25, 0.75, 600, 100));  
}

void drawLines() {
  Table data = loadTable("data.csv", "header");
  strokeWeight(5);
  for(int i=0; i< data.getRowCount(); i++) {
    TableRow dataRow = data.getRow(i);
    
    for(int j=0; j<7; j++) {
      String team = teams[j];
      //println(team + "_start");
      stroke(teamColors[j][0], teamColors[j][1], teamColors[j][2]);
      drawLine(i,
        dataRow.getFloat(team + "_start"),
        dataRow.getFloat(team + "_end"));
    }
  }
}