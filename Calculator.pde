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
}

