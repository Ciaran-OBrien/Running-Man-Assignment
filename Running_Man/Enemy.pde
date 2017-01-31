class Enemy extends CharacterObject{

  int numOfSkins = 5, horizon = 800;
  int enemyIndex = (int)random(1,3);
  float x0 = 200,y0 = 0,y0_speed=20;
  
  
  
  //PImage[] marioEnemies;

  Enemy(){
    super();
    //marioEnemies = new PImage[numOfSkins];
    //for(int i = 1; i < numOfSkins;i++){
    //  marioEnemies[i] = loadImage("images/enemy/enemy" + i + ".png");
    //}
  }
  
  void moveEnemy(){
    if(y0 > horizon+40) {
      y0 = -30;
      x0 = random(width); 
      y0_speed = 7;//random(3,7); 
    }
    
    
    //Move the ball
    y0 += y0_speed; 
  } 
  
  void loadMarioEnemy(){
  imageMode(CENTER);
  image(marioEnemies[1],x0,y0,100,100);
  }
  
  void loadSonicEnemy(){
  }
  
  void loadPacmanEnemy(){
  }
  
  float getEnemyX(){return x0;}
  
  float getEnemyY(){return y0;}
  
}