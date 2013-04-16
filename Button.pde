class Button {

  float textPadding = 9;
  float margin = 27;

  color fillColor;
  color textColor;
  color hoverColor;
  float x, y, textS;
  String buttonText;
  
  boolean clicked = false;
  boolean selected = false;

  Button(float _x, float _y, String _buttonText, float _textS) {
    x = _x;
    y = _y;
    buttonText = _buttonText;
    textS = _textS;
    fillColor = color(255);
    textColor = color(0);
  } 

  void display() {
    textSize(textS);
    stroke(1);
    fill(fillColor);
    rect(x, y, textWidth(buttonText)+textPadding*2, textS+textPadding);
    fill(textColor);
    text(buttonText, x+textPadding, y+textS-3);
  }

  void checkIsOver() {
    //reset colors
    fillColor = color(255);
    textColor = color(0);

    if(isOver(mouseX, mouseY)){
      cursor(HAND);
      fillColor = color(#1E1498);
      textColor = color(255);
    }
    if(isOver(mouseX, mouseY) && clicked) makeSelected();
  }

  boolean isOver(int mx, int my) {
    if (mx >= x &&
      mx <= x+textWidth(buttonText)+textPadding &&
      my >= y &&
      my <= y+textS+textPadding) return true;
    else return false;
  }
  
  void makeSelected(){
    //reset all buttons selected variables because buttons are mutually exclusive 
    for(int i = 0; i<info.buttons.length; i++) info.buttons[i].selected = false; 
    selected = true;
  }
}

//void displayDataVisControls() {
//  float startLine = 40;
//  float textS = 23;
//  float textPadding = 9;
//  float margin = 27;
//  float buttonHeight = rectHeight*2;
//  textSize(textS);
//  fill(fillColor);
//  stroke(1);
//  rect(startLine, buttonHeight, textWidth(scale)+textPadding*2, rectHeight-textS);
//  fill(textColor);
//  text(scale, startLine+textPadding, buttonHeight+textS-3);
//  startLine += textWidth(scale)+margin;
//  fill(fillColor);
//  rect(startLine, buttonHeight, textWidth(tall)+textPadding*2, rectHeight-textS);
//  fill(textColor);
//  text(tall, startLine+textPadding, buttonHeight+textS-3);
//  startLine += textWidth(tall)+margin;
//  fill(fillColor);
//  rect(startLine, buttonHeight, textWidth(speed)+textPadding*2, rectHeight-textS);
//  fill(textColor);
//  text(speed, startLine+textPadding, buttonHeight+textS-3);
//  noStroke();
//  if (isOverDataControllerButton(mouseX, mouseY, scale, textS, textPadding, startLine, buttonHeight)) {
//    cursor(HAND);
//    fillColor = color(155);
//    if (clicked) dataVis.displayValue = scale;
//  }
//  else {
//    cursor(ARROW);
//    fillColor = color(255);
//  }
//  clicked = false; //reset clicked value to false
//}

