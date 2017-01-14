    PImage funny;
    PImage guard;
    PImage help;
    PImage enemy;
    PImage go;
    PImage beach;
    int spawnX = (int) random(1950);
    int spawnY = (int) random(1200);
    int X = spawnX;
    int Y = spawnY;
    boolean lose = false;
void setup(){
  background(0);
  size(1950, 1200);
      funny = loadImage("yodapuns.jpg");
      guard = loadImage("koko.png");
      help =  loadImage("yoda.jpg");
      enemy = loadImage("wingull.png");
      go = loadImage("go.jpg");
      beach = loadImage("beach.jpg");
      guard.resize(50,50);
      help.resize(80, 80);
      enemy.resize(100, 100);
      beach.resize(1950, 1200);
}
void draw(){
  background(beach);
  image(guard, mouseX, mouseY);
        funny.resize(300, 200);
      image(funny, 1650, 0);
      image(help, 0, 0);
      image(enemy, spawnX, spawnY);
      spawnX-=X/50;
      spawnY-=Y/50;
      if(spawnX >=mouseX-50&&spawnX <= mouseX+50 &&spawnY >=mouseY-50&&spawnY <= mouseY+50) {
        spawnY = (int) random(1200);
        spawnX = (int) random(1950);
        X = spawnX;
        Y = spawnY;
      }
      if(spawnX >=0-80&&spawnX <= 0+80 &&spawnY >=0-80&&spawnY <= 0+80) {
        spawnY = (int) random(1200);
        spawnX = (int) random(1950);
        X = spawnX;
        Y = spawnY;
        lose=true;
      }
        if(lose == true){
            go.resize(1950, 1200);
          background(go);
        }
}
