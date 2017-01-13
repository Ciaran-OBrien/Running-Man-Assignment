void setup() {

  size(1000, 1000);
  
  skin1 = loadImage("marioRunning1.png");
  skin2 = loadImage("marioRunning2.png");
  skin3 = loadImage("marioRunning3.png");
  skin4 = loadImage("marioRunning4.png");
  
  frameRate(24);
}

PImage skin1,skin2,skin3,skin4,playerSkin;
int horizon = 800, speed = 10, direction = 1;
float posX , posY = horizon;


void draw() {
  background(205);
  posX=posX+speed*direction;
   
  if(posX > width){
    posX = 0;
  }
   if (posX < 0) {
     posX = width;
   }

   
  if((frameCount/4)%2==0 && direction == 1){
    playerSkin = skin1;
  }
  
  else if ((frameCount/4)%2!=0 && direction == 1){
    playerSkin = skin2;
  }
  
  if((frameCount/4)%2==0 && direction == -1){
    playerSkin = skin3;
  }
  
  else if ((frameCount/4)%2!=0 && direction == -1){
    playerSkin = skin4;
  }
  
  //ellipse(posX,posY,50,50);
  image(playerSkin,posX,posY);


 
}



void keyPressed(){
  
  if(key == 'a'){
    
    direction = -1;
  
  }
  
  else if(key == 'd'){
    
    direction = 1;
  
  }

}