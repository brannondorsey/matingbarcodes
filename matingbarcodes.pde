import java.util.Random;
import proxml.*;
XMLInOut xmlIO; 
XMLData xmlData;

String text = "";
boolean clicked = false;
Creator creator;
Calculator stats;
InfoDisplay info;
LevelController levelCont;
DataVisualization dataVis;

void setup() {
  size(displayWidth, displayHeight/2);
  noStroke();
  smooth();
  frameRate(30);

  stats = new Calculator();
  info = new InfoDisplay();
  creator = new Creator();
  levelCont = new LevelController();
  dataVis = new DataVisualization();

  xmlIO = new XMLInOut(this);
  xmlIO.loadElement("data.xml");
  xmlEvent(new XMLElement("levels"));
  info.startTimer(); //triggers first level display
}

void xmlEvent(XMLElement element) {
  XMLElement[] children = element.getChildren();
  xmlData = new XMLData(children);
  xmlData.getLevelData();
}

void draw() {
  background(255);
  fill(0);
  stats.clearAvgs();
  if (creator.barcodes.size() > 0) {
    for (int i = 0; i <creator.barcodes.size(); i++) {
      Barcode currentBarcode = (Barcode) creator.barcodes.get(i);
      currentBarcode.update();
      currentBarcode.display();
      stats.addAvgs(i);
      if (currentBarcode.life.isFinished() && creator.barcodes.size() > 1) creator.kill(currentBarcode);
    }
  }
  stats.calcAvgs();
  info.displayStats();
  if (creator.isOverPopulated()){
    creator.mateQueue.clear(); //disables mating
    info.displayOverpopulated();
  }
  info.displayLevelInfo();
  if (levelCont.levelComplete()) {
    levelCont.nextLevel();
    info.viewingDataVis = true;
    info.startingGame = false; //game has now started
  }
  if(info.viewingDataVis == true && !info.startingGame){
    info.displayDataVis();
    //info.viewingDataVis = true;
  }
  else cursor(ARROW);
  info.displayLevelScreen();
  clicked = false;
  
}

void keyPressed() {
  if (key == '\n' && 
    text.length() > 11) {
    creator.newBarcode(text, "", "");
    text = "";
  }
  else text += key;
  if (keyCode == BACKSPACE) {
    for (int i = 0; i <creator.barcodes.size(); i++) {
      Barcode currentBarcode = (Barcode) creator.barcodes.get(i);
      if (currentBarcode.isOver(mouseX, mouseY)) creator.kill(currentBarcode);
    }
    text = "";
  }
}

void mousePressed() {
  for (int i = 0; i <creator.barcodes.size(); i++) {
    Barcode currentBarcode = (Barcode) creator.barcodes.get(i);
    if (currentBarcode.isOver(mouseX, mouseY) && 
        !currentBarcode.mating &&
        !creator.isOverPopulated()) {
      creator.addToQueue(currentBarcode);
    }
  }
  info.clicked = true;
  for(int i = 0; i<info.buttons.length; i++){
    if(info.buttons[i].isOver(mouseX, mouseY)) info.buttons[i].makeSelected();
  }
}

