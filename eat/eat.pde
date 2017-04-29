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
float spawnX = (int) random(1950);
float spawnY = (int) random(1200);
float X = spawnX;
float Y = spawnY;
int k=100;
boolean lose = false;
int i = 80;
int l = 40;
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
  spawnX-=X/2500;
  spawnY-=Y/2500;
  //larger is slower
  if (spawnX >=0-i&&spawnX <= 0+l &&spawnY >=0-l&&spawnY <= 0+i) {
    spawnY = (int) random(1200);
    spawnX = (int) random(1950);
    X = spawnX;
    Y = spawnY;
    k = k + 10;
    i = i+10;
    l = l+10;
  }
}
/*void stop()
 {
 player.close();
 minim.stop();
 super.stop();
 }*/