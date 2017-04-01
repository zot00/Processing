PImage you;
PImage enemy;
void setup(){
  size(450, 900);
  you = loadImage("kingtower1.png");
  enemy = loadImage("King_Tower2.png");
  you.resize(250,200);
  enemy.resize(250,200);
  image(you, 70, 700);
  image(enemy, 70, 0);
}
void mousePressed(){
  
}
