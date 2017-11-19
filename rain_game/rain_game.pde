void setup() {
  size(1000, 1000);
}
int wind = (int) random(0, width);
int score = 0;
float by = 10;
int bX = (int) random(0, 1000);
void draw() {
  background(random(0, 1));
  fill(0, 150, 150);
  ellipse(bX, by, 10, 10);
  text("Your score is now: " + score, width/2, height/2);
  by = by+score+1;
  windforraindrop();
  noStroke();
  fill(70, 68, 76);
  rect(mouseX-100, 800, 200, 200);
  if(by>999){
    checkCatch(bX);
    bX = (int) random(0, 1000);
    wind = (int) random(0, width);
  }
  if (by>=1000) {
    by = 10;
    bX = (int) random(0, 1000);
    wind = (int) random(0, width);
  }
  if(bX>=width){
    by = 10;
    bX = (int) random(0, width);
    wind = (int) random(0, width);
  }
}
void windforraindrop(){
  if(bX<wind){
    bX += (int) random(1, score+1);
  }
  if(bX>wind){
    bX -= (int) random(1, score+1);
  }
  if(bX==wind){
    wind = (int) random(0, width);
  }
  if(by >= height-400){
    wind = bX;
  }
}
void checkCatch(int x) {
  if (x > mouseX-100 && x < mouseX+100)
    score++;
  else if (score > 0)
    score--;
}