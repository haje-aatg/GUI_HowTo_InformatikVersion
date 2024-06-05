// Danish Extension to: https://github.com/mitkonikov/Processing/blob/master/Text_Box/TEXTBOX.pde

public class TextBox extends GUIObjects {
  public int TextLength = 0;
  public color Tekst = color(0, 0, 0);
  public boolean BorderEnable = true;
  public int BorderWeight = 1;
  public boolean topPrint = false;
  private boolean selected = false;

  TextBox() {
    super();          // Call GUIObjects()
    xpos = 10;
    ypos = height*3/4;
    objectWidth = 200;
    objectHeight = 35;
  }
  TextBox(int xp, int yp, int ow, int oh) {
    super();
    xpos = xp;
    ypos = yp;
    objectWidth = ow;
    objectHeight = oh;
  }
  void display() {
    update();
    // Background
    if (selected) {
      fill(objectGUIHighlight);
    } else {
      fill(objectGUIColor);
    }
    if (BorderEnable) {
      strokeWeight(BorderWeight);
      stroke(objectGUIBorder);
    } else {
      noStroke();
    }
    rect(xpos, ypos, objectWidth, objectHeight);
    // tekst
    fill(Tekst);
    textSize(textSize);
    if (topPrint) {
      textAlign(LEFT, TOP);
      text(text, xpos + (textWidth("a") / 2), ypos);
    } else {
      textAlign(LEFT, CENTER);
      text(text, xpos + (textWidth("a") / 2), ypos+(objectHeight)/2);
    }
  }
  void update() {
    overObject();
    if (mousePressed && mouseOver) {
      selected = true;
    } else if (mousePressed && !mouseOver) {
      selected = false;
    }
  }
  // Check hvis det er et bogstav, backspace eller return. Returner true hvis det er return
  boolean KEYPRESSED(char KEY, int KEYCODE) {
    if (selected) {
      println(KEY + " : " + KEYCODE);
      if (KEYCODE == (int)BACKSPACE) {
        BACKSPACE();
      } else if (KEYCODE == 32) {
        // SPACE
        addText(' ');
      } else if (KEYCODE == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyDanishCapitalLetter = ((KEY >= 'Å' && KEY <= 'Æ') || (KEY == 'Ø'));
        boolean isKeyDanishSmallLetter = ((KEY >= 'å' && KEY <= 'æ') || (KEY == 'ø'));
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
        if (isKeyCapitalLetter || isKeySmallLetter || isKeyDanishCapitalLetter || isKeyDanishSmallLetter || isKeyNumber) {
          println("Inserting: " + KEY);
          addText(KEY);
        }
      }
    }
    return false;
  }
  void addText(char typedChar) {
    if (textWidth(text + typedChar) + (textWidth("a") / 2 ) < objectWidth) { // Hvis der er plads til det nye bogstav
      text += typedChar;
      TextLength++;
    }
  }
  void BACKSPACE() {
    if (TextLength - 1 >= 0) {
      text = text.substring(0, TextLength - 1);
      TextLength--;
    }
  }
}
