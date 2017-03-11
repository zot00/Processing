int enX = 750;
int enY = 500;
int bX = mouseX;
int bY = mouseY;
int pX = mouseX;
int pY = mouseY;
int enH = 10;
int pH = 10;
void setup() {
  fullScreen();
}
void draw() {
  pX = mouseX;
  pY = mouseY;
  background(0);
    fill(0, 255, 0);
    ellipse(bX, bY, 10, 10);
      fill(255, 0, 0);
  ellipse(enX, enY, 50, 50);
    fill(0, 0, 255);
  ellipse(pX, pY, 50, 50);
  enX = pY - enX;
  enY = pX - enY;
  if (enX>bX) {
    bX=bX+5;
  }
  if (enX<bX) {
    bX=bX-5;
  }
  if (enY>bY) {
    bY=bY+5;
  }
  if (enY<bY) {
    bY=bY-5;
  }
  if(enY>=1000){
   enX = (int) random(0, 1500);
   enY = (int) random(0, 1000);
  }
  if(enX>=1500){
   enX = (int) random(0, 1500);
   enY = (int) random(0, 1000);
  }
  if(enY<=0){
   enX = (int) random(0, 1500);
   enY = (int) random(0, 1000);
  }
  if(enY<=0){
   enX = (int) random(0, 1500);
   enY = (int) random(0, 1000);
  }
  if(bX == enX){
    enH--;
    bX = mouseX;
    bY = mouseY;
  }
}
void mousePressed() {
  bX = pX;
  bY = pY;
  fill(0, 255, 0);
  ellipse(bX, bY, 10, 10);
}