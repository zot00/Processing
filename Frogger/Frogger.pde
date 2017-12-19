/*Start with a new sketch that contains setup() and draw() methods. Ask your teacher if you don’t know how to do this. The suggestion under each step should help you with your program.
 
 Save your sketch as frogger inside your processing folder.
 
 1.Make a canvas of size 400x400 for your game. 
 size(width, height)       // in setup method 
 background(red, green, blue)    // in draw method 
 
 2. Draw a frog on the bottom of the canvas. (It can be a ball for now)
 fill(red, green, blue)      // in draw method 
 ellipse(x, y, width, height)     // in draw method 
 
 3.  Make member variables to keep track of your frog’s hop distance, X and Y position
 
 
 4. Add code to the method below to give our frog movement. 
 
 void keyPressed()
 {
 if(key == cODED){
 if(keycode == UP)
 {
 //Frog Y position goes up
 }
 else if(keycode == DOWN)
 {
 //Frog Y position goes down 
 }
 else if(keycode == RIGHT)
 {
 //Frog X position goes right
 }
 else if(keycode == LEFT)
 {
 //Frog X position goes left
 }
 }
 }
 
 5. Write a method to keep our frog from going outside of the canvas
 
 6. create a car class inside your sketch. 
 //Your car class will include the car’s position at x, position at y, the size of the car, and the speed of the car.
 7. create a constructor inside your car class that initializes each variable with parameters.
 
 
 8. copy this functionality in your car class to display your car position 
 void display() 
 {
 fill(0,255,0);
 rect(Position of X , Position of Y,  Size of your car, 50);
 }
 
 9. create several new car objects at the top of your sketch.
 
 10. call the display() method in your draw method for each car. You should see your car appear.
 
 11.  Inside your car class write a method for the car to move to the left with its speed. 
 
 12.  In the same method, do a check if it goes off the canvas to have it return to the rightmost position of your canvas.  (hint: use the width variable)
 
 13.  Write a method for the car to move to the right with its speed. 
 
 14. In the same method, do a check if it goes off the canvas to have it return to the leftmost position of your canvas
 
 15. In the draw() method, alternate the driving direction of each of your cars to either go left or right. Use the display() method after every drive method. 
 
 
 }16. create a getX(), getY(), and getSize() method in your car class.
 
 17. check when a car hits your frog. You can use the following intersection method to help. 
 
 boolean intersects(car car) {
 if ((fy > car.getY() && fy < car.getY()+50) && (fx > car.getX() && fx < car.getX()+car.getSize()))
 return true;
 else 
 return false;
 18. call the intersects method for one of your cars in your draw method.  If the intersects method returns true, return your frog to the starting point. 
 
 19. Repeat step 18 for all of your cars.
 
 20. create a winner banner once you get to the other side 
 text( string message, x, y); 
 textSize(size); 
 
 */
int rand1 = (int) random(1, 100);
int rand2 = (int) random(1, 100);
int l = (int) random(1, 26);
int d = (int) random(1, 26);
int h = (int) random(1, 26);
int c = (int) random(1, 200);//c=rand3
PImage frog;
int fx = 175;
int fy = 350;
int r = (int) random(0, 255);
int g = (int) random(0, 255);
int b = (int) random(0, 255);
car c1;
car c2;
car c3;
void setup() {
  //hermit.png
  if (c%2==0) {
    c1 = new car(400, 100, l, 100);
  } else if (c%2==1) {
    c1 = new car(0, 100, l, 100);
  }
  if (rand1%2==0) {
    c2 = new car(400, 200, d, 100);
  } else if (rand1%2==1) {
    c2 = new car(0, 200, d, 100);
  }
  if (rand2%2==0) {
    c3 = new car(400, 300, h, 100);
  } else if (rand2%2==1) {
    c3 = new car(0, 300, h, 100);
  }
  frog = loadImage("hermit.png");
  frog.resize(25, 25);
  size(400, 400);
}
void draw() {
  size(400, 400);
  if (intersects(c1)==true) {
    frog = loadImage("bp.png");
    frog.resize(25, 25);
    println("RIP jabbmit the weird looking frog alien");
  }
  if (intersects(c2)==true) {
    frog = loadImage("bp.png");
    frog.resize(25, 25);
    println("RIP jabbmit the weird looking frog alien");
  }
  if (intersects(c3)==true) {
    frog = loadImage("bp.png");
    frog.resize(25, 25);
    println("RIP jabbmit the weird looking frog alien");
  }
  //println(rand1 + " " + rand2 + " " + c);
  background(r, g, b);
  image(frog, fx, fy);
  if (fx>width||fx<0||fy>height||fy<0) {
    fx=175;
    fy=350;
  }
  if (c%2==0) {
    c1.display();
    c1.moveLeft();
  } else if (c%2==1) {
    c1.display();
    c1.moveRight();
  }
  if (rand1%2==0) {
    c2.display();
    c2.moveLeft();
  } else if (rand1%2==1) {
    c2.display();
    c2.moveRight();
  }
  if (rand2%2==0) {
    c3.display();
    c3.moveLeft();
  } else if (rand2%2==1) {
    c3.display();
    c3.moveRight();
  }
}
boolean intersects(car car) {
  if ((fy > car.getY()-1 && fy < car.getY()+50) && (fx > car.getX() && fx < car.getX()+car.getSize())) {
    return true;
  } else {
    return false;
  }
}
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      fy-=50;
    } else if (keyCode == DOWN)
    {
      fy+=50;
    } else if (keyCode == RIGHT)
    {
      fx+=50;
    } else if (keyCode == LEFT)
    {
      fx-=50;
    }
  }
}
class car {
  int x;
  int y;
  int speed;
  int size;
  car(int x, int y, int speed, int size) {
    this.x=x;
    this.y=y;
    this.speed=speed;
    this.size=size;
  }
  void display() {
    fill(0, 255, 0);
    rect(x, y, size, 50);
  }
  void moveLeft() {
    speed=(int) random(1, 30);
    x-=speed;
    if (x<-size) {
      x=400;
    }
  }
  void moveRight() {
    speed=(int) random(1, 30);
    x+=speed;
    if (x>size+width) {
      x=0;
    }
  }
  int getY() {
    return y;
  }
  int getX() {
    return x;
  }
  int getSize() {
    return size;
  }
}