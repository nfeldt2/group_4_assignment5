class Tricycle {
  float x, y;
  float bodyWidth, bodyHeight, bodyDepth;
  float wheelRadius;
  float angle = 0.0;

  Tricycle(float x, float y, float bodyWidth, float bodyHeight, float bodyDepth, float wheelRadius) {
    this.x = x;
    this.y = y;
    this.bodyWidth = bodyWidth;
    this.bodyHeight = bodyHeight;
    this.bodyDepth = bodyDepth;
    this.wheelRadius = wheelRadius;
  }

  void display() {
    angle += 0.1;
    fill(color(255, 0, 0));
    pushMatrix();
    translate(x, y);
    rotateX(PI / 2); // body is parallel to ground
    box(bodyWidth, bodyDepth, bodyHeight);

    pushMatrix();
    translate(-bodyWidth/2 - wheelRadius + 25, 0);
    displayWheel(0, 50, 0, wheelRadius);
    popMatrix();

    pushMatrix();
    translate(bodyWidth/2 + wheelRadius - 25, 0);
    displayWheel(0, 50, 0, wheelRadius);
    popMatrix();

    displayWheel(0, -50, 0, wheelRadius);

    popMatrix();
  }

  void displayWheel(float x, float y, float z, float size) {
    pushMatrix();
    translate(x, y, z);
    rotateZ(PI/2);
    rotateY(-angle); //
    tire(size, size / 2);
    popMatrix();
  }
  
  void tire(float h, float r) {
    int detail = 10;
    fill(color(200));
  
    // tire
    beginShape(QUAD_STRIP);
    for (int i = 0; i <= detail; i++) {
      float theta = TWO_PI / detail * i;
      float x = r * cos(theta);
      float z = r * sin(theta);
      vertex(x, -h/2, z);
      vertex(x, h/2, z);
    }
    endShape();
  
    // tire exterior
    beginShape(TRIANGLE_FAN);
    vertex(0, h/2, 0);
    for (int i = 0; i <= detail; i++) {
      float theta = TWO_PI / detail * i;
      float x = r * cos(theta);
      float z = r * sin(theta);
      vertex(x, h/2, z);
    }
    endShape();
  
    // tire interior
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
