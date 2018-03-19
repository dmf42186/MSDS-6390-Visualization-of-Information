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
  .setRange(15,60)
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
  .setRange(0,70)
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
    int ageMinValue = (int) age.getArrayValue(0);
    int ageMaxValue = (int) age.getArrayValue(1);
    
    int sexIndex = -1;
    for (int i=0;i<sex.getArrayValue().length;i++) {
      if ((int) sex.getArrayValue()[i] == 1)
        sexIndex = i;
    }
    String sexValue = null;
    switch (sexIndex) {
      case 0: sexValue = "male"; break;
      case 1: sexValue = "female"; break;
    }
    
    float bmiMinValue = bmi.getArrayValue(0);
    float bmiMaxValue = bmi.getArrayValue(1);

    int childrenMinValue = (int) children.getArrayValue(0);
    int childrenMaxValue = (int) children.getArrayValue(1);
    
    
    int smokerIndex = -1;
    for (int i=0;i<smoker.getArrayValue().length;i++) {
      if ((int) smoker.getArrayValue()[i] == 1)
        smokerIndex = i;
    }
    String smokerValue = null;
    switch (smokerIndex) {
      case 0: smokerValue = "yes"; break;
      case 1: smokerValue = "no"; break;
    }
    
    int regionIndex = -1;
    for (int i=0;i<region.getArrayValue().length;i++) {
      if ((int) region.getArrayValue()[i] == 1)
        regionIndex = i;
    }
    String regionValue = null;
    switch (regionIndex) {
      case 0: regionValue = "northwest"; break;
      case 1: regionValue = "northeast"; break;
      case 2: regionValue = "southwest"; break;
      case 3: regionValue = "southeast"; break;
    }
    
    
    float chargesMinValue = charges.getArrayValue(0)*1000;
    float chargesMaxValue = charges.getArrayValue(1)*1000;
    
    loadData(
      ageMinValue,
      ageMaxValue,
      sexValue,
      bmiMinValue,
      bmiMaxValue,
      childrenMinValue,
      childrenMaxValue,
      smokerValue,
      regionValue,
      chargesMinValue,
      chargesMaxValue
    );
    example();
  }
}

void loadData(
  int ageMinValue,
  int ageMaxValue,
  String sexValue,
  float bmiMinValue,
  float bmiMaxValue,
  int childrenMinValue,
  int childrenMaxValue,
  String smokerValue,
  String regionValue,
  float chargesMinValue,
  float chargesMaxValue
  ) {
  Table insurance = loadTable("data.csv", "header");
  int rowCounter = 0;
  for(int i=0; i< insurance.getRowCount(); i++) {
    TableRow row = insurance.getRow(i);
    int age = row.getInt("age");
    String sex = row.getString("sex");
    float bmi = row.getFloat("bmi");
    int children = row.getInt("children");
    String smoker = row.getString("smoker");
    String region = row.getString("region");
    float charges = row.getFloat("charges");
    
    if (age < ageMinValue || age > ageMaxValue) continue;
    if (sexValue != null && !sex.equals(sexValue)) continue;
    if (bmi < bmiMinValue || bmi > bmiMaxValue) continue;
    if (children < childrenMinValue || children > childrenMaxValue) continue;
    if (smokerValue != null && !smoker.equals(smokerValue)) continue;
    if (regionValue != null && !region.equals(regionValue)) continue;
    if (charges < chargesMinValue || charges > chargesMaxValue) continue;
   
    rowCounter += 1;
  }
  println(rowCounter);
  //Table insurance = loadTable("data.csv", "header");
  data = new Object[rowCounter][7];
  
  int rowIndex = 0;
  for(int i=0; i< insurance.getRowCount(); i++) {
    TableRow row = insurance.getRow(i);
    int age = row.getInt("age");
    String sex = row.getString("sex");
    float bmi = row.getFloat("bmi");
    int children = row.getInt("children");
    String smoker = row.getString("smoker");
    String region = row.getString("region");
    float charges = row.getFloat("charges");

    if (age < ageMinValue || age > ageMaxValue) continue;
    if (sexValue != null && !sex.equals(sexValue)) continue;
    if (bmi < bmiMinValue || bmi > bmiMaxValue) continue;
    if (children < childrenMinValue || children > childrenMaxValue) continue;
    if (smokerValue != null && !smoker.equals(smokerValue)) continue;
    if (regionValue != null && !region.equals(regionValue)) continue;
    if (charges < chargesMinValue || charges > chargesMaxValue) continue;
    
    data[rowIndex][0] = age;
    data[rowIndex][1] = sex;
    data[rowIndex][2] = bmi;
    data[rowIndex][3] = children;
    data[rowIndex][4] = smoker;
    data[rowIndex][5] = region;
    data[rowIndex][6] = charges;
    rowIndex += 1;
  }
}