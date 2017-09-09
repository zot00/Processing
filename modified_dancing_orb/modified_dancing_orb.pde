int s = 0;
void setup() {
  fullScreen(P3D);
}

void draw() {
  s = s+1;
  background(0, 0, s);
  background(200);
  translate(width/2, height/2, 0);
  rotateX(s * 0.05);
  rotateY(s * 0.05);
  box(s / 4);
  box(40);
  rotateY(0.5);
  fill(random(0,255), random(0,255), random(0,255));
  box(40);
  background(200);
  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(s * 0.05);
  rotateY(s * 0.05);
  sphere(40);
}