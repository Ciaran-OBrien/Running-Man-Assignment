void setup() {

  size(1000, 1000);

  for (int i=1; i<5; i++){
    skins[i] = loadImage("marioRunning" + i + ".png");
  }
  
  frameRate(24);
}

PImage playerSkin;
int horizon = 800, speed = 10, direction = 1, numOfSkins = 5;
float posX , posY = horizon;
PImage[] skins = new PImage[numOfSkins];


void draw() {
  background(205);
  posX=posX+speed*direction;
   
  if(posX > width){
    posX = 0;
  }
   if (posX < 0) {
     posX = width;
   }

  // Character standing facing right
  if((frameCount/4)%2==0 && direction == 1){
    playerSkin = skins[1];
  }
  
  // Character runnning facing right
  else if ((frameCount/4)%2!=0 && direction == 1){
    playerSkin = skins[2];
  }
  
  // Characater standing facing left
  if((frameCount/4)%2==0 && direction == -1){
    playerSkin = skins[3];
  }
  
  // Character standing facing left
  else if ((frameCount/4)%2!=0 && direction == -1){
    playerSkin = skins[4];
  }

  
  imageMode(CENTER);
  image(playerSkin,posX,posY);
  // Draw image using CENTER mode, playerSkin, based on above
 
}



void keyPressed(){
  
  if(key == 'a'){
    // Change direction leftward once key is pressed
    direction = -1;
  
  }
  
  else if(key == 'd'){
    // Change direction rightward once key is pressed
    direction = 1;
  
  }

}