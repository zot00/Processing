import java.util.ArrayList;
int pX = 25;
int pY = 25;
int enX = 1895;
int enY = 1055;
ArrayList<Character> specialKeys = new ArrayList<Character>();
ArrayList<Character> keys = new ArrayList<Character>();
void setup() {
  fullScreen();
}
void draw() {
  background(255);
  enemyMovement();
  playerMovement();
}
void enemyMovement() {
  ellipse(enX, enY, 50, 50);
  fill(0, 255, 255);
  if (!(pX < 0 || pY < 0 || pX > width || pY > height)) {
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
    }
  } else if (enX > width || enY > height) {
    enX = width-50;
    enY = height-50;
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
  } else if (enX <= 0 || enY <= 0) {
    enX = 0;
    enY = 0;
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
  }
}
void playerMovement() {
  ellipse(pX, pY, 50, 50);
  fill(255, 255, 0);
  if (!(pX < 0 || pY < 0 || pX > width || pY > height)) {
    //println("p");
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
  } else if (pX > width || pY > height) {
    pX = width-50;
    pY = height-50;
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
  } else if (enX <= 0 || enY <= 0) {
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
    if (keyCode == UP) {
      enY = enY - 10;
    } else if (keyCode == DOWN) {
      enY = enY + 10;
    } else if (keyCode == RIGHT) {
      enX = enX - 10;
    } else if (keyCode == LEFT) {
      enX = enX + 10;
    }
  } else if (!keys.contains(key)) {
    keys.add(key);
  }
}
void keyReleased() {
  if (key == CODED) {
    println(specialKeys);
    specialKeys.remove((Integer)keyCode);
  } else {
    keys.remove((Character)key);
  }
}