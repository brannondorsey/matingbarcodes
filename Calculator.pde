class Calculator {
  float avgTall;
  float avgScale;
  float avgSpeed;
  float avgLifeEx;
  float avgRed;
  float avgGreen;
  float avgBlue;
  int total;

  Calculator() {
  }

  void clearAvgs() {
    avgTall   = 0;
    avgScale  = 0;
    avgSpeed  = 0;
    avgLifeEx = 0;
    avgRed    = 0;
    avgGreen  = 0;
    avgBlue   = 0;
  }

  void addAvgs(int i) {
    Barcode currentBarcode = (Barcode) creator.barcodes.get(i);
    int tall = currentBarcode.tall;
    float scale = currentBarcode.scale;
    int lifeEx = currentBarcode.lifeEx;
    float speed = currentBarcode.speed;
    int red = (int) red(currentBarcode.c);
    int green = (int) green(currentBarcode.c);
    int blue = (int) blue(currentBarcode.c);
    println(red);
    avgTall   += tall;
    avgScale  += scale;
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
      avgTall   /= total;
      avgScale  /= total;
      avgSpeed  /= total;
      avgLifeEx /= total;
      avgRed    /= total;
      avgGreen  /= total;
      avgBlue   /= total;
    }
  }

//+" / "+stats.percentLevelComplete()+"% complete"
//^^ for text in infodisplay
//  float percentLevelComplete() {
//    float requirement = 0;
//    float percentTotal = 0;
//    Level currentLevel = levelCont.levels[levelCont.curLevel];
//    float[] percent = new float[currentLevel.type.length];
//    for (int i = 0; i < percent.length; i++) {
//      if (currentLevel.type[i].equals("speed")) requirement = avgSpeed;
//      else if (currentLevel.type[i].equals("tall")) requirement = avgTall;
//      percent[i] = requirement/currentLevel.targetValue[i];
//      percentTotal += percent[i];
//    }
//    float percentAverage = percentTotal/percent.length;
//    percentTotal = int(percentTotal*100); 
//    return percentTotal;
//  }
}

