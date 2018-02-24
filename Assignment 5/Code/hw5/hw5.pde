PImage img;

void setup() {
  size(400, 530);              
  img = loadImage("Grand Canyon.jpg");
}

void draw() {
  // Draw the original image
  drawImage();
  
  // Adjust brightness
  if (sliderPosition < img.height/2) {
    increaseBrightness();
  } else {
    decreaseBrightness();
  }
  
  // Insert a time scale
  drawSlider();
  timeOfDay();
}