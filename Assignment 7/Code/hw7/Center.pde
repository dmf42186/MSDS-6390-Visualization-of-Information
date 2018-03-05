class Center {

  float circle_x = 0;
  float circle_y = 0;
  float circleradius1 = 25;
  float circleradius2 = circleradius1 + 25;
  float circleradius3 = circleradius2 + 25;

  void draw() {
    fill(255);
    ellipse(circle_x, circle_y, circleradius3, circleradius3);

    fill(200);
    ellipse(circle_x, circle_y, circleradius2, circleradius2);

    fill(0);
    ellipse(circle_x, circle_y, circleradius1, circleradius1);
  }
}