class Car{
PVector position;
float wheelRotation;
float tireSpeed;
float lerpFactor = 1;
float targetX;

Car(){
position = new PVector(0, 0, 0);
wheelRotation = 0;
}

void move(){
tireSpeed = abs(targetX - position.x) / 1000.0;
wheelRotation -= 0.05 + (0.01 * tireSpeed);
if (abs(1-(position.x/targetX)) > 0.03){
lerpFactor += 0.001;
position.x = lerp(position.x, targetX, lerpFactor);
}
else if(position.x >= 500){
targetX = random(-1000, -300);
targetX = position.x + targetX;
lerpFactor = 0;
}
else{
targetX = random(300, 1200);
targetX = position.x + targetX;
lerpFactor = 0;
}
}

void displayWheel(float x, float z, float size){
pushMatrix();
translate(x, 75, z+100);
rotateZ(PI/2);
rotateY(wheelRotation); 
sphere(size*3/4);  
popMatrix();
}


void display(){
pushMatrix();
fill(255, 0, 0);
translate(position.x, position.y, position.z);
rotateY(3*PI/2);

pushMatrix();
translate(0, 0, 50);
box(150, 100, 300);
popMatrix();

pushMatrix();
noStroke();
translate(0, 25, 105);
box(180, 50, 400);
popMatrix();

pushMatrix();
translate(0, -50, 210);
fill(0, 0, 200);
rect(-75, 0, 75, 30);
rect(0, 0, 75, 30);
popMatrix();

fill(0);
displayWheel(-90, 60, 50);  
displayWheel(90, 60, 50);   
displayWheel(-90, -200, 50); 
displayWheel(90, -200, 50);
popMatrix();
}

}

float angle = 0.0;
Car myCar;

void setup(){
size(1000, 1000, P3D);
myCar = new Car();
}

void draw(){
background(200);
camera(-300, -300, 250, 500, 500, 250, 0, 1, 0);
lights();

pushMatrix();
translate(width/2, height/2);
scale(0.5);
myCar.move();
myCar.display();
popMatrix();
}
