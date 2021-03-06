import java.util.ArrayList;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage field;
int pX = 25;
boolean intutorial = true;
int pY = 25;
boolean twoplayerenemy= false;
int p2H = 500;
float ptX = 25;
float ptY = height - 25;
float enX = 1895;
float enY = 1055;
int p1H = 500;
int enH = 500;
float enb1X = enX;
float enb2X = enX;
float enb1Y = enY;
float enb2Y = enY;
int enGX = (int) random(0, width);
int enGY = (int) random(0, height);
float bX = pX;
float bY = pY;
boolean teammode = false;
float btX = enX;
float btY = enY;
float bthX = ptX;
float bthY = ptY;
int h = (int) random(0, 10);
int p = (int) random(0, 10);
boolean opmode = false;
boolean tpmode = false;
ArrayList<Character> specialKeys = new ArrayList<Character>();
ArrayList<Character> keys = new ArrayList<Character>();
void setup() {
  fullScreen();
  ptX=25;
  ptY=height-25;
  minim = new Minim(this);
  int r = (int) random(0, 4);
  println(height-25);
  if (r == 0) {
    //Zinnia's song
    //player = minim.loadFile("fight.mp3", 1024);
    //player = minim.loadFile("fightingmusic.mp3", 1024);
    //player.setVolume(.01);
  }
  if (r == 1) {
    // de ja vu
    //player = minim.loadFile("othersong.mp3", 1024); 
    //player = minim.loadFile("fightingmusic.mp3", 1024);
    //player.setVolume(.1);
  }
  if (r == 2) {
    //epic battle music
    //player = minim.loadFile("fightingmusic.mp3", 1024);
    //player.setVolume(.1);
  }
  if (r ==3) {
    //Running in the 90's=HA.mp3
    //player = minim.loadFile("fightingmusic.mp3", 1024);
    //player.setVolume(.1);
  }
  field = loadImage("battlefield.jpg");
  player.loop();
  field.resize(width, height);
}
void draw() {
  if (intutorial == true) {
    background(255);
    fill(255, 0, 0);
    text("Tips:", 40, 40);
    fill(0);
    text("You will need to destroy your enemy's tank and survive.", 40, 70);
    text("Your bullets can do any amount of damage from 0 to 10.", 40, 160);
    text("Your bullets track the enemy.", 40, 90);
    text("A bad strategy is to chase your opponent. (You'll take an insane amount of damage)", 40, 110);
    text("A good strategy is to use the walls to your advantage (I won't say how).", 40, 130);
    fill(255, 0, 0);
    text("Instructions:", 40, 210);
    fill(0);
    text("Yellow tank moves with WASD. Blue tank moves with IJKL.", 40, 240);
    text("Your and your enemy's bullets fire automatically.", 40, 270);
    text("That is all. Type o for one player, t for two players, and b for working together.", 40, 360);
  }
  if (intutorial == false && tpmode == true) {
    background(field);
    bullet();
    enemyMovement();
    playerMovement();
  }
  if (intutorial == false && opmode == true) {
    background(field);
    opbullet();
    enCPU();
    playerMovement();
  }
  if (intutorial == false && teammode == true) {
    background(field);
    teambullet();
    teamenbullet(); // <- Team enemy bullet
    playerMovement();
    player2Movement(); // Ya mix a fish, bird, and male cow, and you get a sport. Yeah...
    teamenCPU();
    if (twoplayerenemy==false) {
      enH=1000;
      twoplayerenemy=true;
    }
  }
}
void enemyMovement() {
  fill(0, 255, 255);
  ellipse(enX, enY, 50, 50);
  //println("p");
  for (Character i : keys) {
    if (i == 'j') {
      enX = enX - 10;
    }
    if (i == 'l') {
      enX = enX + 10;
    }
    if (i == 'k') {
      enY = enY + 10;
    }
    if (i == 'i') {
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
void player2Movement() {
  fill(0, 255, 255);
  for (Character i : keys) {
    if (i == 'j') {
      ptX = ptX - 10;
    }
    if (i == 'l') {
      ptX = ptX + 10;
    }
    if (i == 'k') {
      ptY = ptY + 10;
    }
    if (i == 'i') {
      ptY = ptY - 10;
    }
    if (ptX>width || ptY>height) {
      ptX = 25;
      ptY = height-25;
    }
    if (ptX<0||ptY <0) {
      ptX = 25;
      ptY = height-25;
    }
  }
  ellipse(ptX, ptY, 50, 50);
}
void playerMovement() {
  fill(255, 255, 0);
  ellipse(pX, pY, 50, 50);
  for (Character i : keys) {
    if (i == 'a') {
      pX = pX - 10;
    }
    if (i == 'd') {
      pX = pX + 10;
    }
    if (i == 's') {
      pY = pY + 10;
    }
    if (i == 'w') {
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
void enCPU() {
  fill(255, 0, 0);
  ellipse(enX, enY, 50, 50);
  if (enH>250) {
    float enGX = pX;
    float enGY = pY;
    if (enX>enGX) {
      enX = enX - 10;
    }
    if (enY>enGY) {
      enY = enY - 10;
    }
    if (enX<enGX) {
      enX = enX + 10;
    }
    if (enY<enGY) {
      enY = enY + 10;
    }
  }
  if (enH<=250) {
    if (enX>enGX) {
      enX = enX - 10;
    }
    if (enY>enGY) {
      enY = enY - 10;
    }
    if (enX<enGX) {
      enX = enX + 10;
    }
    if (enY<enGY) {
      enY = enY + 10;
    }
    if (enX <= enGX+50 && enY <= enGY+50 && enX >= enGX-50 && enY >= enGY-50) {
      enGX = (int) random(0, width);
      enGY = (int) random(0, height);
    }
  }
}
void teamenbullet() {
  h = (int) random(0, 10);
  p = (int) random(0, 10);
  int bs = 5;
  if (pX>enb1X) {
    enb1X=enb1X+bs;
  }
  if (pX<enb1X) {
    enb1X=enb1X-bs;
  }
  if (pY>enb1Y) {
    enb1Y=enb1Y+bs;
  }
  if (pY<enb1Y) {
    enb1Y=enb1Y-bs;
  }
  if (ptX>enb2X) {
    enb2X=enb2X+bs;
  }
  if (ptX<enb2X) {
    enb2X=enb2X-bs;
  }
  if (ptY>enb2X) {
    enb2Y=enb2Y+bs;
  }
  if (ptY<enb2Y) {
    enb2Y=enb2Y-bs;
  }
  if (enb1X <= pX+25&&enb1Y <= pY+25&&enb1X>=pX-25&&enb1Y>=pY-25) {
    p1H = p1H-p;
    enb1X = enX;
    enb1Y = enY;
  }
  if (enb2X <= ptX+25&&enb2Y <= ptY+25&&enb2X>=enb2X-25&&btY>=enb2Y-25) {
    p2H = p2H-h;
    enb2X = enX;
    enb2Y = enY;
  }
  fill(255, 0, 0);
  ellipse(enb1X, enb1Y, 10, 10);
  ellipse(enb2X, enb2Y, 10, 10);
  fill(255);
  text("Player 1 (Yellow) Health: " + p1H, 150, 100);
  text("Player 2 (Blue) Health: " + p2H, 350, 100);
  text("Enemy (Red) Health: " + enH, 550, 100);
}

void teamenCPU() {
  int enSpeed = 5;
  fill(255, 0, 0);
  ellipse(enX, enY, 50, 50);
  if (enH>500) {
    if (dist(enX, enY, pX, pY)>=dist(enX, enY, ptX, ptY)) {
      enGX= (int) ptX;
      enGY= (int) ptY;
    } else if (dist(enX, enY, ptX, ptY)>dist(enX, enY, pX, pY)) {
      enGX=pX;
      enGY=pY;
    }
    if (enX>enGX) {
      enX = enX - enSpeed;
    }
    if (enY>enGY) {
      enY = enY - enSpeed;
    }
    if (enX<enGX) {
      enX = enX + enSpeed;
    }
    if (enY<enGY) {
      enY = enY + enSpeed;
    }
  }
  if (enH<=500) {
    if (enX>enGX) {
      enX = enX - enSpeed;
    }
    if (enY>enGY) {
      enY = enY - enSpeed;
    }
    if (enX<enGX) {
      enX = enX + enSpeed;
    }
    if (enY<enGY) {
      enY = enY + enSpeed;
    }
    if (enX <= enGX+50 && enY <= enGY+50 && enX >= enGX-50 && enY >= enGY-50) {
      enGX = (int) random(0, width);
      enGY = (int) random(0, height);
    }
  }
}
void teambullet() {
  if (enH <= 0) {
    p = 0;
    h = 0;
    enH = 0;
    fill(255);
    text("The players win!", 150, 200);
    enb2Y = enY;
    enb2X = enX;
    enb1X=enX;
    enb1Y=enY;
    bthX=ptX;
    bthY=ptY;
    bX = pX;
    bY = pY;
    btX = ptX;
    btY=ptY;
    p = 0;
    h = 0;
    fill(255);
    //ellipse(bX, bY, 10, 10);
    //ellipse(btX, btY, 10, 10);
    text("Player 1 (Yellow) Health: " + p1H, 150, 100);
    text("Player 2 (Blue) Health: " + p2H, 350, 100);
    text("Enemy (Red) Health: " + enH, 550, 100);
  } else if (p1H <= 0 || p2H <= 0) {
    p = 0;
    h = 0;
    p1H = 0;
    fill(255);
    text("The enemy (Red) wins!", 350, 200);
    btY = enY;
    btX = enX;
    bX = pX;
    bY = pY;
    bthX=ptX;
    bthY=ptY;
    fill(255);
    // ellipse(bX, bY, 10, 10);
    // ellipse(btX, btY, 10, 10);
    text("Player 1 (Yellow) Health: " + p1H, 150, 100);
    text("Player 2 (Blue) Health: " + p2H, 350, 100);
    text("Enemy (Red) Health: " + enH, 550, 100);
  } else if (enH!=0||p1H!=0 || p2H!=0) {
    h = (int) random(0, 10);
    p = (int) random(0, 10);
    int bs = 15;//<- Bullet Speed
    if (enX>bX) {
      bX=bX+bs;
    }
    if (enX<bX) {
      bX=bX-bs;
    }
    if (enY>bY) {
      bY=bY+bs;
    }
    if (enY<bY) {
      bY=bY-bs;
    }
    if (enX>bthX) {
      bthX=bthX+bs; //<- Bullet 3's X value
    }
    if (enX<bthX) {
      bthX=bthX-bs;
    }
    if (enY>bthY) {
      bthY=bthY+bs; //<- Bullet 3's Y value
    }
    if (enY<bthY) {
      bthY=bthY-bs;
    }
    if (bX <= enX+25&&bY <= enY+25&&bX>=enX-25&&bY>=enY-25) {
      enH = enH-p;
      bX = pX;
      bY = pY;
    }
    if (bthX <= enX+25&&bthY <= enY+25&&bthX>=enX-25&&bthY>=enY-25) {
      enH = enH-p;
      bthX = ptX;
      bthY = ptY;
    }
    fill(255);
    ellipse(bX, bY, 10, 10);
    ellipse(bthX, bthY, 10, 10);
    fill(255);
    text("Player 1 (Yellow) Health: " + p1H, 150, 100);
    text("Player 2 (Blue) Health: " + p2H, 350, 100);
    text("Enemy (Red) Health: " + enH, 550, 100);
  }
}
void opbullet() {
  if (enH<=0||p1H <=0) {
    if (enH <= 0) {
      p = 0;
      h = 0;
      enH = 0;
      fill(255);
      text("The player (Yellow) wins!", 150, 200);
      btY = enY;
      btX = enX;
      bX = pX;
      bY = pY;
      p = 0;
      h = 0;
      fill(255);
      ellipse(bX, bY, 10, 10);
      ellipse(btX, btY, 10, 10);
      text("Player's (Yellow) Health: " + p1H, 150, 100);
      text("Enemy's (Red) Health: " + enH, 350, 100);
    }
    if (p1H <= 0) {
      p = 0;
      h = 0;
      p1H = 0;
      fill(255);
      text("The enemy (Red) wins!", 350, 200);
      btY = enY;
      btX = enX;
      bX = pX;
      bY = pY;
      fill(255);
      ellipse(bX, bY, 10, 10);
      ellipse(btX, btY, 10, 10);
      text("Player's (Yellow) Health: " + p1H, 150, 100);
      text("Enemy's (Red) Health: " + enH, 350, 100);
    }
  }
  if (enH!=0||p1H!=0) {
    h = (int) random(0, 10);
    p = (int) random(0, 10);
    int bs = 15;
    if (enX>bX) {
      bX=bX+bs;
    }
    if (enX<bX) {
      bX=bX-bs;
    }
    if (enY>bY) {
      bY=bY+bs;
    }
    if (enY<bY) {
      bY=bY-bs;
    }
    if (pX>btX) {
      btX=btX+bs;
    }
    if (pX<btX) {
      btX=btX-bs;
    }
    if (pY>btY) {
      btY=btY+bs;
    }
    if (pY<btY) {
      btY=btY-bs;
    }
    if (bX <= enX+25&&bY <= enY+50&&bX>=enX-25&&bY>=enY-25) {
      enH = enH-p;
      bX = pX;
      bY = pY;
    }
    if (btX <= pX+25&&btY <= pY+25&&btX>=pX-25&&btY>=pY-25) {
      p1H = p1H-h;
      btX = enX;
      btY = enY;
    }
    fill(255);
    ellipse(bX, bY, 10, 10);
    ellipse(btX, btY, 10, 10);
    fill(255);
    text("Player's (Yellow) Health: " + p1H, 150, 100);
    text("Enemy's (Red) Health: " + enH, 350, 100);
  }
}
void bullet() {
  if (enH<=0||p1H <=0) {
    if (enH <= 0) {
      p = 0;
      h = 0;
      enH = 0;
      fill(255);
      text("Player 1 (Yellow) wins!", 150, 200);
      btY = enY;
      btX = enX;
      bX = pX;
      bY = pY;
      p = 0;
      h = 0;
      /*if (bthX <= enX+25&&bthY <= enY+50&&bthX>=enX-25&&bthY>=enY-25) {
       enH = enH-p;
       bX = ptX;
       bY = ptY;
       }
       */
      fill(255);
      ellipse(bX, bY, 10, 10);
      ellipse(btX, btY, 10, 10);
      text("Player 1 (Yellow) Health: " + p1H, 150, 100);
      text("Player 2 (Blue) Health: " + enH, 350, 100);
    }
    if (p1H <= 0) {
      p = 0;
      h = 0;
      p1H = 0;
      fill(255);
      text("Player 2 (Blue) wins!", 350, 200);
      btY = enY;
      btX = enX;
      bX = pX;
      bY = pY;
      fill(255);
      ellipse(bX, bY, 10, 10);
      ellipse(btX, btY, 10, 10);
      text("Player 1 (Yellow) Health: " + p1H, 150, 100);
      text("Player 2 (Blue) Health: " + enH, 350, 100);
    }
  }
  if (enH!=0||p1H!=0) {
    h = (int) random(0, 10);
    p = (int) random(0, 10);
    int bs = 15;
    if (enX>bX) {
      bX=bX+bs;
    }
    if (enX<bX) {
      bX=bX-bs;
    }
    if (enY>bY) {
      bY=bY+bs;
    }
    if (enY<bY) {
      bY=bY-bs;
    }
    if (pX>btX) {
      btX=btX+bs;
    }
    if (pX<btX) {
      btX=btX-bs;
    }
    if (pY>btY) {
      btY=btY+bs;
    }
    if (pY<btY) {
      btY=btY-bs;
    }
    if (bX <= enX+25&&bY <= enY+50&&bX>=enX-25&&bY>=enY-25) {
      enH = enH-p;
      bX = pX;
      bY = pY;
    }
    if (btX <= pX+25&&btY <= pY+25&&btX>=pX-25&&btY>=pY-25) {
      p1H = p1H-h;
      btX = enX;
      btY = enY;
    }
    fill(255);
    ellipse(bX, bY, 10, 10);
    ellipse(btX, btY, 10, 10);
    fill(255);
    text("Player 1 (Yellow) Health: " + p1H, 150, 100);
    text("Player 2 (Blue) Health: " + enH, 350, 100);
  }
}
void keyPressed() {
  if (!keys.contains(key)) {
    keys.add(key);
  }
  if (intutorial==true) {
    if (key == 'o') {
      opmode = true;
      intutorial = false;
    }
    if (key == 't') {
      tpmode = true;
      intutorial = false;
    }
    if (key == 'b') {
      teammode = true;
      intutorial = false;
      enH=500;
    }
  }
}
void keyReleased() {
  keys.remove((Character)key);
}
