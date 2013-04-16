class DataVisualization {

  float x, y, s, fatherX, fatherY, motherX, motherY, minDist, maxDist;
  ArrayList barcodesData;
  float minOutput, maxOutput;
  ArrayList balls; 
  String displayValue;

  DataVisualization() {
    barcodesData = new ArrayList();
    balls = new ArrayList();
    displayValue = "tall";
  }
  
  void updateType(String type){
    if (type.equals("height")) type = "tall";
    displayValue = type;
    println("display type is ");
  }

  void displayData() {
    fill(255, 100);
    rect(0, 0, width, height);
    int lastIndex = barcodesData.size()-1;
    Barcode firstBarcode = (Barcode) barcodesData.get(0);
    Barcode lastBarcode = (Barcode) barcodesData.get(lastIndex);
    minDist = firstBarcode.timeStamp;
    maxDist = lastBarcode.timeStamp;
    //make y correspond to best attributes of scale, tall, speed, etc. 

    for (int i = 0; i < barcodesData.size(); i++) {
      Barcode currentBarcode = (Barcode) barcodesData.get(i);
      float currentType = getTypeValue(currentBarcode);
      x = map(currentBarcode.timeStamp, minDist, maxDist, 100, width-100);
      y = mapY(currentType);
      float[] scaleExtremes = getScaleMinAndMax(); //returns min and max of all barcodes scales
      s = map(currentBarcode.scale, scaleExtremes[0], scaleExtremes[1], 10, 20);
     // createAncestry(i, currentBarcode);
      drawAncestry(i, currentBarcode);
      //Ball b = (Ball)balls.get(i);
      fill(currentBarcode.c);
      ellipse(x, y, s, s);
    }
  }

  float mapY(float type) {
    getMinAndMax();
    return map(type, minOutput, maxOutput, height-100, 100);
  }

  void getMinAndMax() {

    float[] allValues = new float[barcodesData.size()];
    for (int i = 0; i < allValues.length; i++) {
      Barcode b = (Barcode) barcodesData.get(i);
      allValues[i] = getTypeValue(b);
    }
    minOutput = min(allValues);
    maxOutput = max(allValues);
  }
  
  float[] getScaleMinAndMax(){
    float[] scaleValues = new float[barcodesData.size()];
    for (int i = 0; i < scaleValues.length; i++) {
      Barcode b = (Barcode) barcodesData.get(i);
      scaleValues[i] = b.scale;
    }
    float[] minAndMax = {min(scaleValues),max(scaleValues)};
    return minAndMax;
  }

  float getTypeValue(Barcode b) {
    if (displayValue.equals("scale")) return b.scale; 
    else if (displayValue.equals("tall")) return b.tall;
    else if (displayValue.equals("speed")) return b.speed;
    else return 0;
  }

  //createAncestry();
  //drawAncestry();
  
  void drawAncestry(int i, Barcode currentBarcode) {
    int index = barcodesData.indexOf(currentBarcode);
    for (int j = 0; j < index-1; j++) {
      Barcode fatherBarcode = (Barcode) barcodesData.get(j);
      Barcode motherBarcode = (Barcode) barcodesData.get(j);
      float currentFatherType = getTypeValue(fatherBarcode);
      float currentMotherType = getTypeValue(motherBarcode);

      if (currentBarcode.fatherText.equals(fatherBarcode.text)) { 
        fatherX = map(fatherBarcode.timeStamp, minDist, maxDist, 100, width-100);
        fatherY = mapY(currentFatherType);
        //fatherPoint.set(fatherBarcode.loc.x, fatherBarcode.loc.y, 0);
      }
      if (currentBarcode.motherText.equals(motherBarcode.text)) {

        motherX = map(motherBarcode.timeStamp, minDist, maxDist, 100, width-100);
        motherY = mapY(currentMotherType);
        //motherPoint.set(motherBarcode.loc.x, motherBarcode.loc.y, 0);
      }
    }
    stroke(0);
    //below is code to implement bezier curves instead of lines.
//    float fX2 = random(x, fatherX)+random(-100, 100);
//    float fY2 = random(y, fatherY)+random(-100, 100);
//    float fX3 = random(x, fatherX)+random(-100, 100);
//    float fY3 = random(y, fatherY)+random(-100, 100);
//    float mX2 = random(x, motherX)+random(-100, 100);
//    float mY2 = random(y, motherY)+random(-100, 100);
//    float mX3 = random(x, motherX)+random(-100, 100);
//    float mY3 = random(y, motherY)+random(-100, 100);
//    noFill();
//    bezier(x, y, fX2, fY2, fX3, fY3, fatherX, fatherY);
//    bezier(x, y, mX2, mY2, mX3, mY3, motherX, motherY);
    line(x, y, fatherX, fatherY);
    line(x, y, motherX, motherY);
    noStroke();
  }
}

