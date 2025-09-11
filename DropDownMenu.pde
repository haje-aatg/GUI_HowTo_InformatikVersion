/*
 Class for button with drop-down menu
 */

class DropDownMenu extends Button {
  StringList items;
  byte choosenItem = 0;
  boolean dropDownState = false;

  DropDownMenu() {
    super();
  }
  DropDownMenu(StringList _items) {
    super();
    items = _items;
  }
  DropDownMenu(int _xp, int _yp, int _ow, int _oh) {
    super(_xp, _yp, _ow, _oh, "");
  }
  DropDownMenu(int _xp, int _yp, int _ow, int _oh, String[] _items) {
    super(_xp, _yp, _ow, _oh, "");
    items = new StringList(_items);
    this.textButton = items.get(0);
  }
  DropDownMenu(int _xp, int _yp, int _ow, int _oh, StringList _items) {
    super(_xp, _yp, _ow, _oh, "");
    items = _items;
    this.textButton = items.get(0);
  }

  boolean overMenu() {
    if (mouseX > xpos && mouseX < xpos+objectWidth &&
      mouseY > ypos+objectHeight && mouseY < ypos+objectHeight*(1+items.size())) {
      mouseOver = true;
      return true;
    } else {
      mouseOver = false;
      return false;
    }
  }

  void display() {
    stroke(objectGUIBorder);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    fill(objectGUIColor);
    if (overObject()) {
      dropDownState = true;
      displayDropDownMenuItems();
      if (mousePressed) {
        if (!buttonPressed) {
          buttonPressedEffect();
        }
        buttonPressed = true;
      } else {
        buttonPressed = false;
      }
      fill(objectGUIHighlight);
    } else if (overMenu() && dropDownState) {//Show dropdown items
      //println("OM DDS: "+frameCount);
      byte itemHighlighted = displayDropDownMenuItems();
      if (mousePressed) {
        if (!buttonPressed) {
          choosenItem = itemHighlighted;
          textButton = items.get(choosenItem);
          buttonPressedEffect(choosenItem);
        }
        buttonPressed = true;
      } else {
        buttonPressed = false;
      }
    } else {
      dropDownState = false;
      fill(objectGUIColor);
      if (buttonPressed) {
        buttonPressed = false;
      }
    }
    //stroke(objectGUIBorder);
    rect(xpos, ypos, objectWidth, objectHeight, radii);
    fill(Tekst);
    text(textButton, xpos+objectWidth/2, ypos+objectHeight/2);
  }

  byte displayDropDownMenuItems() {
    byte itemHighlightedReturn = 0;
    boolean itemSkipped = false;
    for (int index = 0; index<items.size(); index++) {
      if (index == choosenItem) {
        itemSkipped = true;
      } else {
        if (overObject((byte)(index+int(!itemSkipped)))) {
          fill(objectGUIHighlight);
          itemHighlightedReturn = (byte)(index);
        }
        rect(xpos, ypos+(index+int(!itemSkipped))*objectHeight, objectWidth, objectHeight, radii);
        fill(Tekst);
        text(items.get(index), xpos+objectWidth/2, ypos+objectHeight/2+(index+int(!itemSkipped))*objectHeight);
        fill(objectGUIColor);
      }
    }
    return itemHighlightedReturn;
  }

  boolean overObject(byte _indexItem) {
    if (mouseX > xpos && mouseX < xpos+objectWidth
      && mouseY > ypos+objectHeight*_indexItem && mouseY < ypos+objectHeight*(_indexItem+1)) {
      mouseOver = true;
      return true;
    } else {
      mouseOver = false;
      return false;
    }
  }

  void buttonPressedEffect(byte _itemNumber) {
    println("Button: "+items.get(_itemNumber)+" Pressed!!!");
  }
}
