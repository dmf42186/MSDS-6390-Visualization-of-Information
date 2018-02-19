float interval = 1800/18;
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
  size(1800, 900);
  background(0);
  drawGraph();
}

void drawGraph() {
  drawTitleAxes();
  drawLines();
  drawLegend();
}

void drawTitleAxes() {
  textSize(36);
  text("Kobe Bryant's Field Goal % vs. Selected Teams by Year", 700, 50);
  textSize(12);
  stroke(255);  
  strokeWeight(5);
  line(0, 800, width, 800);
  String[] axisX = {"1996-97", "1997-98", "1998-99", "1999-00", "2000-01", "2001-02", "2002-03", "2003-04", "2004-05", 
  "2005-06", "2006-07", "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13"};
  for(int i=0; i<17; i++) {
    text(axisX[i], interval*(i+1), 825);
  }
  for(int i=0; i<10; i++) {
    String[] axisY = {"30%", "35%", "40%", "45%", "50%", "55%", "60%", "65%", "70%", "75%"};
    text(axisY[i], 5, (height - 150) - 72*i);
  }
}

void drawLegend() {
  for(int i=0; i<7; i++) {
    noStroke();
    fill(teamColors[i][0], teamColors[i][1], teamColors[i][2]);
    rect(13 + 55*(i+1), 40 , 10, 10);
    fill(255);
    textSize(16);
    text(teams[i], 25 + 55*(i+1), 50);
  }
}

void drawLine(int rowN, float start, float c1, float c2, float end) {
  noFill();
  bezier(
    interval*rowN,
    map(start, 0.25, 0.75, 800, 100),
    interval*rowN+interval*1/3,
    map(c1, 0.25, 0.75, 800, 100),
    interval*rowN+interval*2/3,
    map(c2, 0.25, 0.75, 800, 100),
    interval*(rowN+1),
    map(end, 0.25, 0.75, 800, 100));  
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
        dataRow.getFloat(team + "_c1"),
        dataRow.getFloat(team + "_c2"),
        dataRow.getFloat(team + "_end"));
    }
  }
}