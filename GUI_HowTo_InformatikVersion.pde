/*
 How to add Gui elements the simple way.
 Pictures in folder:
 State0.jpg          Contains the design for state 0
 State1.jpg          Contains the design for state 1
 state1ButtonN.jpg   Contains the design for state 1 button
 state1ButtonO.jpg   Contains the design for state 1 button when mouse is over
 */

// Make variables & Object names
Button state0Button;
ButtonWImage state1Button;
HScrollBar state0HScrollBar;
VScrollBar state1VScrollBar;
TextBox state1TextBar;
Byte state = 0;              //Make variable state AND initialise
PImage imgState0;
PImage imgState1;

void setup() {
  size(600, 600);
  imgState0 = loadImage("State0.jpg");                          //load picture of state 0
  imgState1 = loadImage("State1.jpg");
  state0Button = new Button(490, 490, 100, 100, "State 1", byte(10));     //(x-coordinat,y-coordinat,width,height,text)
  state0HScrollBar = new HScrollBar(10, 470, width-20, 20, 13); //(x-coordinat,y-coordinat,width,height,damping)
  state1Button = new ButtonWImage(490, 490, 100, 100, "state1ButtonN.jpg", "state1ButtonO.jpg");            //(x-coordinat,y-coordinat,width,height,picture,pictureOver)
  state1VScrollBar = new VScrollBar(580, 10, 20, 470, 13);
  state1TextBar = new TextBox(10, 490, 460, 35);
}

void draw() {
  //println(mouseX + " : " + mouseY);//Show mouse position in console
  switch(state) {
  case 0:
    image(imgState0, 0, 0);    //Show picture
    state0Button.display();    //Show button
    state0HScrollBar.display();//Show scroll bar
    text(state0HScrollBar.getPos(), state0HScrollBar.getPos(), 470-25);  //Show scroll bar position. Insert fill to make it visible when mouse not over
    if (state0Button.buttonPressed) {
      state = 1;               //Change to state 1
      delay(100);              //Simple (bad programming) way to secure slow response
    }
    break;
  case 1:
    image(imgState1, 0, 0);
    state1Button.display();
    state1TextBar.display();
    state1VScrollBar.display();
    text(state1VScrollBar.getPos(), 580-100, state1VScrollBar.getPos()+10);  //Show scroll bar position. Insert fill to make it visible when mouse not over
    if (state1Button.buttonPressed) {
      state = 0;
      delay(100);
    }
    break;
  default:
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Ops!!! State "+state+" has not yet been developed!!!", width/2, height/2);
  }
}

void keyReleased() {
  state1TextBar.KEYPRESSED(key, keyCode);
}
