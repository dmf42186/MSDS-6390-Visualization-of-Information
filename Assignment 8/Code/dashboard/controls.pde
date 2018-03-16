import controlP5.*;
ControlP5 controlP5;

RadioButton sex, smoker, region;
Button submit;
Range age, bmi, children, charges;

void controls() {
  controlP5 = new ControlP5(this);
  
  int startY = 50;
  
  age = controlP5.addRange("age")
  .setBroadcast(false) 
  .setPosition(10,startY)
  .setSize(130,20)
  .setHandleSize(10)
  .setRange(18,64)
  .setBroadcast(true)
  .setDecimalPrecision(0)
  .setColorForeground(color(255,40))
  .setColorBackground(color(255,40));
  
  startY += 30;
  sex = controlP5.addRadioButton("sex",10,startY)
  .setItemsPerRow(2)
  .setSpacingColumn(60)
  .addItem("Male", 1)
  .addItem("Female", 2);
  
  startY += 30;
  bmi = controlP5.addRange("bmi")
  .setBroadcast(false) 
  .setPosition(10,startY)
  .setSize(130,20)
  .setHandleSize(10)
  .setRange(16,53.1)
  .setBroadcast(true)
  .setColorForeground(color(255,40))
  .setColorBackground(color(255,40));

  startY += 30;
  children = controlP5.addRange("children")
  .setBroadcast(false) 
  .setPosition(10,startY)
  .setSize(130,20)
  .setHandleSize(10)
  .setRange(0,5)
  .setDecimalPrecision(0)
  .setBroadcast(true)
  .setColorForeground(color(255,40))
  .setColorBackground(color(255,40));

  startY += 30;
  smoker = controlP5.addRadioButton("smoker",10,startY)
  .setItemsPerRow(2)
  .setSpacingColumn(60)
  .addItem("Smoker", 1)
  .addItem("Non Smoker", 2);
  
  startY += 30;
  region = controlP5.addRadioButton("region",10,startY)
  .setItemsPerRow(2)
  .setSpacingColumn(60)
  .addItem("northwest", 1)
  .addItem("northeast", 2)
  .addItem("southwest", 3)
  .addItem("southeast", 4);
  
  startY += 30;
  charges = controlP5.addRange("charges")
  .setBroadcast(false) 
  .setPosition(10,startY)
  .setSize(130,20)
  .setHandleSize(10)
  .setRange(1.12,6.4)
  .setBroadcast(true)
  .setColorForeground(color(255,40))
  .setColorBackground(color(255,40));
  
  startY += 30;
  submit = controlP5.addButton("submit")
  .setValue(0)
  .setPosition(10,startY)
  .setSize(130,20);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(submit)) {
    float ageMinValue = age.getArrayValue(0);
    float ageMaxValue = age.getArrayValue(1);
    
    int sexIndex = -1;
    for (int i=0;i<sex.getArrayValue().length;i++) {
      if ((int) sex.getArrayValue()[i] == 1)
        sexIndex = i;
    }
    String sexValue = "";
    switch (sexIndex) {
      case 0: sexValue = "male"; break;
      case 1: sexValue = "female"; break;
    }
    
    float bmiMinValue = bmi.getArrayValue(0);
    float bmiMaxValue = bmi.getArrayValue(1);

    float childrenMinValue = children.getArrayValue(0);
    float childrenMaxValue = children.getArrayValue(1);
    
    
    int smokerIndex = -1;
    for (int i=0;i<smoker.getArrayValue().length;i++) {
      if ((int) smoker.getArrayValue()[i] == 1)
        smokerIndex = i;
    }
    String smokerValue = "";
    switch (smokerIndex) {
      case 0: smokerValue = "male"; break;
      case 1: smokerValue = "female"; break;
    }
    
    
    int regionIndex = -1;
    for (int i=0;i<region.getArrayValue().length;i++) {
      if ((int) region.getArrayValue()[i] == 1)
        regionIndex = i;
    }
    String regionValue = "";
    switch (regionIndex) {
      case 0: regionValue = "male"; break;
      case 1: regionValue = "female"; break;
    }
    
    float chargesMinValue = charges.getArrayValue(0);
    float chargesMaxValue = charges.getArrayValue(1);
    
    println(sexValue);
  }
}