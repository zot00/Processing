import java.util.ArrayList;
int pX = 25;
int pY = 25;
int enX = 1895;
int enY = 1055;
ArrayList<Integer> specialKeys = new ArrayList<Integer>();
ArrayList<Character> keys = new ArrayList<Character>();
void setup() {
  fullScreen();
}
void draw() {
  enemyMovement();
  playerMovement();
}
void enemyMovement() {
  ellipse(enX, enY, 50, 50);
  fill(0, 255, 255);
  if (!(enX <= 0 || enY <= 0 || enX >= width || enY >= height)) {
    println("q");
    for (Integer i : specialKeys) {
      if (i == UP) {
        enY = enY - 10;
      }
      if (i == DOWN) {
        enY = enY + 10;
      }
      if (i == LEFT) {
        enX = enX - 10;
      }
      if (i == RIGHT) {
        enX = enX + 10;
      }
    }
  }
  else if(enX >= width || enY >= height){
    enX = width;
    enY = height;
    for (Integer i : specialKeys) {
      if (i == UP) {
        enY = enY - 10;
      }
      if (i == DOWN) {
        enY = enY + 10;
      }
      if (i == LEFT) {
        enX = enX - 10;
      }
      if (i == RIGHT) {
        enX = enX + 10;
      }
    }
  }
  else if(enX <= 0 || enY <= 0){
    enX = 0;
    enY = 0;
    for (Integer i : specialKeys) {
      if (i == UP) {
        enY = enY - 10;
      }
      if (i == DOWN) {
        enY = enY + 10;
      }
      if (i == LEFT) {
        enX = enX - 10;
      }
      if (i == RIGHT) {
        enX = enX + 10;
      }
    }
  }
}
void playerMovement() {
  ellipse(pX, pY, 50, 50);
  fill(255, 255, 0);
  if (!(pX <= 0 || pY <= 0 || pX >= width || pY >= height)) {
    println("p");
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
  }
  else if(pX >= width || pY >= height){
    pX = width;
    pY = height;
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
  }
  else if(enX <= 0 || enY <= 0){
    pX = 0;
    pY = 0;
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
  }
}
void keyPressed() {
  if (key == CODED) {
    specialKeys.add(keyCode);
  } else if (!keys.contains(key)) {
    keys.add(key);
  }
}
void keyReleased() {
  if (key == CODED) {
    specialKeys.remove((Integer)keyCode);
  } else {
    keys.remove((Character)key);
  }
}