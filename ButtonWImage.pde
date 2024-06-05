/*
 Class for buttons with images
 */

class ButtonWImage extends Button {
  PImage buttonImageN, buttonImageO;

  ButtonWImage(String tempImage) {
    super();          // Call Button()
    buttonImageN = loadImage(tempImage);
  }
  ButtonWImage(int xp, int yp, int ow, int oh, String tempImage) {
    super(xp, yp, ow, oh, "");          // Call Button()
    buttonImageN = loadImage(tempImage);
    buttonImageO = buttonImageN; 
  }
  ButtonWImage(int xp, int yp, int ow, int oh, String tempImageN, String tempImageO) {
    super(xp, yp, ow, oh, "");          // Call Button()
    buttonImageN = loadImage(tempImageN);
    buttonImageO = loadImage(tempImageO);
  }
  void display() {
    if (overObject()) {
      image(buttonImageO, xpos, ypos);    //Show button picture
      if (mousePressed) {
        if (!buttonPressed) {
          buttonPressedEffect();
        }
        buttonPressed = true;
      } else {
        buttonPressed = false;
      }
    } else {
      image(buttonImageN, xpos, ypos);    //Show button picture
      if (buttonPressed) {
        buttonPressed = false;
      }
    }
  }
}
