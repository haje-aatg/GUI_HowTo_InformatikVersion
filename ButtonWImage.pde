/*
 Class for buttons with images
 */

class ButtonWImage extends Button {
  PImage buttonImageN, buttonImageO;

  ButtonWImage(String _tempImage) {
    super();          // Call Button()
    buttonImageN = loadImage(_tempImage);
  }
  ButtonWImage(int _xp, int _yp, int _ow, int _oh, String _tempImage) {
    super(_xp, _yp, _ow, _oh, "");          // Call Button()
    buttonImageN = loadImage(_tempImage);
    buttonImageO = buttonImageN; 
  }
  ButtonWImage(int _xp, int _yp, int _ow, int _oh, String tempImageN_, String _tempImageO) {
    super(_xp, _yp, _ow, _oh, "");          // Call Button()
    buttonImageN = loadImage(tempImageN_);
    buttonImageO = loadImage(_tempImageO);
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
