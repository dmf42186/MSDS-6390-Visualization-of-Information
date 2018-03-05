Sculpture sculpture;

void setup() {
  size(600, 600);
  background(0);
  sculpture = new Sculpture();
}

void draw() {
  sculpture.rotateArms();
}