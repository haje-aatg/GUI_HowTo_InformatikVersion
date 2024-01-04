class Button extends GUIObjects {
  boolean buttonPressed = false;
  public color Tekst = color(0, 0, 0);
  String textButton;

  Button() {
    super();
    objectWidth = 180;
    objectHeight = 90;
    xpos = 10;
    ypos = 10;
    textButton = "";
  }
  Button(int xp, int yp, int ow, int oh, String tb) {
    super();
    objectWidth = ow;
    objectHeight = oh;
    xpos = xp;
    ypos = yp;
    textButton = tb;
  }
  void display() {
    if (overObject()) {
      fill(objectGUIHighlight);
      if (mousePressed) {
        if (!buttonPressed) {
          buttonPressedEffect();
        }
        buttonPressed = true;
      } else {
        buttonPressed = false;
      }
    } else {
      fill(objectGUIColor);
      if (buttonPressed) {
        buttonPressed = false;
      }
    }
    stroke(objectGUIBorder);
    rect(xpos, ypos, objectWidth, objectHeight);
    textAlign(CENTER, CENTER);
    fill(Tekst);
    textSize(textSize);
    text(textButton, xpos+objectWidth/2, ypos+objectHeight/2);
  }
  void buttonPressedEffect() {
    println("Button Pressed!!!");
  }
}
