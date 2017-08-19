int pX = 25;
int pY = 25;
int enX = 1895;
int enY = 1055;
boolean[] keys;
void setup(){
  fullScreen();
  keys = new boolean[2];
  keys[0] = false;
  keys[1] = false;
}
void draw(){
  enemyMovement();
  playerMovement();
}
void enemyMovement(){
  ellipse(enX, enY, 50, 50);
  fill(0, 255, 255);
  if(keyCode == UP){
    enY = enY - 10;
  }
  if(keyCode == DOWN){
    enY = enY + 10;
  }
  if(keyCode == LEFT){
    enX = enX - 10;
  }
  if(keyCode == RIGHT){
    enX = enX + 10;
  }
}
void playerMovement(){
  ellipse(pX, pY, 50, 50);
  fill(255, 255, 0);
  if(key == 'a' || key == 'A'){
    pX = pX - 10;
  }
  if(key == 'd' || key == 'D'){
    pX = pX + 10;
  }
  if(key == 's' || key == 'S'){
    pY = pY + 10;
  }
  if(key == 'w' || key == 'W'){
    pY = pY - 10;
  }
}