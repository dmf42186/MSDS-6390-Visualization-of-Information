//////////*****************************************************************************************//////////
//////////*****************************************************************************************//////////
/////*****                                                                                         *****/////
/////*****     Program to Visualize Kobe Bryant's Field Goal % vs. Selected Teams by Year          *****/////
/////*****                                                                                         *****/////
//////////*****************************************************************************************//////////
//////////*****************************************************************************************//////////


// Data Source:  https://www.kaggle.com/c/kobe-bryant-shot-selection/data
// Field Goal % = (#Scoring shots / #Attempted shots)


///***  Define Variables & Arrays   ***///

float interval = 1200/18;                                                    // Set up number of major axis points on x-axis
String[] teams = {"CLE", "DAL", "DEN", "GSW", "HOU", "IND", "LAC"};          // Array of opponent teams
int[][] teamColors = {                                                       // Assign line colors for opponent teams
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
  drawTitleAxes();
  drawLegend();
  drawLines();  
}


///***  Draw Axes, Grid, Legend & Chart Title   ***///

void drawTitleAxes() {
  textSize(36);
  text("Kobe Bryant's Field Goal % vs. Selected Teams by Year", 100, 60);      // Chart Title
  
  textSize(12);
  stroke(255);  
  strokeWeight(5);
  line(0, 700, width, 700);
  
  String[] axisX = {"1996-97", "1997-98", "1998-99", "1999-00", "2000-01", "2001-02", "2002-03", "2003-04", "2004-05", "2005-06", "2006-07", "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13"};
  for(int i=0; i<17; i++) {
    text(axisX[i], interval*(i), 725);                                         // x-axis labels (Years)
  }

  textSize(15);
  for(int i=0; i<9; i++) {
    String[] axisY = {"30%", "35%", "40%", "45%", "50%", "55%", "60%", "65%", "70%"};
    text(axisY[i], 5, (height - 150) - 63*i);                                  // y-axis labels (Success ratio)
    
    stroke(255);
    strokeWeight(0.1);
    line(0, (height - 150) - 63*i, width, (height - 150) - 63*i);              // horizontal grids
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
    text(teams[i], xpos + 12 + 55*(i+1), ypos+10);                              // color legend for opponent teams
  }
}


///***  Draw Smooth Line Diagrams with 'bezier' Curves    ***///

void drawLine(int rowN, float start, float end) {                              // Define function to draw a single bezier curve
  noFill();
  float c1 = start + (end - start) / 7.;                                       // Define first control point for a bezier curve
  float c2 = end + (end - start) / 7.;                                         // Define second control point for a bezier curve

  if (rowN == 0) {
      start = end;
      c1 = end;
      c2 = end;                                                                 // Set up the starting point at the 1st row of dataset that is for year 1996-97
  }  

  bezier(
    interval*rowN - interval, map(start, 0.25, 0.75, 600, 100),                 // start point - x1, y1; 'map' function used to fit in the scale for y-axis
    interval*rowN+interval*1/3 - interval, map(c1, 0.25, 0.75, 600, 100),       // first control point - x2, y2; 'map' function used to fit in the scale for y-axis
    interval*rowN+interval*2/3 - interval, map(c2, 0.25, 0.75, 600, 100),       // second control point - x3, y3; 'map' function used to fit in the scale for y-axis
    interval*(rowN+1) - interval, map(end, 0.25, 0.75, 600, 100));              // end point - x4, y4; 'map' function used to fit in the scale for y-axis
}

void drawLines() {                                                              // Draw a continuous bezier curves with help of the defined function for all teams that Kobe played against
  Table data = loadTable("data.csv", "header");
  strokeWeight(5);

  for(int i=0; i< data.getRowCount(); i++) {
    TableRow dataRow = data.getRow(i);
    for(int j=0; j<7; j++) {
      String team = teams[j];
      stroke(teamColors[j][0], teamColors[j][1], teamColors[j][2]);
      drawLine(i,
        dataRow.getFloat(team + "_start"),
        dataRow.getFloat(team + "_end"));
    }
  }
}