// Parent to all the GUI objects

class GUIObjects {
  int xpos, ypos;      // Position of GUI objct
  int objectWidth, objectHeight;    // width and height of bar
  color objectGUIColor, objectGUIHighlight, objectGUIBorder;
  boolean mouseOver = false;
  int textSize = 24;
  String text = "";

  GUIObjects() {
    objectGUIColor = color(255);
    objectGUIHighlight = color(0, 255, 0);
    objectGUIBorder = color(160);
  }
  boolean overObject() {
    if (mouseX > xpos && mouseX < xpos+objectWidth &&
      mouseY > ypos && mouseY < ypos+objectHeight) {
      mouseOver = true;
      return true;
    } else {
      mouseOver = false;
      return false;
    }
  }
}
