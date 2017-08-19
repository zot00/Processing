void setup(){
  fullScreen();
}
void draw(){
  if(mousePressed == false){
    background(250, 250, 250);
    text("Once upon a time, you had a pet turkey. One day you decided to watch soccer and snuck your turkey in.",  0, 20);
    text("Your turkey managed to sneak out of your pack onto the soccer field. The players don't seem to notice. You need to guide your turkey away from the players.", 0, 40);
  }else{
    background(0, 250, 0);
    
  }
}