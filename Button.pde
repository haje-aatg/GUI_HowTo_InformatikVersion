/*
 Class for buttons
 */

class Button extends GUIObjects {
  boolean buttonPressed = false;
  public color Tekst = color(0, 0, 0);
  String textButton;
  byte radii = 0;  // 0 for not rounded corners. Else it is the radius of the rounded corner

  Button() {
    super();          // Call GUIObjects()
    objectWidth = 180;
    objectHeight = 90;
    xpos = 10;
    ypos = 10;
    textButton = "";
  }
  Button(int _xp, int _yp, int _ow, int _oh) {
    super();
    objectWidth = _ow;
    objectHeight = _oh;
    xpos = _xp;
    ypos = _yp;
    textButton = "";
  }
  Button(int _xp, int _yp, int _ow, int _oh, String _tb) {
    super();
    objectWidth = _ow;
    objectHeight = _oh;
    xpos = _xp;
    ypos = _yp;
    textButton = _tb;
  }
  Button(int _xp, int _yp, int _ow, int _oh, String _tb, byte _tr) {
    super();
    objectWidth = _ow;
    objectHeight = _oh;
    xpos = _xp;
    ypos = _yp;
    textButton = _tb;
    radii = _tr;
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
    rect(xpos, ypos, objectWidth, objectHeight, radii);
    textAlign(CENTER, CENTER);
    fill(Tekst);
    textSize(textSize);
    text(textButton, xpos+objectWidth/2, ypos+objectHeight/2);
  }
  void buttonPressedEffect() {
    println("Button Pressed!!!");
  }
}
