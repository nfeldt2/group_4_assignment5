Truck myTruck;
Tricycle myTricycle;
float angle = 0.0;

void setup() {
  size(1000, 1000, P3D);
  myTruck = new Truck();
  myTricycle = new Tricycle(700, 0, 50, 20, 100, 25);
}

void draw() {
  background(240);
  camera(-300, -300, 250, 500, 500, 250, 0, 1, 0);
  lights();

  pushMatrix();
  translate(width / 2, height / 2);  
  scale(0.5);
  myTruck.move();
  myTruck.display();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  float rotationSpeed = 0.01;
  angle += rotationSpeed;
  rotateY(angle);
  myTricycle.display();
  popMatrix();
}
