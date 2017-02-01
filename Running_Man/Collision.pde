class Collision{
  
  int enemyYBorder = 30,enemyXBorder = 20, characterXBorder = 20, characterBorder = 70;
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
    enemyY = posY - speedMultiplier;
  }
  
  void marioCollision(){
    line(enemyX,enemyY,enemyX,enemyY+enemyYBorder);
    line(enemyX,enemyY+enemyYBorder,enemyX+enemyXBorder,enemyY+enemyYBorder); // Line to the right
    line(enemyX,enemyY+enemyYBorder,enemyX-enemyXBorder,enemyY+enemyYBorder); // Line to the left
    // Chacter test lines
    line(characterX,characterY,characterX,characterY-characterBorder);  
    line(characterX,characterY-characterBorder,characterX+characterXBorder,characterY-characterBorder); // Line to the right
    line(characterX,characterY-characterBorder,characterX-characterXBorder,characterY-characterBorder); // Line to the left
    if (enemyY + enemyYBorder >= characterY - characterBorder &&// Y line border
        enemyX + enemyXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
        enemyX - enemyXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
        ){
          //Save the score when a hit collision has been registered
          score.writeScore();
          background(backgrounds[3]);
          noLoop();
        } // end of nested if
  }
  void sonicCollision(){
  
  }
  
  void pacmanCollision(){
  }
  
  



}