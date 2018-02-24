void drawImage() {
  img.resize(400,530);
  loadPixels();                                          // Load pixels in the frame
  img.loadPixels();                                      // Load pixels according to the original image
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      int loc = x + y * width;                           // Identify each individual pixel location 
      pixels[loc] = img.pixels[loc];                     // Map the pixel colors in the new drawing based on original image
    }
  }
  updatePixels();
}

void increaseBrightness() {
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      int loc = x + y * img.width;
      float r = red(img.pixels[loc]);                     // Read 'RED' component from pixels
      float g = green(img.pixels[loc]);                   // Read 'GREEN' component from pixels 
      float b = blue(img.pixels[loc]);                    // Read 'BLUE' component from pixels
      r += int(brightness * 200);                         // Increase brightness for 'RED'
      g += int(brightness * 200);                         // Increase brightness for 'GREEN'
      b += int(brightness * 200);                         // Increase brightness for 'BLUE'
      pixels[loc] = color(r, g, b);                       // Combine color components for pixels
    }
  }
  updatePixels();                                         // Update resulting color/brightness
}

void decreaseBrightness() {
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      int loc = x + y * img.width;
      float r = red(img.pixels[loc]);                     // Read 'RED' component from pixels
      float g = green(img.pixels[loc]);                   // Read 'GREEN' component from pixels
      float b = blue(img.pixels[loc]);                    // Read 'BLUE' component from pixels
      r -= int(brightness * 200);                         // Decrease brightness for 'RED'
      g -= int(brightness * 200);                         // Decrease brightness for 'RED'
      b -= int(brightness * 200);                         // Decrease brightness for 'RED'
      pixels[loc] = color(r, g, b);                       // Combine color components for pixels
    }
  }
  updatePixels();                                         // Update resulting color/brightness
}