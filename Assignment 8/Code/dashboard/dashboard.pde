//age, sex, bmi, children, smoker, region, charges
Object[][] data = new Object[0][7];

void setup() {
  size(800, 600);
  background(255);
  loadData(0, 100, null, 0, 1000, 0, 100, null, null, 0, 100000);
  example();
  controls();
}

void draw() {
  background(0);
}