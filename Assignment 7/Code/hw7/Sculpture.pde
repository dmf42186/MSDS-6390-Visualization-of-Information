class Sculpture {
  Arm topArm = new Arm(true);
  Arm bottomArm = new Arm(false);
  Center center = new Center();
  
  void rotateArms() {
    background(51);
    translate(width/2, height/2);
    this.topArm.rotateArm();
    this.bottomArm.rotateArm();
    this.center.draw();
  }
}