/* 1. Change the code below to make the rocket ship take off. */
/* 2. Add a moon and stars to the sky. */



void setup() {
  fullScreen();
}

void draw() {
    background(0, 0, 40);
    int x = mouseX;
int y = mouseY;
      fill(232, 218, 110);
    ellipse(50,50, 100, 100);
      fill(232, 218, 110);
    ellipse(random(2000),random(2000), 15, 15);
  fill(random(255), 0, 0);
  ellipse(x, y + 130, 90, 90);
  fill(248, 128, 0);
  ellipse(x, y + 115, 70, 70);
  fill(255, 153, 0);
  ellipse(x, y + 95, 35, 35);
  fill(100, 100, 100);
  triangle(x, y + 10, x + 50, y + 100, x - 50, y + 100);
/*  x = x-10;
  y = y-10;*/
}