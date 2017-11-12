void setup() {
  size(1000, 1000);
}
int score = 0;
float by = 10;
int bx = (int) random(0, 1000);
void draw() {
  background(random(0, 1));
  fill(0, 150, 150);
  ellipse(bx, by, 10, 10);
  by = by+20;
  noStroke();
  fill(70, 68, 76);
  rect(mouseX, 800, 100, 200);
  if (by>=1000) {
    by = 10;
    bx = (int) random(0, 1000);
  }
}
void checkCatch(int x) {
  if (x > mouseX && x < mouseX+100)
    score++;
  else if (score > 0)
    score--;
  println("Your score is now: " + score);
}