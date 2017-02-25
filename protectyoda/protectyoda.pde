//    import ddf.minim.*;
    import apwidgets.*;
    APMediaPlayer player;
    APMediaPlayer zap;
   // Minim minim;
    PImage funny;
    PImage guard;
    PImage help;
    PImage enemy;
    PImage go;
    PImage beach;
    int score = 0;
    float spawnX = random(1950);
    float spawnY = random(1200);
    float X = spawnX;
    float Y = spawnY;
    boolean lose = false;
void setup(){
  background(0);
  size(1450, 1200);
  player = new APMediaPlayer(this);
// player = minim.loadFile("seagulls.mp3", 2048);
      player.setMediaFile("seagulls.mp3");
     player.start();
      zap.setMediaFile("seagulls.mp3");
      funny = loadImage("yodapuns.jpg");
      guard = loadImage("lightsaber.png");
      help =  loadImage("yoda.jpg");
      enemy = loadImage("wingull.png");
      go = loadImage("go.jpg");
      beach = loadImage("beach.jpg");
      guard.resize(50,50);
      help.resize(80, 80);
      enemy.resize(100, 100);
      beach.resize(1450, 1200);
}
void draw(){
  if(lose == false){
  image(beach, 0, 0);
  image(guard, mouseX, mouseY);
        funny.resize(300, 200);
      image(funny, 1100, 0);
      image(help, 0, 0);
      image(enemy, spawnX, spawnY);
      spawnX-=X/40;
      spawnY-=Y/40;
      if(spawnX >=mouseX-50&&spawnX <= mouseX+50 &&spawnY >=mouseY-50&&spawnY <= mouseY+50) {
        spawnY = (int) random(1200);
        spawnX = (int) random(1400);
        score = score+1;
        X = spawnX;
        Y = spawnY;
        zap.start();
      }
      text("Score:"+score,725,50);
      if(spawnX >=0-80&&spawnX <= 0+40 &&spawnY >=0-40&&spawnY <= 0+80) {
        spawnY = (int) random(1200);
        spawnX = (int) random(1400);
        X = spawnX;
        Y = spawnY;
        lose=true;
      }
  }
        if(lose == true){
            go.resize(1450, 1200);                                                                                                                                                                                                                                                          
          image(go, 0,0); 
          textSize(30);
          text("So that's how Yoda got bald... Click anywhere to continue",20,20);
          color(255, 255, 255);
          text("Score:"+score,575,50);
        }
}
/*void stop()
{
  player.close();
  minim.stop();
  super.stop();
}*/
void mousePressed(){
   lose = false;
   score = 0;
}