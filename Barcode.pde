class Barcode {
  PVector loc ;
  PVector velocity;
  float speed;
  int tSize;
  float wSize;
  int lifeEx;
  color c;
  float opacity;

  String text;
  PFont font;
  PImage bar;

  Timer life;

  boolean mating = false;

  Barcode(float _wSize, int _tSize, int _lifeEx, float _speed, String _text, color _c) {
    tSize = _tSize;
    wSize = _wSize;
    text = _text;
    lifeEx = _lifeEx;
    speed = _speed;
    opacity = 0;
    font = createFont("New", 12);
    textFont(font);
    c = _c;
    String hexC = hex(_c, 6); 
    String[] html = loadStrings("http://localhost:8888/barcodes/barcode.php?code="+text+"&width="+wSize+"&height="+tSize+"&color="+hexC);
    bar = loadImage("http://localhost:8888/barcodes/images/"+text+".png");
    int x = int(random(width-bar.width));
    int y = int(random(info.rectHeight, height-tSize));
    loc = new PVector(x, y);
    velocity = new PVector(0, 0);

    life = new Timer(lifeEx);
    life.start();

    //    println("Barcode "+text+" statistics:");
    //    println("size "+tSize);
    //    println("speed "+speed);
    //    println("life expectantcy "+lifeEx);
    //    println();
  }

  void update() {
    int rand = int(random(4)); 
    velocity.set(0,0,0);
    if (rand == 0 ) velocity.x += speed;
    else if (rand == 1) velocity.x -= speed;
    else if (rand == 2) velocity.y += speed;
    else velocity.y -= speed;
    loc.add(velocity);
    loc.y = constrain(loc.y, info.rectHeight, height-tSize);
    loc.x = constrain(loc.x, 0, width-bar.width);

    //barcode fades as it begins to die
    opacity = map(life.percentComplete(), 0, 1, 0, 255);
  }

  void display() {
    tint(255, 255-opacity);
    image(bar, loc.x, loc.y);
  }
  
  void checkEdges(){
   if(loc.x+bar.width > width) loc.x = 0;
   if(loc.x < 0) loc.x = width-bar.width;
   if(loc.y+bar.height > height) loc.y = 0;
   if(loc.y < 0) loc.y = height-bar.height;
  }

  boolean isOver(int mx, int my) {
    if (mx > loc.x &&
      mx < loc.x+bar.width &&
      my > loc.y &&
      my < loc.y+bar.height) {
      return true;
    }
    else return false;
  }
}

