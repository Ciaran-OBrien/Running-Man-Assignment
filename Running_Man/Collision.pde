class Collision{
  
  int enemyYBorder = 50,enemyXBorder = 25, characterXBorder = 20, characterBorder = 70;
  float enemyY,enemyX,characterX,characterY;
  
  Collision(){
  
  }
  
  void setCharacterX(float posX){
    characterX = posX;
  }
  
  void setCharacterY(float posY){
    characterY = posY;
  }
  
  void setEnemyX(float posX){
    enemyX = posX; 
  }
   
  void setEnemyY(float posY){
    enemyY = posY;
  }
  
  void marioCollision(){
    line(enemyX,enemyY,enemyX,enemyY+enemyYBorder);
    line(enemyX,enemyY+enemyYBorder,enemyX+enemyXBorder,enemyY+enemyYBorder); // Line to the right
    line(enemyX,enemyY+enemyYBorder,enemyX-enemyXBorder,enemyY+enemyYBorder); // Line to the left
    // Chacter test lines
    line(characterX,characterY,characterX,characterY-characterBorder);  
    line(characterX,characterY-characterBorder,characterX+characterXBorder,characterY-characterBorder); // Line to the right
    line(characterX,characterY-characterBorder,characterX-characterXBorder,characterY-characterBorder); // Line to the left

  }
  void sonicCollision(){
  
  }
  
  void pacmanCollision(){
  }
  
  



}