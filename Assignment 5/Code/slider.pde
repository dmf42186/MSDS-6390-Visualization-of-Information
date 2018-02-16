int startMouseY;
int sliderPosition = 256;

// This is a value from -1 to 1.

float brightness = 0;

void drawSlider() {
  rect(30, 30, 10, 472);
  rect(15, sliderPosition, 40, 15);
}

void setSliderPosition(int position) {
   sliderPosition = position;
  if (sliderPosition < 40)
    sliderPosition = 40;
  if (sliderPosition > 472)
    sliderPosition = 472;
  brightness = ((sliderPosition - 20.) - 472./2.) / 215.;
}

boolean isClickInSlider = false;

void mousePressed() {
  if (mouseX >= 15 && mouseX <= 15 + 40) {
    isClickInSlider = true;
  } else {
    isClickInSlider = false;
  }
   if (isClickInSlider && mouseY >= sliderPosition && mouseY <= sliderPosition+15) {
    isClickInSlider = true;
  } else {
    isClickInSlider = false;
  }
  if (isClickInSlider)
    setSliderPosition(mouseY);
}

void mouseDragged() {
  if (isClickInSlider)
    setSliderPosition(mouseY);
}

void timeOfDay() {
  
  // String array to capture each hour from sunrise to sunset.
  String[] time = { "6 a.m.", "7 a.m.", "8 a.m.", "9 a.m.", "10 a.m.", "11 a.m.", "12 noon", "1 p.m.", 
                    "2 p.m.", "3 p.m.", "4 p.m.", "5 p.m.", "6 p.m.", "7 p.m.", "8 p.m.", "9 p.m."};

  textSize(16);

  // Display hour of day to the right of slider.

  for(int x = 0; x <= 14; x++) {
    if (sliderPosition >= 40 + 28.8 * x && sliderPosition < 40 + 28.8 * (x + 1)) { 
      text(time[x], 65, sliderPosition + 13.5);
    } 
  }
  if (sliderPosition == 472 ) {
      text(time[15], 65, sliderPosition + 13.5);
  }
}