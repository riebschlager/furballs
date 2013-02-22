ArrayList points = new ArrayList();
boolean drawing = false;
float radius;
PImage source;

void setup() {
  smooth();
  noStroke();
  background(255);
  source = loadImage("img1.jpg");
  size(source.width, source.height);
}

void draw() {
  if (drawing == true) {
    for (int i=0;i<1;i++) {
      points.add(new Point(new PVector(mouseX+random(-10, 10), mouseY+random(-10, 10)), new PVector(0, 0), 200));
    }
  }
  for (int i = 0; i < points.size(); i++) {
    Point localPoint = (Point) points.get(i);
    if (localPoint.isDead) points.remove(i);
    for (int j = 0; j < 10; j++) {
      localPoint.update();
      localPoint.draw();
    }
  }
}

void keyPressed() {
  if (key==' ') {
    saveFrame();
  }
}

void mousePressed() {
  drawing = true;
  if (random(1)<0.3) {
    radius = random(15, 20);
  } else {
    radius = random(1, 5);
  }
  filter(BLUR, 1);
}

void mouseReleased() {
  drawing = false;
}

