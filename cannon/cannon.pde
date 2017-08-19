void setup(){
size(500,500);
}
void draw(){
    if(mousePressed){
        for(int i=0;i<500;i=i+20){     
            fill(random(255),random(255),random(255));
            ellipse(mouseX+i/10,mouseY,100-i/5,100-i/5);
            }
            }
            }
    