import ddf.minim.*; 
Minim minim;        //as a member variable
AudioPlayer song; 
//We are going to make a virtual record player that spins and plays your song when you click on it.
int xPosition = 0;
int yPosition = 0;
//Start with a new sketch that contains setup() and draw() methods. Ask your teacher if you don't know how to do this.
void rotateImage(PImage image, int amountToRotate) {
  translate(width/2, height/2);
  rotate(amountToRotate*TWO_PI/360);                              
  translate(-image.width/2, -image.height/2);
}
PImage pictureOfRecord;
//1. Find an image of a record.
//i) Save the image.
//  ii) Drop the image file onto your sketch.
//  iii) Load it with code like this...
void setup() {
  //as member variable
  pictureOfRecord = loadImage("record.png");   //in setup method  
  size(250, 250);
  //at the very top of your sketch
  //as a member variable
  minim = new Minim(this);    //in the setup method
  int v = (int) random(0, 3);
  if (v==0) {
    song = minim.loadFile("scatman.mp3", 512);//in the setup method
  }
  else if (v==1) {
    song = minim.loadFile("ngu.mp3", 512);
  }
  else if (v==2) {
    song = minim.loadFile("ri90's.mp3", 512);
  }
}
//8. Only play the song when the mouse is pressed.

//2. Set the size of your canvas to match the size of your image
//3. Use this method to rotate your image. Make sure you use the image() command after you call rotateImage().

void draw() {
  //5. Adjust the speed of the record player. Make the record spin.
  //i) Make a variable to keep track of the image angle.
  //ii) Increase this variable in the draw method.
  //iii) Use this variable when you call the rotateImage() method.

  //in draw method
  //6. Only spin the record when the user clicks the mouse button.
  if(mousePressed) {
    song.play();
    background(255);
    rotateImage(pictureOfRecord, 10);
  }
  image(pictureOfRecord, xPosition, yPosition);
  //7. Add a song.
  //drop the song file onto your sketch
  //9. Make the record spin as fast as possible
}