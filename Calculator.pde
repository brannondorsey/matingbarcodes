class Calculator {
  float avgSize;
  float avgSpeed;
  float avgLifeEx;
  float avgRed;
  float avgGreen;
  float avgBlue;
  int total;

  Calculator() {
  }

  void clearAvgs() {
    avgSize   = 0;
    avgSpeed  = 0;
    avgLifeEx = 0;
    avgRed    = 0;
    avgGreen  = 0;
    avgBlue   = 0;
  }

  void addAvgs(int i) {
    Barcode currentBarcode = (Barcode) creator.barcodes.get(i);
    int tSize = currentBarcode.tSize;
    int lifeEx = currentBarcode.lifeEx;
    float speed = currentBarcode.speed;
    int red = (int) red(currentBarcode.c);
    int green = (int) green(currentBarcode.c);
    int blue = (int) blue(currentBarcode.c);
    println(red);
    avgSize   += tSize;
    avgSpeed  += speed;
    avgLifeEx += lifeEx;
    avgRed    += red;
    avgGreen  += green;
    avgBlue   += blue;
  }

  void calcAvgs() {
    total = creator.barcodes.size();
    if (creator.barcodes.size() == 0) clearAvgs();
    else {
      avgSize   /= total;
      avgSpeed  /= total;
      avgLifeEx /= total;
      avgRed    /= total;
      avgGreen  /= total;
      avgBlue   /= total;
    }
  }

  float percentLevelComplete() {
    float requirement = 0;
    float percentTotal = 0;
    Level currentLevel = levelCont.levels[levelCont.curLevel];
    float[] percent = new float[currentLevel.type.length];
    for (int i = 0; i < percent.length; i++) {
      if (currentLevel.type[i].equals("speed")) requirement = avgSpeed;
      else if (currentLevel.type[i].equals("size")) requirement = avgSize;
      percent[i] = requirement/currentLevel.targetValue[i];
      percentTotal += percent[i];
    }
    float percentAverage = percentTotal/percent.length;
    percentTotal = int(percentTotal*100); 
    return percentTotal;
  }

  //  int percentLevelComplete(){
  //    //do for each requirement and then devide by numbers of total requirements
  //    int numThatPass = 0;
  ////    for(int i = 0; i < levelCont.levels[levelCont.curLevel]; i++){
  ////      numThatPass++;
  ////    }
  //    int percent = 0;
  //    if(numThatPass != 0) percent = (int) total/numThatPass;
  //    percent = int(map(percent, 0, 1, 0, 100));
  //    return percent;
  //  }
}

