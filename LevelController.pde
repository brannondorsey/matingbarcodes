class LevelController {
  //this class holds the data for each level
  //in a levels array. It also keeps track
  //of which level it currently active and
  //changes levels when they are completed

  int curLevel;
  Level[] levels;

  LevelController() {
    curLevel = 1; //number for level you want
    curLevel -= 1;
  }

  void initializeLevels(int numLevels) {
    levels = new Level[numLevels];
  }

  boolean levelComplete() {
    Level currentLevel = levels[curLevel];
    
    for (int i = 0; i<currentLevel.type.length; i++) {
      println("got here");
      float requirement = 0;
      if(currentLevel.type[i].equals("tall") || currentLevel.type[i].equals("-tall")) requirement = stats.avgTall;
      else if(currentLevel.type[i].equals("scale") || currentLevel.type[i].equals("-scale")) requirement = stats.avgScale;
      else if(currentLevel.type[i].equals("speed") || currentLevel.type[i].equals("-speed")) requirement = stats.avgSpeed;
      else if(currentLevel.type[i].equals("lifespan") || currentLevel.type[i].equals("-lifespan")) requirement = stats.avgLifeEx;
//      else if(currentLevel.type[i].equals("red")) requirement = stats.avgRed;
//      else if(currentLevel.type[i].equals("green")) requirement = stats.avgGreen;
//      else if(currentLevel.type[i].equals("blue")) requirement = stats.avgBlue;
      if (requirement != 0) {
        if (avgPasses(requirement, currentLevel.targetValue[i], currentLevel.type[i]) &&
          stats.total >= currentLevel.neededToPass[i]) {
          if (i == currentLevel.type.length-1) return true;
          continue;
        }
        else break;
      }
      else if (currentLevel.type[i].equals("color")) {
        if (stats.avgRed >= currentLevel.targetValue[i] &&
          stats.avgGreen >= currentLevel.targetValue[i] &&
          stats.avgBlue >= currentLevel.targetValue[i] &&
          stats.total >= currentLevel.neededToPass[i]) {
          if (i == currentLevel.type.length-1) return true;
          continue;
        }   
        else break;
      }
    }
    return false;
  }
  
  //changes passing requirements according to if objective type 
  //is positive or negative. i.e. speed vs -speed
  boolean avgPasses(float curAvg, float neededAvg, String type){
    
    char firstChar = type.charAt(0);
    
    //if type is not negative
    if(firstChar != '-'){
      if(curAvg >= neededAvg) return true;
      else return false;
    }
    //if type is negative
    else{
      if(curAvg <= neededAvg) return true;
      else return false;
    }
  };

  void nextLevel() {
    if (curLevel >= levels.length-1) {
      println("YOU BEAT THE GAME!!!!!");
    }
    else { 
      curLevel++;
      printLevel(curLevel);
    }
  }

  void printLevel(int curLevel) {
    println("Level "+levels[curLevel].levelNumber);
    println("You are trying to "+levels[curLevel].objective);
    println("There are "+levels[curLevel].type.length+" requirement(s) to complete this level");
    println("The requirement(s) are: ");
    for (int i = 0; i < levels[curLevel].type.length; i++) {
      if (i > 0) print("and ");
      println(levels[curLevel].neededToPass[i]+" barcodes with a "+levels[curLevel].type[i]+" greater than "
        +levels[curLevel].targetValue[i]+" are needed to pass this level");
    }
  }
}

