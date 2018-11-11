/*
   0.   Start a new sketch with setup() and draw() methods.
 
 Choose a size and background color for your sketch in the setup method.
 void size(int width, int height) {}
 void background(int red, int green, int blue) {}
 
 In your draw method, draw a diagonal line of ellipses.
 
 Set the x and y location of each ellipse to a random number. 
 float random(int maxValue) {}
 
 Set the color of each ellipse. Pass in frameCount or i as parameters for some extra coolness.
 void fill(int red, int green, int blue) {}
 
 Paste this code at the bottom of your sketch.
 float frequency = .001;
 float noiseInterval = PI; 
 
 void makeMagical() {
 fill( 0, 0, 0, 10 );rect(0, 0, width, height);noStroke();
 }
 
 float getWormX(int i) {
 return map(noise(i*noiseInterval + frameCount * frequency), 0, 1, 0, width);
 }
 
 float getWormY(int i) {
 return map(noise(i*noiseInterval+1 + frameCount * frequency), 0, 1, 0, height);
 }
 
 Use the getWormX and getWormY methods to set the x and y location of each ellipse.
 
 Call makeMagical() in your draw method.
 
 Adjust the frequency and noiseInterval variables to your liking. Also play with the number and size of particles until it looks Amazing.
 
 **OPTIONAL** add a worm everytime the user clicks the mouse
 
 */
int wormCount=0;
void setup() {
  fullScreen();
  background(0);
}
void draw() {
  if(frameCount%100==0) {
    wormCount+=1;
  }
  noStroke();
  int worm=random(10);
  for(int i=0; i<=wormCount; i++){
    fill(i%255, frameCount%255, 100);
  ellipse(getWormX(i), getWormY(i), worm, worm);
  }
}
int random (int maxValue) {
  int y = (int) random(0, maxValue);
  return y;
}
float frequency = .005;
 float noiseInterval = PI; 
void makeMagical() {
 fill( 0, 0, 0, 10 );
 rect(0, 0, width, height);
 noStroke();
 }
 
 float getWormX(int i) {
 return map(noise(i*noiseInterval + frameCount * frequency), 0, 1, 0, width);
 }
 
 float getWormY(int i) {
 return map(noise(i*noiseInterval+1 + frameCount * frequency), 0, 1, 0, height);
 }
 void mouseClicked() {
  wormCount+=3;
}