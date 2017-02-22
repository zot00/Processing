int buttonsize = 100;
int i = 50;
void setup (){
  size(1920, 1200);
}
void draw() {
   ellipse(i, 50, buttonsize, buttonsize);
  ellipse(i, 150, buttonsize, buttonsize);
  ellipse(i, 250, buttonsize, buttonsize);
  ellipse(i, 350, buttonsize, buttonsize);
  ellipse(i, 450, buttonsize, buttonsize);
  ellipse(i, 550, buttonsize, buttonsize);
  ellipse(i, 650, buttonsize, buttonsize);
  ellipse(i, 750, buttonsize, buttonsize);
  ellipse(i, 850, buttonsize, buttonsize);
  ellipse(i, 950, buttonsize, buttonsize);
    i = i + 100; 
}
