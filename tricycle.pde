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

    // back wheels
    pushMatrix();
    translate(-bodyWidth/2 - wheelRadius + 25, 0);
    displayWheel(0, 50, 0, wheelRadius);
    popMatrix();

    pushMatrix();
    translate(bodyWidth/2 + wheelRadius - 25, 0);
    displayWheel(0, 50, 0, wheelRadius);
    popMatrix();

    // front wheel
    displayWheel(0, -50, 0, wheelRadius);

    // cab
    pushMatrix();
    translate(0, 10, 20);
    fill(color(255, 0, 0));
    box(30, 50, 30);
    popMatrix();

    popMatrix();
  }

  void displayWheel(float x, float y, float z, float size) {
    pushMatrix();
    translate(x, y, z);
    rotateZ(PI/2);
    rotateY(-angle);
    tire(size, size/2);
    popMatrix();
  }
  
  void tire(float h, float r) {
    int detail = 20;
    float angleIncrement = TWO_PI/detail;
    float halfHeight = h/2;
    fill(200);
  
    // tire exterior
    beginShape(TRIANGLE_FAN);
    vertex(0, halfHeight, 0);
    for (int i = 0; i <= detail; i++) {
      float x1 = r * cos(angleIncrement * i);
      float z1 = r * sin(angleIncrement * i);
      vertex(x1, halfHeight, z1);
    }
    endShape(CLOSE);
  
    // tire interior
    beginShape(TRIANGLE_FAN);
    vertex(0, -halfHeight, 0);
    for (int i = 0; i <= detail; i++) {
      float x2 = r * cos(angleIncrement * i);
      float z2 = r * sin(angleIncrement * i);
      vertex(x2, -halfHeight, z2);
    }
    endShape(CLOSE);
  
    // connect exterior and interior
    beginShape(QUAD_STRIP);
    for (int i = 0; i <= detail; i++) {
      float x1 = r * cos(angleIncrement * i);
      float z1 = r * sin(angleIncrement * i);
      float x2 = r * cos(angleIncrement * i);
      float z2 = r * sin(angleIncrement * i);
      vertex(x1, halfHeight, z1);
      vertex(x2, -halfHeight, z2);
    }
    endShape(CLOSE);
  }
}
