class Collision{
  
  int enemyXBorder,bonusXBorder = 30, enemyYBorder,bonusYBorder = 20, characterXBorder = 20, characterBorder = 70;
  float enemyY,enemyX,characterX,characterY,bonusX,bonusY;
  
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
  
  void setBonusX(float posX){
    bonusX = posX;
  }
  
  void setBonusY(float posY){
    bonusY = posY;
  }
  
  void marioCollision(){
    line(enemyX,enemyY,enemyX,enemyY+enemyYBorder);
    line(enemyX,enemyY+enemyYBorder,enemyX+enemyXBorder,enemyY+enemyYBorder); // Line to the right
    line(enemyX,enemyY+enemyYBorder,enemyX-enemyXBorder,enemyY+enemyYBorder); // Line to the left
    // Chacter test lines
    line(characterX,characterY,characterX,characterY-characterBorder);  
    line(characterX,characterY-characterBorder,characterX+characterXBorder,characterY-characterBorder); // Line to the right
    line(characterX,characterY-characterBorder,characterX-characterXBorder,characterY-characterBorder); // Line to the left
    // Bous test lines
    line(bonusX,bonusY,bonusX,bonusY+bonusYBorder);
    line(bonusX,bonusY+bonusYBorder,bonusX+bonusXBorder,bonusY+bonusYBorder); // Line to the right
    line(bonusX,bonusY+bonusYBorder,bonusX-bonusXBorder,bonusY+bonusYBorder); // Line to the left
    
    if (enemyY + enemyYBorder >= characterY - characterBorder &&// Y line border
        enemyX + enemyXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
        enemyX - enemyXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
        ){
          //Save the score when a hit collision has been registered
          score.writeScore();
          background(backgrounds[3]);
          noLoop();
        } // end of nested enemy/character if
        
    if(bonusY + bonusYBorder >= characterY - characterBorder &&// Y line border
        bonusX + bonusXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
        bonusX - bonusXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
        ){
          println("Bonus hit");
          noLoop();
        } // end of nested if
  }
  void sonicCollision(){
  
  }
  
  void pacmanCollision(){
  }
  
  



}