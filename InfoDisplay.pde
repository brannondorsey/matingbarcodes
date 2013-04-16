class InfoDisplay {

  float startLine = 40;
  int textPadding = 15;
  int textMargin = 55;
  int rectHeight  = 55;
  color fillColor = 255; //color for default button states
  color textColor = 0;
  color warningColor = #A00000;
  boolean clicked = false;

  PFont font;
  int textS;

  Timer timer;
  boolean timerGoing = false;
  Button[] buttons = new Button[3];
  
  InfoDisplay() {
    textS = 30; 
    font = createFont("visitor TT2 BRK", textS);
    timer = new Timer(3000);
    float textS = 23;
    float x = startLine;
    float y = rectHeight*2;
    String[] buttonNames = {"scale", "height", "speed"};
    for(int i = 0; i < buttonNames.length; i++){
      buttons[i] = new Button(x, y, buttonNames[i], textS);
      x += textWidth(buttonNames[i])+textMargin;
    }
    
  }

  void displayStats() {
    textFont(font);
    textSize(textS);
    fill(0);
    rect(0, 0, width, rectHeight);
    fill(255);
    text("population stats /   population: "+stats.total+" | size: "+String.format("%.2f", stats.avgScale)+" | height: "+String.format("%.2f", stats.avgTall)+" | speed: "+String.format("%.2f", stats.avgSpeed)+" | lifespan: "+String.format("%.2f", stats.avgLifeEx/1000)+" sec", startLine, (rectHeight/2)+(textS/3));
  }

  void displayLevelInfo() {
    textFont(font);
    float fontIncrease = 1.5;
    textSize(textS*fontIncrease);
    fill(0);
    Level currentLevel = levelCont.levels[levelCont.curLevel];
    text("Level "+currentLevel.levelNumber+" | "+currentLevel.objective, startLine, height-textS*fontIncrease);
  }

  void startTimer() {
    timer.start();
    timerGoing = true;
    println("timer started");
  }

  void displayLevelScreen() {
    if (timerGoing) {
      fill(0);
      float fontIncrease = 2;
      textSize(textS*fontIncrease);
      rect(0, 0, width, height);
      Level currentLevel = levelCont.levels[levelCont.curLevel];
      String levelText = "Level "+currentLevel.levelNumber;
      String objectiveText = currentLevel.objective;
      float textWide = textWidth(levelText);
      fill(255);
      text(levelText, width/2-textWide/2, (height/2)-(textS*fontIncrease));
      textWide = textWidth(objectiveText);
      text(objectiveText, width/2-textWide/2, (height/2+textS*fontIncrease)-(textS*fontIncrease));
    }
    if (timerGoing && timer.isFinished()) {
      timerGoing = false;
      creator.resetBarcodes();
    }
  }

  void displayOverpopulated() {
    if (frameCount/5 % 2 == 0) fill(warningColor, 175);
    else fill(warningColor);
    rect(0, rectHeight, width, rectHeight);
    fill(255);
    String text = "overpopulated";
    float textWide = textWidth(text);
    text(text, width-textWide-startLine, (rectHeight/2)+(textS/3)+rectHeight);
  }

  void displayDataVisButtons(){
    for(int i = 0; i < buttons.length; i++){
      buttons[i].checkIsOver();
      buttons[i].display();
      println("the "+buttons[i].buttonText+"button textWidth() is "+textWidth(buttons[i].buttonText));
    }
  }
  
  void over(String type){
    cursor(HAND);
    fillColor = color(#1E1498);
    textColor = color(255);
  }
}

