void setup() {

  size(1000, 1000);
  
  skin1 = loadImage("marioRunning1.png");
  skin2 = loadImage("marioRunning2.png");
  
  frameRate(24);
}

PImage skin1,skin2,playerSkin;
int horizon = 800;
float posX = width/2;
float posY = horizon;



void draw() {
  background(205);
  
  posX = posX + 5;
 
  
  if(posX > width){
    posX = 0;
  }
  if (posY > height) {
    posY = 0;
   }
   if (posX < 0) {
     posX = horizon;
   }
   if (posY < 0) {
     posY = 200;
   }
   
  if((frameCount/4)%2==0){
    playerSkin = skin1;
  }
  
  else if ((frameCount/4)%2!=0){
    playerSkin = skin2;
  }
  
  //ellipse(posX,posY,50,50);
  image(playerSkin,posX,posY);
  
  
}