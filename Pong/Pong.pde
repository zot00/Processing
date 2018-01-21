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
 AudioSample sound;      //at the top of your sketch
 minim = new Minim (this);    //in the setup method
 sound = minim.loadSample("BD.mp3", 128);//in the setup method
 sound.trigger();        //in draw method (when the ball hits the bottom)
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
int bX=width/2;
void setup() {
  fullScreen();
}
void draw() {
  background(25, 39, 45);
  ellipse(bX, height/2, 25, 25);
  fill(50, 0, 0);
  stroke(random(1, 255), random(1, 255), random(1, 255));
}