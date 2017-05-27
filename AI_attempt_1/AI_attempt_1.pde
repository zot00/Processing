import ddf.minim.*;
AudioPlayer player;
AudioPlayer shoot;
AudioPlayer explode;
AudioPlayer yay;
AudioPlayer aww;
Minim minim;
int enGX1 = mouseX;
int enGY1 = mouseY;
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
int enH = 500;
int pH = (int) random(200, 350);
boolean intutorial = true;
int tX = 100;
int tY = 200;
int bthX = tX;
int bthY = tY;
void setup() {
  fullScreen();
  minim = new Minim(this);
  player = minim.loadFile("beep.mp3", 2048);
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
  if (intutorial == true) {
    background(255);
    fill(255, 0, 0);
    text("Tips:", 40, 40);
    fill(0);
    text("You will need to destroy your enemy's tank and survive.", 40, 70);
    text("Your enemy is stronger, faster, and has more health than your tank, but your enemy is dumb.", 40, 100);
    text("Your enemy will have two modes: attack mode and bonkers mode.", 40, 130);
    text("Attack mode is active until your enemy's health goes below 250. It will chase you and instantly kill you if you don't move out of the way.", 40, 160);
    text("In bonkers mode, your enemy will go all over the screen, trying to evade your attacks. This is active when the enemy's health is below 250.", 40, 190);
    fill(255, 0, 0);
    text("Instructions:", 40, 210);
    fill(0);
    text("Your tank moves with your mouse.", 40, 240);
    text("Your and your enemy's bullets fire automatically, but you can reset both your enemy's shot and yours by simply clicking on the screen.", 40, 270);
    text("DO NOT CIRCLE THE SCREEN WITH YOUR MOUSE. THAT IS CONSIDERED CHEATING.", 40, 300);
    text("You will get a turret when the game thinks you're losing.", 40, 330);
    text("That is all. Click anywhere to start the game.", 40, 360);
    if (mousePressed) {
      intutorial = false;
    }
  } else {
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
    if (enH<=250) {
      if (enGX>enX) {
        enX=enX+40;
      }
      if (enGX<enX) {
        enX=enX-40;
      }
      if (enGY>enY) {
        enY=enY+40;
      }
      if (enGY<enY) {
        enY=enY-40;
      }
      if (enX <= enGX+50 && enY <= enGY+50 && enX >= enGX-50 && enY >= enGY-50) {
        enGX = (int) random(0, 1500);
        enGY = (int) random(0, 1000);
      }
      if (enX>bX) {
        bX=bX+20;
      }
      if (enX<bX) {
        bX=bX-20;
      }
      if (enY>bY) {
        bY=bY+20;
      }
      if (enY<bY) {
        bY=bY-20;
      }
      if (pX>btX) {
        btX=btX+20;
      }
      if (pX<btX) {
        btX=btX-20;
      }
      if (pY>btY) {
        btY=btY+20;
      }
      if (pY<btY) {
        btY=btY-20;
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
        bX=bX+15;
      }
      if (enX<bX) {
        bX=bX-15;
      }
      if (enY>bY) {
        bY=bY+15;
      }
      if (enY<bY) {
        bY=bY-15;
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
        btX=btX+15;
      }
      if (pX<btX) {
        btX=btX-15;
      }
      if (pY>btY) {
        btY=btY+15;
      }
      if (pY<btY) {
        btY=btY-15;
      }
      text("Player Health: " + pH, 100, 100);
      text("Enemy Health: " + enH, 900, 900);
      text("Warning: This song is completely irrelivant.", 900, 20);
      if (pH<=0) {
        aww.setVolume(1000);
        aww.play();
        text("Game Over.", 620, 500);
        text("I knew I shouldn't have bought my tank on ebay...", 620, 600);
        bY = pY;
        bX = pX;
        btY = enY;
        btX = enX;
        text("Bumper cars!", 900, 40);
      }
      if (enH<=0) {
        yay.setVolume(1000);
        yay.play();
        text("I win!", 620, 700);
        text("Ebay!!!!!!!!!", 620, 800);
        bY = pY;
        bX = pX;
        btY = enY;
        btX = enX;
        text("Bumper cars!", 900, 40);
      }
    } 
    if (enH>250) {//====================================================================================================================================================================================================================================================
      enGX1 = mouseX;
      enGY1 = mouseY;
      if (enGX1>enX) {
        enX=enX+40;
      }
      if (enGX1<enX) {
        enX=enX-40;
      }
      if (enGY1>enY) {
        enY=enY+40;
      }
      if (enGY1<enY) {
        enY=enY-40;
      }
    }
    if (enX>bX) {
      bX=bX+20;
    }
    if (enX<bX) {
      bX=bX-20;
    }
    if (enY>bY) {
      bY=bY+20;
    }
    if (enY<bY) {
      bY=bY-20;
    }
    if (pX>btX) {
      btX=btX+20;
    }
    if (pX<btX) {
      btX=btX-20;
    }
    if (pY>btY) {
      btY=btY+20;
    }
    if (pY<btY) {
      btY=btY-20;
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
      bX=bX+15;
    }
    if (enX<bX) {
      bX=bX-15;
    }
    if (enY>bY) {
      bY=bY+15;
    }
    if (enY<bY) {
      bY=bY-15;
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
      btX=btX+15;
    }
    if (pX<btX) {
      btX=btX-15;
    }
    if (pY>btY) {
      btY=btY+15;
    }
    if (pY<btY) {
      btY=btY-15;
    }
    text("Player Health: " + pH, 100, 100);
    text("Enemy Health: " + enH, 900, 900);
    text("Warning: This song is completely irrelivant.", 900, 20);
    if (pH<=0) {
      aww.setVolume(1000);
      aww.play();
      text("Game Over.", 620, 500);
      text("I knew I shouldn't have bought my tank on ebay...", 620, 600);
      bY = pY;
      bX = pX;
      btY = enY;
      btX = enX;
      text("Bumper cars!", 900, 40);
    }
    if (enH<=0) {
      yay.setVolume(1000);
      yay.play();
      text("I win!", 620, 700);
      text("Ebay!!!!!!!!!", 620, 800);
      bY = pY;
      bX = pX;
      btY = enY;
      btX = enX;
      text("Bumper cars!", 900, 40);
    }
    if (pH<=enH-pH) {
      fill(0, 255, 0);
      ellipse(tX, tY, 100, 100);
      ellipse(bthX, bthY, 10, 10);
      if (enX>bthX) {
        bthX=bthX+40;
      }
      if (enX<bthX) {
        bthX=bthX-40;
      }
      if (enY>bthY) {
        bthY=bthY+40;
      }
      if (enY<bthY) {
        bthY=bthY-40;
      }
      if (bthX <= enX+50&&bthY <= enY+50&&bthX>=enX-50&&bthY>=enY-50) {
        enH = enH - (int) random(0, 20);
        bthX = tX;
        bthY = tY;
        shoot.rewind();
        explode.rewind();
        explode.play();
        shoot.play();
      }
    } else {
      bthX = tX;
      bthY = tY;
    }
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