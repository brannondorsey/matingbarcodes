class InfoDisplay {

  float startLine = 40;
  int textPadding = 7;
  int rectHeight  = 55;

  color warningColor = #A00000;

  PFont font;
  int tall;

  Timer timer;
  boolean timerGoing = false;


  InfoDisplay() {
    tall = 30; 
    font = createFont("visitor TT2 BRK", tall);
    timer = new Timer(3000);
  }

  //    println("total population is "+total);
  //    println("Average size is "+avgHeight);
  //    println("Average speed is "+avgSpeed);
  //    println("Average life expectantcy is "+avgLifeEx);
  //    println();

  void displayStats() {
    textFont(font);
    textSize(tall);
    fill(0);
    rect(0, 0, width, rectHeight);
    fill(255);
    text("population stats /   population: "+stats.total+" | size: "+String.format("%.2f", stats.avgScale)+" | height: "+String.format("%.2f", stats.avgTall)+" | speed: "+String.format("%.2f", stats.avgSpeed)+" | lifespan: "+String.format("%.2f", stats.avgLifeEx/1000)+" sec", startLine, (rectHeight/2)+(tall/3));
  }

  void displayLevelInfo() {
    textFont(font);
    float fontIncrease = 1.5;
    textSize(tall*fontIncrease);
    fill(0);
    Level currentLevel = levelCont.levels[levelCont.curLevel];
    text("Level "+currentLevel.levelNumber+" | "+currentLevel.objective, startLine, height-tall);
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
      textSize(tall*fontIncrease);
      rect(0, 0, width, height);
      Level currentLevel = levelCont.levels[levelCont.curLevel];
      String levelText = "Level "+currentLevel.levelNumber;
      String objectiveText = currentLevel.objective;
      float textWide = textWidth(levelText);
      fill(255);
      text(levelText, width/2-textWide/2, (height/2)-(tall*fontIncrease));
      textWide = textWidth(objectiveText);
      text(objectiveText, width/2-textWide/2, (height/2+tall*fontIncrease)-(tall*fontIncrease));
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
      text(text, width-textWide-startLine, (rectHeight/2)+(tall/3)+rectHeight);
    
  }
}

