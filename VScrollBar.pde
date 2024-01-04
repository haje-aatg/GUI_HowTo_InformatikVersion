// Based on https://processing.org/examples/scrollbar.html

class VScrollBar extends GUIObjects {
  //float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int scrollBarDamping;              // how loose/heavy
  boolean locked;
  float ratio;

  VScrollBar () {
    super();
    objectWidth = 20;
    objectHeight = height - 20;
    int widthtoheight = objectWidth - objectHeight;
    ratio = (float)objectWidth / (float)widthtoheight;
    xpos = width/2-objectWidth/2;
    ypos = 10;
    spos = ypos + objectHeight/2 - objectWidth/2;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + objectHeight - objectWidth;
    scrollBarDamping = 13;
  }
  VScrollBar (int xp, int yp, int ow, int oh, int lambda) {
    objectWidth = ow;
    objectHeight = oh;
    int widthtoheight = ow - oh;
    ratio = (float)ow / (float)widthtoheight;
    xpos = xp-objectWidth/2;
    ypos = yp;
    spos = ypos + objectHeight/2 - objectWidth/2;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + objectHeight - objectWidth;
    scrollBarDamping = lambda;
  }
  void display() {
    update();
    fill(objectGUIBorder);
    rect(xpos, ypos, objectWidth, objectHeight);
    //noStroke();
    stroke(objectGUIBorder);
    if (mouseOver || locked) {
      fill(objectGUIHighlight);
    } else {
      fill(objectGUIColor);
    }
    rect(xpos, spos, objectWidth, objectWidth);
  }
  void update() {
    overObject();
    if (mousePressed && mouseOver) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseY-objectWidth/2, sposMin, sposMax);
      println(newspos + " : " + newspos * ratio);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/scrollBarDamping;
    }
  }
  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }
  float getPos() {
    // Convert spos to be values between 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
