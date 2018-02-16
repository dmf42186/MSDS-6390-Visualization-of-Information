PImage kobe;

void setup() {
  size(1000, 500);
  kobe = loadImage("kobe.jpg");
  kobe.resize(1000, 500);
  background(kobe);  
}

void draw() {
  
  float interval = width/18;
  
  stroke(255);
  strokeWeight(5);
  line(0, 400, width, 400);
  
  String[] axisX = {"1996-97", "1997-98", "1998-99", "1999-00", "2000-01", "2001-02", "2002-03", "2003-04", "2004-05", "2005-06", "2006-07", "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13"};
  for(int i=0; i<17; i++) {
    text(axisX[i], interval*(i+1), 425);
  }
  
  float[] axisY = {0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 1.75, 2.00, 2.25, 2.50, 2.75, 3.00, 3.25, 3.50, 3.75, 4.00};
  for(int i=0; i<16; i++) {
    text(axisY[i], 10, 400-18.75*(i+1));
  }
  
  stroke(255);
  strokeWeight(5);
  line(0, 450, 0, 100); 
  
  
  float[] startCLE = {0.44, 0.33, 0.38, 0.36, 0.41, 0.40, 0.53, 0.45, 0.50, 0.37, 0.43, 0.49, 0.48, 0.36, 0.38, 0.33, 0.42, 0.63, 0.44};
  float[] control1CLE = {0.42, 0.34, 0.38, 0.37, 0.41, 0.43, 0.52, 0.46, 0.47, 0.38, 0.45, 0.49, 0.46, 0.37, 0.37, 0.35, 0.46, 0.59, 0.44};
  float[] control2CLE = {0.35, 0.37, 0.37, 0.40, 0.40, 0.51, 0.47, 0.49, 0.39, 0.42, 0.48, 0.49, 0.39, 0.37, 0.34, 0.41, 0.59, 0.48, 0.44};
  float[] endCLE = {0.33, 0.38, 0.36, 0.41, 0.40, 0.53, 0.45, 0.50, 0.37, 0.43, 0.49, 0.48, 0.36, 0.38, 0.33, 0.42, 0.63, 0.44, 0.44};
  
  float[] startDAL = {0.88, 0.67, 0.92, 0.82, 0.81, 0.91, 0.91, 0.88, 0.82, 0.91, 0.88, 0.94, 1.02, 0.90, 0.78, 0.75, 0.82, 1.22, 0.88};
  float[] control1DAL = {0.84, 0.72, 0.90, 0.81, 0.83, 0.91, 0.91, 0.87, 0.84, 0.91, 0.89, 0.96, 1.00, 0.88, 0.77, 0.77, 0.90, 1.15, 0.88};
  float[] control2DAL = {0.71, 0.87, 0.84, 0.81, 0.89, 0.91, 0.89, 0.83, 0.89, 0.89, 0.93, 1.00, 0.93, 0.80, 0.76, 0.81, 1.14, 0.95, 0.88};
  float[] endDAL = {0.67, 0.92, 0.82, 0.81, 0.91, 0.91, 0.88, 0.82, 0.91, 0.88, 0.94, 1.02, 0.90, 0.78, 0.75, 0.82, 1.22, 0.88, 0.88};
  
  float[] startDEN = {1.34, 1.05, 1.47, 1.37, 1.32, 1.44, 1.44, 1.43, 1.27, 1.33, 1.35, 1.32, 1.53, 1.37, 1.15, 1.18, 1.20, 1.68, 1.34};
  float[] control1DEN = {1.28, 1.13, 1.45, 1.36, 1.34, 1.44, 1.44, 1.40, 1.28, 1.34, 1.35, 1.37, 1.50, 1.33, 1.15, 1.19, 1.30, 1.61, 1.34};
  float[] control2DEN = {1.11, 1.38, 1.39, 1.33, 1.42, 1.44, 1.43, 1.30, 1.32, 1.35, 1.33, 1.49, 1.40, 1.19, 1.18, 1.20, 1.59, 1.41, 1.34};
  float[] endDEN = {1.05, 1.47, 1.37, 1.32, 1.44, 1.44, 1.43, 1.27, 1.33, 1.35, 1.32, 1.53, 1.37, 1.15, 1.18, 1.20, 1.68, 1.34, 1.34};
  
  float[] startGSW = {1.81, 1.76, 2.02, 1.87, 1.70, 1.99, 2.12, 1.92, 1.84, 1.61, 1.75, 1.78, 1.89, 1.80, 1.56, 1.70, 1.69, 2.09, 1.81};
  float[] control1GSW = {1.80, 1.81, 1.99, 1.83, 1.76, 2.01, 2.08, 1.91, 1.80, 1.64, 1.76, 1.80, 1.87, 1.75, 1.59, 1.70, 1.77, 2.03, 1.81};
  float[] control2GSW = {1.77, 1.97, 1.90, 1.73, 1.93, 2.09, 1.96, 1.86, 1.66, 1.72, 1.78, 1.87, 1.81, 1.60, 1.67, 1.69, 2.01, 1.87, 1.81};
  float[] endGSW = {1.76, 2.02, 1.87, 1.70, 1.99, 2.12, 1.92, 1.84, 1.61, 1.75, 1.78, 1.89, 1.80, 1.56, 1.70, 1.69, 2.09, 1.81, 1.81};
  
  float[] startHOU = {2.24, 2.10, 2.49, 2.27, 2.13, 2.56, 2.53, 2.37, 2.23, 1.95, 2.25, 2.19, 2.28, 2.27, 1.96, 2.15, 2.09, 2.52, 2.24};
  float[] control1HOU = {2.21, 2.17, 2.44, 2.24, 2.21, 2.55, 2.50, 2.35, 2.18, 2.01, 2.24, 2.21, 2.28, 2.21, 2.00, 2.14, 2.18, 2.46, 2.24};
  float[] control2HOU = {2.13, 2.41, 2.32, 2.16, 2.47, 2.54, 2.41, 2.26, 2.01, 2.19, 2.20, 2.26, 2.27, 2.03, 2.11, 2.10, 2.43, 2.30, 2.24};
  float[] endHOU = {2.10, 2.49, 2.27, 2.13, 2.56, 2.53, 2.37, 2.23, 1.95, 2.25, 2.19, 2.28, 2.27, 1.96, 2.15, 2.09, 2.52, 2.24, 2.24};
  
  float[] startIND = {2.64, 2.52, 2.74, 2.73, 2.51, 2.97, 2.99, 2.72, 2.63, 2.39, 2.58, 2.55, 2.75, 2.80, 2.46, 2.66, 2.54, 2.85, 2.64};
  float[] control1IND = {2.62, 2.57, 2.73, 2.68, 2.60, 2.98, 2.93, 2.70, 2.58, 2.43, 2.57, 2.59, 2.76, 2.73, 2.50, 2.64, 2.60, 2.81, 2.64};
  float[] control2IND = {2.54, 2.69, 2.73, 2.55, 2.88, 2.98, 2.78, 2.65, 2.44, 2.54, 2.55, 2.71, 2.79, 2.53, 2.62, 2.56, 2.79, 2.68, 2.64};
  float[] endIND = {2.52, 2.74, 2.73, 2.51, 2.97, 2.99, 2.72, 2.63, 2.39, 2.58, 2.55, 2.75, 2.80, 2.46, 2.66, 2.54, 2.85, 2.64, 2.64};
  
  float[] startLAC = {3.09, 2.87, 3.12, 3.24, 3.03, 3.47, 3.47, 3.17, 3.16, 2.87, 3.04, 2.99, 3.27, 3.19, 2.85, 3.20, 3.05, 3.37, 3.09};
  float[] control1LAC = {3.05, 2.92, 3.15, 3.20, 3.12, 3.47, 3.41, 3.17, 3.10, 2.91, 3.03, 3.05, 3.25, 3.12, 2.92, 3.17, 3.11, 3.31, 3.09};
  float[] control2LAC = {2.91, 3.07, 3.22, 3.07, 3.39, 3.47, 3.23, 3.16, 2.93, 3.01, 3.00, 3.21, 3.21, 2.92, 3.13, 3.08, 3.30, 3.15, 3.09};
  float[] endLAC = {2.87, 3.12, 3.24, 3.03, 3.47, 3.47, 3.17, 3.16, 2.87, 3.04, 2.99, 3.27, 3.19, 2.85, 3.20, 3.05, 3.37, 3.09, 3.09};
  
  
  for(int i=0; i<19; i++) {
    float y1CLE = map(startCLE[i], 0, 4, 400, 100);
    float y2CLE = map(control1CLE[i], 0, 4, 400, 100);
    float y3CLE = map(control2CLE[i], 0, 4, 400, 100);
    float y4CLE = map(endCLE[i], 0, 4, 400, 100);
    
    float y1DAL = map(startDAL[i], 0, 4, 400, 100);
    float y2DAL = map(control1DAL[i], 0, 4, 400, 100);
    float y3DAL = map(control2DAL[i], 0, 4, 400, 100);
    float y4DAL = map(endDAL[i], 0, 4, 400, 100);
    
    float y1DEN = map(startDEN[i], 0, 4, 400, 100);
    float y2DEN = map(control1DEN[i], 0, 4, 400, 100);
    float y3DEN = map(control2DEN[i], 0, 4, 400, 100);
    float y4DEN = map(endDEN[i], 0, 4, 400, 100);
    
    float y1GSW = map(startGSW[i], 0, 4, 400, 100);
    float y2GSW = map(control1GSW[i], 0, 4, 400, 100);
    float y3GSW = map(control2GSW[i], 0, 4, 400, 100);
    float y4GSW = map(endGSW[i], 0, 4, 400, 100);
    
    float y1HOU = map(startHOU[i], 0, 4, 400, 100);
    float y2HOU = map(control1HOU[i], 0, 4, 400, 100);
    float y3HOU = map(control2HOU[i], 0, 4, 400, 100);
    float y4HOU = map(endHOU[i], 0, 4, 400, 100);
    
    float y1IND = map(startIND[i], 0, 4, 400, 100);
    float y2IND = map(control1IND[i], 0, 4, 400, 100);
    float y3IND = map(control2IND[i], 0, 4, 400, 100);
    float y4IND = map(endIND[i], 0, 4, 400, 100);
    
    float y1LAC = map(startLAC[i], 0, 4, 400, 100);
    float y2LAC = map(control1LAC[i], 0, 4, 400, 100);
    float y3LAC = map(control2LAC[i], 0, 4, 400, 100);
    float y4LAC = map(endLAC[i], 0, 4, 400, 100);
    
    
    stroke(128,0,255);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1CLE, interval*i+interval*1/3, y2CLE, interval*i+interval*2/3, y3CLE, interval*(i+1), y4CLE);
    
    stroke(255,128,0);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1DAL, interval*i+interval*1/3, y2DAL, interval*i+interval*2/3, y3DAL, interval*(i+1), y4DAL);
    
    stroke(0,0,255);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1DEN, interval*i+interval*1/3, y2DEN, interval*i+interval*2/3, y3DEN, interval*(i+1), y4DEN);
    
    stroke(255,0,0);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1GSW, interval*i+interval*1/3, y2GSW, interval*i+interval*2/3, y3GSW, interval*(i+1), y4GSW);
    
    stroke(0,255,0);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1HOU, interval*i+interval*1/3, y2HOU, interval*i+interval*2/3, y3HOU, interval*(i+1), y4HOU);
    
    stroke(255,255,0);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1IND, interval*i+interval*1/3, y2IND, interval*i+interval*2/3, y3IND, interval*(i+1), y4IND);
    
    stroke(255,0,255);
    strokeWeight(5);
    noFill();
    bezier(interval*i, y1LAC, interval*i+interval*1/3, y2LAC, interval*i+interval*2/3, y3LAC, interval*(i+1), y4LAC);
  }
}