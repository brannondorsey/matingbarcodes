class DataVisualization{
  
  ArrayList barcodesData;
  
  DataVisualization(){
    barcodesData = new ArrayList();
  }
  
  void displayData(){
    fill(255, 100);
    rect(0, 0, width, height);
    int lastIndex = barcodesData.size()-1;
    Barcode firstBarcode = (Barcode) barcodesData.get(0);
    Barcode lastBarcode = (Barcode) barcodesData.get(lastIndex);
    float minDist = firstBarcode.timeStamp;
    float maxDist = lastBarcode.timeStamp;
    //make y correspond to best attributes of scale, tall, speed, etc. 
    for(int i = 0; i < barcodesData.size(); i++){
      Barcode currentBarcode = (Barcode) barcodesData.get(i);
      float x = map(currentBarcode.timeStamp, minDist, maxDist, 0, width-100);
      float y = map(currentBarcode.tall, 0, 50, info.rectHeight, height-100);
      println("current barcode tall is "+currentBarcode.tall);
      y -= height;
      float s = map(currentBarcode.scale, 1.5, 3.5, 10, 20);
      fill(currentBarcode.c, 100);
      ellipse(x, y, s, s);
    }
  }
  
  void printData(){
    println("barcodesData size is "+barcodesData.size());
  }
}
