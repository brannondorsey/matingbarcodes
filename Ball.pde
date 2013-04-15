class Ball {
  float x, y, s;
  color c;

  Ball(float _x, float _y, float _s, color _c) {
    x = 10;//_x;
    y = _y;
    s = _s;
    c = _c;
  }

  void display() {
    fill(c);
    ellipse(x, y, s, s);
  }

  void readText() {
    
  }

  boolean isOver(int mx, int my) {
    return ((x - mx)*(x - mx) + (y - my)*(y - my)) <= s*s;
  }
}

