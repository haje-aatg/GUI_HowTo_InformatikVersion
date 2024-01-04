/*
 How to add Gui elements the simple way.
 New version on the way
 */

Button state0Button;
Button state1Button;
HScrollBar state0HScrollBar;
VScrollBar state1VScrollBar;
TextBox state1TextBar;
int state = 0;
PImage imgState0;
PImage imgState1;

void setup() {
  size(600, 600);
  imgState0 = loadImage("State0.jpg");
  imgState1 = loadImage("State1.jpg");
  state0Button = new Button(490, 490, 100, 100, "State 1");
  state0HScrollBar = new HScrollBar(10, 470, width-20, 20, 13);
  state1Button = new Button(490, 490, 100, 100, "");
  state1VScrollBar = new VScrollBar(580, 10, 20, 470, 13);
  state1TextBar = new TextBox(10, 490, 460, 35);
}

void draw() {
  println(mouseX + " : " + mouseY);
  if (state == 0) {
    image(imgState0, 0, 0);
    state0Button.display();
    state0HScrollBar.display();
    if (state0Button.buttonPressed) {
      state = 1;
      delay(100);  // Simpel (dårlig) måde at undgå at den flipper for hurtig
    }
  } else if (state == 1) {
    image(imgState1, 0, 0);
    state1Button.display();
    state1TextBar.display();
    state1VScrollBar.display();
    if (state1Button.buttonPressed) {
      state = 0;
      delay(100);  // Simpel (dårlig) måde at undgå at den flipper for hurtig
    }
  }
}

void keyReleased() {
  state1TextBar.KEYPRESSED(key, keyCode);
}
