//age, sex, bmi, children, smoker, region, charges
Object[][] data = new Object[0][7];

void setup() {
  size(800, 600);
  background(255);
  loadData();
  example();
}

void loadData() {
  Table insurance = loadTable("data.csv", "header");
  data = new Object[insurance.getRowCount()][7];
  
  for(int i=0; i< insurance.getRowCount(); i++) {
    TableRow row = insurance.getRow(i);
    data[i][0] = row.getInt("age");
    data[i][1] = row.getString("sex");
    data[i][2] = row.getFloat("bmi");
    data[i][3] = row.getInt("children");
    data[i][4] = row.getString("smoker");
    data[i][5] = row.getString("region");
    data[i][6] = row.getFloat("charges");
  }
}