PImage person;
int pupilX;
int pupilY;
void setup(){
  size(1100, 1500);
  person = loadImage("obama.JPG");
  person.resize(1100, 1500);
}
void draw(){
  pupilX = mouseX;
  pupilY = mouseY;
     if(pupilX<=650){
     pupilX = 650;
   }
    if(pupilX>=750){
     pupilX = 750;
   }
   if(pupilY<=500){
     pupilY = 500;
   }
   if(pupilY>=660){
     pupilY = 660;
   }
    background(person);
  ellipse(700, 600, 200, 200);
  fill(random(255), random(255), random(255));
   ellipse(500, 580, 200, 200);
   fill(random(255), random(255), random(255));
   ellipse(pupilX - 200, pupilY, 10, 10);
   fill(random(255), random(255), random(255));
   ellipse(pupilX, pupilY + 20, 10, 10);
   fill(random(255), random(255), random(255));
}