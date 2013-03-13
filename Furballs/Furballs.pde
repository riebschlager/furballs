ArrayList points = new ArrayList();
boolean drawing = false;
float radius;
PImage source;

void setup() {
  smooth();
  noStroke();
  background(255);
  // Pick a photo. I Included img1.jpg, img2.jpg and img3.jpg
  source = loadImage("img4.jpg");
  size(source.width, source.height);
}

void draw() {
  // Is the mouse pressed? Well then add some new points, sucka!
  if (drawing == true) {
    points.add(new Point(new PVector(mouseX+random(-10, 10), mouseY+random(-10, 10)), new PVector(0, 0), 200));
  }
  // Loop through the points.
  for (int i = 0; i < points.size(); i++) {
    Point localPoint = (Point) points.get(i);
    if (localPoint.isDead) points.remove(i);
    // Change this 10 to something smaller or larger to change the drawing speed.
    for (int j = 0; j < 10; j++) {
      localPoint.update();
      localPoint.draw();
    }
  }
}

void keyPressed() {
  // Like what you see? Hit the space bar to save an image.
  if (key==' ') {
    saveFrame();
  }
}

void mousePressed() {
  drawing = true;
  if (random(1)<0.3) {
    // Less common. Draw a fat stroke.
    radius = random(15, 20);
  } 
  else {
    // More common. Draw a thin stroke.
    radius = random(1, 5);
  }
  filter(BLUR, 1);
}

void mouseReleased() {
  drawing = false;
}

