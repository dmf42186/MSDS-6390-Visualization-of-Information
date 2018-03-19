void example() {
  // to calucalte the mean inshurenace
  float sum = 0;
  for(int i=0; i< data.length; i++) {
    sum += (Float) data[i][6];
  }
  print("Mean of all insurance premiums: ");
  println(sum/data.length); 
}