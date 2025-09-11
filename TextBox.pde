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
  TextBox(int _xp, int _yp, int _ow, int _oh) {
    super();
    xpos = _xp;
    ypos = _yp;
    objectWidth = _ow;
    objectHeight = _oh;
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
  boolean KEYPRESSED(char _KEY, int _KEYCODE) {
    if (selected) {
      println(_KEY + " : " + _KEYCODE);
      if (_KEYCODE == (int)BACKSPACE) {
        BACKSPACE();
      } else if (_KEYCODE == 32) {
        // SPACE
        addText(' ');
      } else if (_KEYCODE == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyDanishCapitalLetter = ((_KEY >= 'Å' && _KEY <= 'Æ') || (_KEY == 'Ø'));
        boolean isKeyDanishSmallLetter = ((_KEY >= 'å' && _KEY <= 'æ') || (_KEY == 'ø'));
        boolean isKeyCapitalLetter = (_KEY >= 'A' && _KEY <= 'Z');
        boolean isKeySmallLetter = (_KEY >= 'a' && _KEY <= 'z');
        boolean isKeyNumber = (_KEY >= '0' && _KEY <= '9');
        if (isKeyCapitalLetter || isKeySmallLetter || isKeyDanishCapitalLetter || isKeyDanishSmallLetter || isKeyNumber) {
          println("Inserting: " + _KEY);
          addText(_KEY);
        }
      }
    }
    return false;
  }
  void addText(char _typedChar) {
    if (textWidth(text + _typedChar) + (textWidth("a") / 2 ) < objectWidth) { // Hvis der er plads til det nye bogstav
      text += _typedChar;
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
