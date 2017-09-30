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
int btY = enY;
ArrayList<Character> specialKeys = new ArrayList<Character>();
ArrayList<Character> keys = new ArrayList<Character>();
void setup() {
  fullScreen();
}
void draw() {
  background(255);
  enemyMovement();
  playerMovement();
  bullet();
}
void enemyMovement() {
  fill(0, 255, 255);
  ellipse(enX, enY, 50, 50);
  //println("p");
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
    if (enX>width || enY>height) {
      enX = width-25;
      enY = height-25;
    }
    if (enX<0||enY <0) {
      enX = width-25;
      enY = height-25;
    }
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
    if (pX>width || pY>height) {
      pX = 25;
      pY = 25;
    }
    if (pX<0||pY <0) {
      pX = 25;
      pY = 25;
    }
  }
}
void keyPressed() {
  if (!keys.contains(key)) {
    keys.add(key);
  }
}
void bullet() {
  if (enX>bX) {
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
  }
  if (pX>btX) {
    btX=btX+10;
  }
  if (pX<btX) {
    btX=btX-10;
  }
  if (pY>btY) {
    btY=btY+10;
  }
  if (pY<btY) {
    btY=btY-10;
  }
  if (bX <= enX+50&&bY <= enY+50&&bX>=enX-50&&bY>=enY-50) {
    enH = enH - (int) random(0, 10);
    bX = pX;
    bY = pY;
  }
  if (btX <= pX+50&&btY <= pY+50&&btX>=pX-50&&btY>=pY-50) {
    pH = pH - (int) random(0, 10);
    btX = enX;
    btY = enY;
  }
  ellipse(bX, bY, 10, 10);
  ellipse(btX, btY, 10, 10);
  fill(0);
  text("Player 1 Health: " + pH, 100, 100);
  text("Player 2 Health: " + enH, 900, 900);
}
void keyReleased() {
  //if (key == CODED) {
  // println(specialKeys);
  //specialKeys.remove((Integer)keyCode);
  //} else {
  keys.remove((Character)key);
  //}
}