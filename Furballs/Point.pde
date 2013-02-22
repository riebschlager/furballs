class Point {

  PVector pos, vel, noiseVec;
  float noiseFloat, lifeTime, age;
  boolean isDead;
  int kuler;

  public Point(PVector _pos, PVector _vel, float _lifeTime) {
    pos = _pos;
    vel = _vel;
    lifeTime = _lifeTime;
    age = 0;
    isDead = false;
    noiseVec = new PVector();
    kuler = source.get((int) pos.x, (int) pos.y);
  }

  void update() {
    if (1.0-(age/lifeTime) <= 0 || pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      isDead = true;
      return;
    }
    noiseFloat = noise(pos.x * 0.001, pos.y * 0.001, frameCount * 0.001);
    noiseVec.x = cos(((noiseFloat) * TWO_PI) * 10);
    noiseVec.y = sin(((noiseFloat) * TWO_PI) * 10);
    vel.add(noiseVec);
    vel.div(2);
    pos.add(vel);
    age++;
  }

  void draw() {    
    float r;
    if (age < lifeTime/2) {
      fill(red(kuler), green(kuler), blue(kuler), map(age, 0, lifeTime/2, 0, 100));
      r = map(age, 0, lifeTime/2, 0, radius);
    } 
    else {
      fill(red(kuler), green(kuler), blue(kuler), map(age, lifeTime/2, lifeTime, 100, 0));
      r = map(age, lifeTime/2, lifeTime, radius, 0);
    }
    strokeWeight(r);
    stroke(0, 5);
    ellipse(pos.x, pos.y, r, r);
  }
}

