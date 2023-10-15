class Truck {
  PVector position;
  float wheelRotation;
  float tireSpeed;
  float lerpFactor=1;
  float targetZ;

  Truck() {
    position = new PVector(0, 0, 0);
    wheelRotation = 0;
  }

  void move() {
    tireSpeed = abs(targetZ -position.z) /  1000.0;
    //println(tireSpeed);
    // tire speed increases/decreases based on tire speed
    // second level of animation
    wheelRotation -= .1 + (0.01 * tireSpeed); 
    
    // moves truck back and forth to mimic racing mechanics
   if (abs(1-(position.z/targetZ)) > 0.03) {
    lerpFactor += 0.001;     
    position.z = lerp(position.z, targetZ, lerpFactor);
    //println(abs(1-(position.z/targetZ)));
    } else if(position.z >= 500) {
      targetZ = random(-1000, -300); 
      targetZ = position.z + targetZ;
      lerpFactor = 0;
    } else {
      targetZ = random(300, 1200);
      targetZ = position.z + targetZ;
      lerpFactor = 0;
  }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateY(0);

    // cab
    fill(150, 0, 0);
    pushMatrix();
    translate(0, 0, 50);
    box(150, 100, 100);
    popMatrix();

    // bed
    fill(100, 50, 50);
    pushMatrix();
    translate(0, 20, -100);
    box(155, 60, 275);
    popMatrix();

    // front bumper
    fill(50);
    pushMatrix();
    translate(0, 25, 105);
    box(180, 20, 10);
    popMatrix();

    // rear bumper
    pushMatrix();
    translate(0, 25, -245);
    box(180, 20, 10);
    popMatrix();

    // lights
    pushMatrix();
    translate(0, 0, 101);
    fill(255, 255, 0);
    ellipse(-60, 0, 25, 25);
    ellipse(60, 0, 25, 25);
    popMatrix();
    
    // windows
    pushMatrix();
    translate(0, -45, 101);
    fill(0, 0, 200);
    rect(-75, 0, 75, 30);
    rect(0, 0, 75, 30);
    popMatrix();
    
    
    // wing
    fill(150, 0, 0);
    
    pushMatrix();
    translate(0, -60, -215);
    box(220, 10, 20); 
    popMatrix();

    // right support
    fill(50); 
    pushMatrix();
    translate(-80, -30, -215); 
    box(10, 60, 10);  
    popMatrix();
    
    // left support
    pushMatrix();
    translate(80, -30, -215);  
    box(10, 60, 10);  
    popMatrix();

    // wheels
    fill(50);
    displayWheel(-90, 60, 50);  
    displayWheel(90, 60, 50);   
    displayWheel(-90, -200, 50); 
    displayWheel(90, -200, 50);
    popMatrix();
    
  }

 void displayWheel(float x, float z, float size) {
    pushMatrix();
    translate(x, 50, z);
    rotateZ(PI/2);
    rotateY(wheelRotation); 
    tire(size, size / 2);  
    popMatrix();
  }

void tire(float h, float r) {
  int detail = 30; // number of segments for the tire
  
  // makes tire
  // uses cos and sin function to make circle
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= detail; i++) {
    float theta = TWO_PI / detail * i;
    float x = r * cos(theta);
    float z = r * sin(theta);
    vertex(x, -h/2, z);
    vertex(x, h/2, z);
  }
  endShape();
  
  // outside of tire (from camera perspective)
  beginShape(TRIANGLE_FAN);
  vertex(0, h/2, 0); 
  for (int i = 0; i <= detail; i++) {
    float theta = TWO_PI / detail * i;
    float x = r * cos(theta);
    float z = r * sin(theta);
    vertex(x, h/2, z);
  }
  endShape();

  // inside of tire
  beginShape(TRIANGLE_FAN);
  vertex(0, -h/2, 0); 
  for (int i = 0; i <= detail; i++) {
    float theta = TWO_PI / detail * i;
    float x = r * cos(theta);
    float z = r * sin(theta);
    vertex(x, -h/2, z);
  }
  endShape();
}
}
