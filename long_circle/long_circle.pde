 void setup() {
  size(800, 800);
}

void draw() {
  
   //2. make it a nice color
fill(255,255,34);
   //3. if the mouse is pressed, fill the circle with a different color          
if(mousePressed) {
  fill(100, 205, 34);
} else {
  fill(34, 205, 100);
}

   //1. draw an ellipse
ellipse(10, 100, 10, 1000);
}
// Copyright Wintriss Technical Schools 2013
