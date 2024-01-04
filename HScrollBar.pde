// Based on https://processing.org/examples/scrollbar.html

class HScrollBar extends GUIObjects {
  //float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int scrollBarDamping;              // how loose/heavy
  boolean locked;
  float ratio;

  HScrollBar () {
    super();
    objectWidth = width - 20;
    objectHeight = 20;
    int widthtoheight = objectWidth - objectHeight;
    ratio = (float)objectWidth / (float)widthtoheight;
    xpos = 10;
    ypos = height/2-objectHeight/2;
    spos = xpos + objectWidth/2 - objectHeight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + objectWidth - objectHeight;
    scrollBarDamping = 13;
  }
  HScrollBar (int xp, int yp, int ow, int oh, int lambda) {
    objectWidth = ow;
    objectHeight = oh;
    int widthtoheight = ow - oh;
    ratio = (float)ow / (float)widthtoheight;
    xpos = xp;
    ypos = yp-objectHeight/2;
    spos = xpos + objectWidth/2 - objectHeight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + objectWidth - objectHeight;
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
    rect(spos, ypos, objectHeight, objectHeight);
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
      newspos = constrain(mouseX-objectHeight/2, sposMin, sposMax);
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
