import ddf.minim.*;
AudioPlayer player;
AudioPlayer shoot;
AudioPlayer explode;
AudioPlayer yay;
AudioPlayer aww;
Minim minim;
int enGX = (int) random(0, 1500);
int enGY = (int) random(0, 1000);
int enX = 750;
int enY = 500;
int bX = mouseX;
int btX = enX;
int btY = enY;
int bY = mouseY;
int pX = mouseX;
int pY = mouseY;
int enH = (int) random(100, 500);
int pH = (int) random(0,200);
void setup() {
  fullScreen();
  minim = new Minim(this);
  player = minim.loadFile("song.mp3", 2048);
  minim = new Minim(this);
  shoot = minim.loadFile("shoot.mp3", 2048);
  minim = new Minim(this);
  explode = minim.loadFile("explode.mp3", 2048);
  minim = new Minim(this);
  aww = minim.loadFile("aww.mp3", 2048);
  minim = new Minim(this);
  yay = minim.loadFile("yay.mp3", 2048);
}
void draw() {
  pX = mouseX;
  pY = mouseY;
  player.play();
  background(0);
  fill(0, 255, 0);
  ellipse(bX, bY, 10, 10);
  fill(255, 0, 0);
  ellipse(enX, enY, 50, 50);
  fill(0, 0, 255);
  ellipse(pX, pY, 50, 50);
  fill(255);
  ellipse(btX, btY, 10, 10);
  /* enX = (pY - enX)/2;
   enY = (pX - enY)/2;*/
  if (enGX>enX) {
    enX=enX+5;
  }
  if (enGX<enX) {
    enX=enX-5;
  }
  if (enGY>enY) {
    enY=enY+5;
  }
  if (enGY<enY) {
    enY=enY-5;
  }
  if (enX <= enGX+50 && enY <= enGY+50 && enX >= enGX-50 && enY >= enGY-50) {
    enGX = (int) random(0, 1500);
    enGY = (int) random(0, 1000);
  }
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
  if (pX>btX) {
    btX=btX+5;
  }
  if (pX<btX) {
    btX=btX-5;
  }
  if (pY>btY) {
    btY=btY+5;
  }
  if (pY<btY) {
    btY=btY-5;
  }
  if (enY>=1000) {
    enX = (int) random(0, 1500);
    enY = (int) random(0, 1000);
  }
  if (enX>=1500) {
    enX = (int) random(0, 1500);
    enY = (int) random(0, 1000);
  }
  if (enX<=0) {
    enX = (int) random(0, 1500);
    enY = (int) random(0, 1000);
  }
  if (enY<=0) {
    enX = (int) random(0, 1500);
    enY = (int) random(0, 1000);
  }
  if (bX <= enX+50&&bY <= enY+50&&bX>=enX-50&&bY>=enY-50) {
    enH = enH - (int) random(0, 10);
    btX = enX;
    btY = enY;
    bX = mouseX;
    bY = mouseY;
    shoot.rewind();
    explode.rewind();
    explode.play();
    shoot.play();
    ellipse(btX, btY, 10, 10);
  shoot.play();
  shoot.rewind();
  }
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
  if (btX <= pX+50&&btY <= pY+50&&btX>=pX-50&&btY>=pY-50) {
    pH = pH - (int) random(0, 10);
    btX = enX;
    btY = enY;
    shoot.rewind();
    explode.rewind();
    explode.play();
    shoot.play();
  }
  if (pX>btX) {
    btX=btX+5;
  }
  if (pX<btX) {
    btX=btX-5;
  }
  if (pY>btY) {
    btY=btY+5;
  }
  if (pY<btY) {
    btY=btY-5;
  }
  text("Player Health: " + pH, 100, 100);
  text("Enemy Health: " + enH, 1000, 1000);
  if (pH<=0) {
    aww.play();
    text("Game Over.", 620, 500);
    text("I knew I shouldn't have bought my tank on ebay...", 620, 600);
  }
  if (enH<=0) {
    yay.play();
    text("I win!", 620, 700);
    text("Ebay!!!!!!!!!", 620, 800);
  }
}
void mousePressed() {
  bX = pX;
  bY = pY;
  btX = enX;
  btY = enY;
  fill(0, 255, 0);
  ellipse(bX, bY, 10, 10);
  fill(255);
  ellipse(btX, btY, 10, 10);
  shoot.play();
  shoot.rewind();
}