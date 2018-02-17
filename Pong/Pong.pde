/*
 Start with a new sketch that contains setup() and draw() methods. Ask your teacher if you don't know how to do this. The suggestions under each step should help you with your program.
 1.Make a canvas for your game.
 size(width, height)      //in setup method
 background(red, green, blue)  //in draw method
 2. Draw a ball on the screen.
 ellipse(x, y, width, height)  //in draw method
 fill(red, green, blue)    //in draw method
 stroke(red, green, blue)    //in draw method
 3. Make the ball move across the screen (left to right).
 //make a variable for the ball's X position and change it in the draw method.
 4. Change the speed of the ball.
 //make a variable for the speed of the ball in the X direction (from left to right).
 //changing this variable should change the speed of your ball
 5. Bounce the ball off the walls.
 width
 println(output)
 
 6. Do the same in the Y (up and down) direction.
 height
 7. Make a sound when the ball falls on the ground.
 //drop the sound file onto your sketch
 import ddf.minim.*;       //at the very top of your sketch
 Minim minim;        //at the top of your sketch
 AudioPlayer sound;      //at the top of your sketch
 minim = new Minim (this);    //in the setup method
 sound = minim.loadFile("BD.mp3", 128);//in the setup method
 sound.play();        //in draw method (when the ball hits the bottom)
 8. Add a background image for your game.
 PImage backgroundImage;         //at the top of your sketch
 backgroundImage = loadImage("image.jpg");  //in the setup method
 image(backgroundImage, 0, 0);      //in draw method image(backgroundImage, 0, 0, width, height);    //if you want to resize
 9. Draw a paddle at the bottom of the screen
 rect(x, y, width, height);
 10. Make the paddle move over and back with the mouse.
 mouseX
 11. Make the ball change Y direction when it hits the paddle. Figure it out by yourself, or use this method:
 boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
 if (ballY > paddleY && ballX > paddleX && ballX < paddleX + paddleLength)
 return true;
 else 
 return false;
 }
 */
import java.util.ArrayList;
import ddf.minim.*;
Minim minim;
AudioPlayer sound;
AudioPlayer l;
AudioPlayer m;
AudioPlayer themesong;
float bx=width/2;
float by=height/2;
float yspd = 5;
float xspd = 5;
int p1y = height/2;
int p2y = height/2;
boolean t = true;
ArrayList<Character> specialKeys = new ArrayList<Character>();
ArrayList<Character> keys = new ArrayList<Character>();
void setup() {
  keys.add('k');
  keys.add('i');
  keys.add('w');
  keys.add('s');
  fullScreen();
  minim = new Minim (this);
  themesong=minim.loadFile("Skywards.mp3", 128);
  m=minim.loadFile("Bong.wav", 128);
  sound = minim.loadFile("Dong.wav", 128);
  themesong.loop();
}
void draw() {
  background(25, 39, 45);
  ellipse(bx, by, 25, 25);
  playerMovement();
  rect(0, p1y, 20, 100);
  rect(width-21, p2y, 20, 100);
  fill(50, 0, 0);
  stroke(random(1, 255), random(1, 255), random(1, 255));
  bx+=xspd;
  by+=yspd;
  if (bx-12.5<0) {
    xspd=xspd*-1.05;
    sound.play();
    sound.rewind();
  }
  if (bx+12.5>width) {
    xspd=xspd*-1.05;
    sound.play();
    sound.rewind();
  }
  if (by+12.5>height) {
    yspd=yspd*-1.05;
    sound.play();
    sound.rewind();
  }
  if (by-12.5<0) {
    yspd=yspd*-1.05;
    sound.play();
    sound.rewind();
  }
  if (yspd>=20) {
    yspd=-19;
  }
  if (xspd>=20) {
    xspd=-19;
  }
  if (yspd<=-20) {
    yspd=19;
  }
  if (xspd<=-20) {
    xspd=19;
  }
}
// a b c d e f g h i j k l m n o p q r s t u v w x y z
void playerMovement() {
  for (Character i : keys) {
    if (i == 'k') {
      p2y = p2y - 10;
    }
    if (i == 'i') {
      p2y = p2y + 10;
    }
    if (i == 's') {
      p1y = p1y - 10;
    }
    if (i == 'w') {
      p1y = p1y + 10;
    }
  }
  if (p1y<=0) {
    p1y=height/2;
  }
  if (p1y>=height) {
    p1y=height/2;
  }
  if (p2y<=0) {
    p1y=height/2;
  }
  if (p2y<=height) {
    p1y=height/2;
  }
}
void keyPressed() {
  if (!keys.contains(key)) {
    keys.add(key);
  }
}
void keyReleased() {
  keys.remove((Character)key);
}