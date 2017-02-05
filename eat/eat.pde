import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage funny;
PImage guard;
PImage help;
PImage go;
PImage beach;
PImage enemy;
int score = 1;
int spawnX = (int) random(1950);
int spawnY = (int) random(1200);
int X = spawnX;
int Y = spawnY;
int k=1;
boolean lose = false;
void setup() {
  background(0);
  size(1950, 1200);
  minim = new Minim(this);
  player = minim.loadFile("space.mp3", 2048);
  player.play();
  help =  loadImage("kirby.png");
  enemy = loadImage("burger.jpg");
  enemy.resize(100, 100);
}
void draw() {
  help.resize(k, k);
    background(0);
//    size(1950, 1200);
    image(help, 0, 0);
    image(enemy, spawnX, spawnY);
    spawnX-=X/30;
    spawnY-=Y/30;
    if (spawnX >=0-80&&spawnX <= 0+40 &&spawnY >=0-40&&spawnY <= 0+80) {
      spawnY = (int) random(1200);
      spawnX = (int) random(1950);
      X = spawnX;
      Y = spawnY;
      k = k + 10;
    }
 
  }
/*void stop()
 {
 player.close();
 minim.stop();
 super.stop();
 }*/