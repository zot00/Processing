
    int s = 0;
void setup() {
  size(1000, 1000, P3D); 
}

void draw() {
  s = s + 1;
  if(mousePressed){
    background(s,0,0);
  } else {
    background(0,0,s);
  }
  /*translate(58, 48, 0); 
  rotateY(0.5);
  noFill();*/
    background(200);
  stroke(255, 50);
  translate(500, 500, 0);
  rotateX(s * 0.05);
  rotateY(s * 0.05);
  fill(s * 2, 0, 160);
  box(s / 4);
  box(40);
translate(58, 48, 0); 
rotateY(0.5);
noFill();
box(40);
  background(200);
  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(s * 0.05);
  rotateY(s * 0.05);
  fill(s * 2, 0, 160);
  sphereDetail(s / 4);
  sphere(40);
}
  /*background(255, 170, 255);
  ellipse (10,10,10,10);
  fill(100.567, 50.523, 200.193);*/
