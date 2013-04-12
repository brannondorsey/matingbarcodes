class Creator {
  Random generator;
  ArrayList barcodes;
  ArrayList mateQueue;

  //max population
  int maxPop = 10;

  //tall
  int avgTall     = 30;
  int tallStdDev  = 7;
  int OrigAvgTall, OrigTallStdDev;

  //scale
  float avgScale    = 2;
  float scaleStdDev = .2;
  float OrigAvgScale, OrigScaleStdDev;

  //speed
  float avgSpeed    = 1.5;
  float speedStdDev = .5;
  float OrigAvgSpeed, OrigSpeedStdDev;

  //life expectancy
  int avgLifeEx  = 15000; 
  int lifeStdDev = 5000;
  int OrigLifeExTall, OrigLifeStdDev;

  //color 
  int avgR = 0;
  int avgG = 0;
  int avgB = 0;
  int colorStdDev = 40;

  float oneParentChance  = .25; //chance to pass color trait to child if one parent has color
  float bothParentChance = .5; //chance to pass color trait to child if one parent has color

  Creator() {
    generator = new Random();
    barcodes  = new ArrayList();
    mateQueue = new ArrayList();
    OrigAvgTall      = avgTall;
    OrigTallStdDev   = tallStdDev;
    OrigAvgScale     = avgScale;
    OrigScaleStdDev  = scaleStdDev;
    OrigAvgSpeed     = avgSpeed;
    OrigSpeedStdDev  = speedStdDev;
    OrigLifeExTall   = avgLifeEx;
    OrigLifeStdDev = lifeStdDev;
  }

  //mates two barcode creatures
  void mate(Barcode male, Barcode female) {
    avgTall = max(male.tall, female.tall);
    avgScale = max(male.scale, female.scale);
    avgLifeEx = max(male.lifeEx, female.lifeEx);
    avgSpeed = max(male.speed, female.speed);

    //if both parents are black
    if (male.c == color(0, 0, 0) && female.c == color(0, 0, 0)) {
      setToBlack(); //reset average color to black
    }

    //if at least one parent has color
    else {
      float rand = random(1);
      float chanceToPass;

      //if only one parent has color
      if (male.c != color(0, 0, 0) && female.c == color(0, 0, 0) ||
        male.c == color(0, 0, 0) && female.c != color(0, 0, 0)) {
        chanceToPass = oneParentChance;
      }
      //if both parents have color
      else chanceToPass = bothParentChance; //increase chance that child will have color
      if (rand <= chanceToPass) {
        avgR = int(max(red(male.c), red(female.c)));
        avgG = int(max(green(male.c), green(female.c)));
        avgB = int(max(blue(male.c), blue(female.c)));
        //        println("the avg red is: "+avgR);
        //        println("the avg green is: "+avgG);
        //        println("the avg blue is: "+avgB);
      }
      else {
        setToBlack();
        //println("both colors are not black, but black took over");
      }
    }

    //child's first and last letters are taking from the father.
    //child's first half of letters (excluding the first letter)
    //are recieved from the mother. Child's last half of letters
    //(excluding the last letter) are unique.
    String maleFirstName = ""+male.text.charAt(0);
    String maleLastName = ""+male.text.charAt(male.text.length()-1);
    String femaleName = female.text.substring(female.text.length()/2, female.text.length()-1);
    String originalName = "";
    for (int i = 0; i < femaleName.length(); i++) {
      originalName += ""+String.valueOf(int(random(10)));
    }
    String text = maleFirstName+femaleName+originalName+maleLastName;
    newBarcode(text);
  }

  void addToQueue(Barcode currentBarcode) {
    if (mateQueue.size() >= 0 && mateQueue.size() < 2) {
      mateQueue.add(currentBarcode);
      currentBarcode.mating = true;
    }
    if (mateQueue.size() == 2) {
      Barcode male = (Barcode) mateQueue.get(0);
      Barcode female = (Barcode) mateQueue.get(1);
      mate(male, female);
      male.mating = false;
      female.mating = false;
      mateQueue.clear();
    }
  }

  //births new barcode creature
  void newBarcode(String text) {
    int tall = (int) generator.nextGaussian()*tallStdDev+avgTall;
    float scale = (int) generator.nextGaussian()*scaleStdDev+avgScale;
    int lifeEx = (int) generator.nextGaussian()*lifeStdDev+avgLifeEx;
    float speed = (float) generator.nextGaussian()*speedStdDev+avgSpeed;
    int r = (int) generator.nextGaussian()*colorStdDev+avgR;
    int g = (int) generator.nextGaussian()*colorStdDev+avgG;
    int b = (int) generator.nextGaussian()*colorStdDev+avgB;
    color c = color(r, g, b);
    //Barcode(int _tall, int _lifeEx, int _speed, String _text, Color c)
    barcodes.add(new Barcode(scale, tall, lifeEx, speed, text, c));
  }

  void resetBarcodes() {
    int index = barcodes.size()-1;
    Barcode last = (Barcode) barcodes.get(index);
    Barcode secondToLast = (Barcode) barcodes.get(index-1);
    String text1 = last.text;
    String text2 = secondToLast.text;
    mateQueue.clear();
    barcodes.clear();
    resetAvgs();
    newBarcode(text1);
    newBarcode(text2);
  }

  //kills barcode creature
  void kill(Barcode currentBarcode) {
    barcodes.remove(currentBarcode);
  }

  boolean isOverPopulated() {
    if (barcodes.size() >= maxPop) {
      return true;
    }
    else return false;
  }

  void setToBlack() {
    avgR = 0;
    avgG = 0;
    avgB = 0;
  }

  void resetAvgs() {
    avgTall      = OrigAvgTall;
    tallStdDev   = OrigTallStdDev;
    avgScale     = OrigAvgScale;
    scaleStdDev  = OrigScaleStdDev;
    avgSpeed     = OrigAvgSpeed;
    speedStdDev  = OrigSpeedStdDev;
    avgLifeEx    = OrigLifeExTall;
    lifeStdDev = OrigLifeStdDev; 
    
    //color 
    avgR = 0;
    avgG = 0;
    avgB = 0;
    colorStdDev = 40;
  }
}

