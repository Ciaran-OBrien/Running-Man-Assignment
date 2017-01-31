class Player extends CharacterObject{
  int numOfSkins = 5,speed = 10, horizon = 800;
  float posX, direction = 1;

//  PImage playerSkin;
//  PImage[] marioSkins;
//  PImage[] sonicSkins;
//  PImage[] pacmanSkins;
  
  
  Player(){
    super();
    //marioSkins = new PImage[numOfSkins];
    //sonicSkins = new PImage[numOfSkins];
    //pacmanSkins = new PImage[numOfSkins];
    //for(int i = 1; i < numOfSkins;i++){
    //  marioSkins[i] = loadImage("images/characters/mario/mario" + i + ".png");
    //  sonicSkins[i] = loadImage("images/characters/sonic/sonic" + i + ".png");
    //  pacmanSkins[i] = loadImage("images/characters/pacman/pacman" + i + ".png");
    //}
  }
  void movePlayer(){
    posX=posX+speed*direction;
    if(posX > width){
      posX = 0;
    }
     if (posX < 0) {
       posX = width;
     }  
    
  }
  
  float getDirection(){
    return direction;
  }
  
  void setDirection(float newDirection){
    direction = newDirection;
  }
  void loadMario(){
    // Character standing facing right
    if((frameCount/5)%2==0 && direction == 1){
      playerSkin = marioSkins[1];
    }
    
    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1){
      playerSkin = marioSkins[2];
    }
    
    // Characater standing facing left
    if((frameCount/5)%2==0 && direction == -1){
      playerSkin = marioSkins[3];
    }
    
    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1){
      playerSkin = marioSkins[4];
    }
  image(playerSkin,posX,horizon);
  } 
  
  void loadSonic(){
    // Character standing facing right
    if((frameCount/5)%2==0 && direction == 1){
      playerSkin = sonicSkins[1];
    }
    
    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1){
      playerSkin = sonicSkins[2];
    }
    
    // Characater standing facing left
    if((frameCount/5)%2==0 && direction == -1){
      playerSkin = sonicSkins[3];
    }
    
    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1){
      playerSkin = sonicSkins[4];
    }
  image(playerSkin,posX,horizon);
  }
  
  void loadPacman(){
    // Character standing facing right
    if((frameCount/5)%2==0 && direction == 1){
      playerSkin = pacmanSkins[1];
    }
    
    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1){
      playerSkin = pacmanSkins[2];
    }
    
    // Characater standing facing left
    if((frameCount/5)%2==0 && direction == -1){
      playerSkin = pacmanSkins[3];
    }
    
    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1){
      playerSkin = pacmanSkins[4];
    }
    image(playerSkin,posX,horizon);
  }
  
  float getPlayerX(){return posX;}
  
  float getPlayerY(){return horizon;}
}