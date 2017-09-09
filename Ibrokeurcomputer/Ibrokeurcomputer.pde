import java.util.ArrayList;
int pX = 25;
int pY = 25;
int enX = 1895;
int enY = 1055;
int pH = 500;
int enH = 500;
int bX = pX;
int bY = pY;
int btX = enX;
int s = 0;
int btY = enY;
ArrayList<Character> specialKeys = new ArrayList<Character>();
ArrayList<Character> keys = new ArrayList<Character>();
void setup() {
   fullScreen(P3D);
}
void draw() {
    bck();
  enemyMovement();
  playerMovement();
  bullet();
}
void bck(){
  s = s+1;
  background(0, 0, s);
  background(200);
  translate(width/2, height/2, 0);
  rotateX(s * 0.05);
  rotateY(s * 0.05);
  box(s / 4);
  box(40);
  rotateY(0.5);
  noFill();
  box(40);
  background(200);
  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(s * 0.05);
  rotateY(s * 0.05);
  sphere(40);
}
void enemyMovement() {
  fill(0, 255, 255);
  ellipse(enX, enY, 50, 50);
  for (Character i : keys) {
    if (i == 'j' || key == 'J') {
      enX = enX - 10;
    }
    if (i == 'l' || key == 'L') {
      enX = enX + 10;
    }
    if (i == 'k' || key == 'K') {
      enY = enY + 10;
    }
    if (i == 'i' || key == 'I') {
      enY = enY - 10;
    }
  }
  fill(255, 255, 0);
  if (enH <=0) {
    text("Yellow has won!", 200, 200);
  }
}
void playerMovement() {
  fill(255, 255, 0);
  ellipse(pX, pY, 50, 50);
  for (Character i : keys) {
    if (i == 'a' || key == 'A') {
      pX = pX - 10;
    }
    if (i == 'd' || key == 'D') {
      pX = pX + 10;
    }
    if (i == 's' || key == 'S') {
      pY = pY + 10;
    }
    if (i == 'w' || key == 'W') {
      pY = pY - 10;
    }
  }
  fill(0, 255, 255);
  if (pH <=0) {
    text("Blue has won!", 500, 500);
  }
}
void keyPressed() {
  if (!keys.contains(key)) {
    keys.add(key);
  }
}
void bullet() {
  int j = 11;
  fill(random(0, 255), random(0, 255), random(0, 255));
  if (enX>bX) {
    bX=bX+j;
  }
  if (enX<bX) {
    bX=bX-j;
  }
  if (enY>bY) {
    bY=bY+j;
  }
  if (enY<bY) {
    bY=bY-j;
  }
  if (pX>btX) {
    btX=btX+j;
  }
  if (pX<btX) {
    btX=btX-j;
  }
  if (pY>btY) {
    btY=btY+j;
  }
  if (pY<btY) {
    btY=btY-j;
  }
  if (bX <= enX+50&&bY <= enY+50&&bX>=enX-50&&bY>=enY-50) {
    enH = enH - (int) random(0, 10);
    bX = pX;
    bY = pY;
  }
  /*if (enX>bX) {
   bX=bX+10;
   }
   if (enX<bX) {
   bX=bX-10;
   }
   if (enY>bY) {
   bY=bY+10;
   }
   if (enY<bY) {
   bY=bY-10;
   }*/
  if (btX <= pX+50&&btY <= pY+50&&btX>=pX-50&&btY>=pY-50) {
    pH = pH - (int) random(0, 10);
    btX = enX;
    btY = enY;
  }
  ellipse(bX, bY, 10, 10);
  ellipse(btX, btY, 10, 10);
  fill(0);
  text("Yellow health: " + pH, 100, 100);
  text("Blue health: " + enH, 900, 900);
}
void keyReleased() {
  keys.remove((Character)key);
}