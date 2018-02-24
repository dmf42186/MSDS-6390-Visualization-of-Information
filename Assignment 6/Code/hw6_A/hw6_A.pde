float interval = 1000/18;
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
  size(1000, 500);
  background(0);
  drawGraph();
}

void drawGraph() {
  drowBottom();
  drawLines();
  drawTeams();
}

void drowBottom() {
  stroke(255);
  strokeWeight(5);
  line(0, 400, width, 400);
  String[] axisX = {"1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012"};
  for(int i=0; i<17; i++) {
    text(axisX[i], interval*(i+1), 425);
  }
}

void drawTeams() {
  for(int i=0; i<7; i++) {
    text(teams[i], 10, 400-30*(i+1));
  }
}

void drawLine(int rowN, float start, float c1, float c2, float end) {
  noFill();
  bezier(
    interval*rowN,
    map(start, 0, 4, 400, 100),
    interval*rowN+interval*1/3,
    map(c1, 0, 4, 400, 100),
    interval*rowN+interval*2/3,
    map(c2, 0, 4, 400, 100),
    interval*(rowN+1),
    map(end, 0, 4, 400, 100));  
}

void drawLines() {
  Table data = loadTable("data.csv", "header");
  strokeWeight(5);
  for(int i=0; i< data.getRowCount(); i++) {
    TableRow dataRow = data.getRow(i);
    for(int j=0; j<7; j++) {
      String team = teams[j];
      println(team + "_start");
      stroke(teamColors[j][0], teamColors[j][1], teamColors[j][2]);
      drawLine(i,
        dataRow.getFloat(team + "_start"),
        dataRow.getFloat(team + "_c1"),
        dataRow.getFloat(team + "_c2"),
        dataRow.getFloat(team + "_end"));
    }
  }
}
