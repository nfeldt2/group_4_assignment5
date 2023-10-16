Truck myTruck;
Tricycle myTricycle;
Car myCar;
float angle = 0.0;
PImage track;

void setup() {
  size(1000, 1000, P3D);
  myTruck = new Truck();
  myTricycle = new Tricycle(700, 0, 50, 20, 100, 25);
  myCar = new Car();
  track = loadImage("racetrack.png");
}

void draw() {
  background(240);
  camera(-300, -300, 250, 500, 500, 250, 0, 1, 0);
  lights();

  // racetrack
  beginShape();
  texture(track);
  float yOffset = -500; // controls the distance below Y=0
  vertex(-100, -yOffset, -100, 0, 0);
  vertex(100, -yOffset, -100, track.width, 0);
  vertex(100, -yOffset, 100, track.width, track.height);
  vertex(-100, -yOffset, 100, 0, track.height);
  endShape(CLOSE);

  // truck
  pushMatrix();
  translate(width / 2, height / 2);  
  scale(0.5);
  myTruck.move();
  myTruck.display();
  popMatrix();

  // tricycle
  pushMatrix();
  translate(width/2, height/2);
  float rotationSpeed = 0.01;
  angle += rotationSpeed;
  rotateY(angle);
  myTricycle.display();
  popMatrix();

  // car
  pushMatrix();
  translate(width/2+200, height/2);
  rotateY(PI/2);
  scale(0.5);
  myCar.move();
  myCar.display();
  popMatrix();

}
