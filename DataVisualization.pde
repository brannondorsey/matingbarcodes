class DataVisualization {

  ArrayList barcodesData;

  DataVisualization() {
    barcodesData = new ArrayList();
  }

  void displayData() {
    fill(255, 100);
    rect(0, 0, width, height);
    int lastIndex = barcodesData.size()-1;
    Barcode firstBarcode = (Barcode) barcodesData.get(0);
    Barcode lastBarcode = (Barcode) barcodesData.get(lastIndex);
    float minDist = firstBarcode.timeStamp;
    float maxDist = lastBarcode.timeStamp;
    //make y correspond to best attributes of scale, tall, speed, etc. 
    float y = height/2;
    for (int i = 0; i < barcodesData.size(); i++) {
      Barcode currentBarcode = (Barcode) barcodesData.get(i);
      float x = map(currentBarcode.timeStamp, minDist, maxDist, 0, width-100);
      //float y = map(currentBarcode.tall, 0, 50, info.rectHeight, height-100);
      //y -= height;
      float s = map(currentBarcode.scale, 1.5, 3.5, 10, 20);
      fill(currentBarcode.c, 100);
      ellipse(x, y, s, s);
      drawAncestry(i, currentBarcode);
    }
  }

  void drawAncestry(int i, Barcode currentBarcode) {
    fill(0);
    PVector fatherPoint = new PVector(currentBarcode.loc.x, currentBarcode.loc.y);
    PVector motherPoint = new PVector(currentBarcode.loc.x, currentBarcode.loc.y);
    int index = barcodesData.indexOf(currentBarcode);
    for (int j = 0; j < index-1; j++) {
      Barcode fatherBarcode = (Barcode) barcodesData.get(j);
      Barcode motherBarcode = (Barcode) barcodesData.get(j);
      if (currentBarcode.text.equals(fatherBarcode.text)) { 
        fatherPoint.set(fatherBarcode.loc.x, fatherBarcode.loc.y, 0);
        println("father point found");
      }
      if (currentBarcode.text.equals(motherBarcode.text)) motherPoint.set(motherBarcode.loc.x, motherBarcode.loc.y, 0);
    }
    line(currentBarcode.loc.x, currentBarcode.loc.y, fatherPoint.x, fatherPoint.y);
    line(currentBarcode.loc.x, currentBarcode.loc.y, motherPoint.x, motherPoint.y);
  }


  void printData() {
    //println("barcodesData size is "+barcodesData.size());
  }
}

