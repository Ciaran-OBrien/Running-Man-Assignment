class Collision {

  int count = 0, enemyXBorder = 30, bonusXBorder = 30, enemyYBorder = 25, bonusYBorder = 25, characterXBorder = 20, characterBorder = 70;
  float enemyY, enemyX, characterX, characterY, bonusX, bonusY;


  Collision() {
    bonusHit = false;
  }

  void setCharacterX(float posX) {
    characterX = posX;
  }

  void setCharacterY(float posY) {
    characterY = posY;
  }

  void setEnemyX(float posX) {
    enemyX = posX;
  }

  void setEnemyY(float posY) {
    enemyY = posY - speedMultiplier;
  }

  void setBonusX(float posX) {
    bonusX = posX;
  }

  void setBonusY(float posY) {
    bonusY = posY;
  }

  void collision() {
    //line(enemyX, enemyY, enemyX, enemyY+enemyYBorder);
    //line(enemyX, enemyY+enemyYBorder, enemyX+enemyXBorder, enemyY+enemyYBorder); // Line to the right
    //line(enemyX, enemyY+enemyYBorder, enemyX-enemyXBorder, enemyY+enemyYBorder); // Line to the left
    //// Chacter test lines
    //line(characterX, characterY, characterX, characterY-characterBorder);  
    //line(characterX, characterY-characterBorder, characterX+characterXBorder, characterY-characterBorder); // Line to the right
    //line(characterX, characterY-characterBorder, characterX-characterXBorder, characterY-characterBorder); // Line to the left
    //// Bous test lines
    //line(bonusX, bonusY, bonusX, bonusY+bonusYBorder);
    //line(bonusX, bonusY+bonusYBorder, bonusX+bonusXBorder, bonusY+bonusYBorder); // Line to the right
    //line(bonusX, bonusY+bonusYBorder, bonusX-bonusXBorder, bonusY+bonusYBorder); // Line to the left

    if (enemyY + enemyYBorder >= characterY - characterBorder &&// Y line border
      enemyX + enemyXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
      enemyX - enemyXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
      ) {
      //Save the score when a hit collision has been registered
      gameOver = true;
      //background.loadEndGameBg();
      score.writeScore();
      play.dead();

      println("before noloop");
      noLoop();
      background.loadEndGameBg();
      println("after noloop, before delay");
      score.myDelay();
      println("after delay");
      userChoice = " ";
      gameOver = false;
      characterRunning = false;
      menu = true;

      loop();
    } // end of nested enemy/character if

    if (bonusY + bonusYBorder >= characterY - characterBorder &&// Y line border
      bonusX + bonusXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
      bonusX - bonusXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
      ) {
      bonusHit = true;
      count++;
      play.bonus();
    } // end of nested if

    else {
      count = 0;
      bonusHit = false;
    }
  }
  void sonicCollision() {
  }

  void pacmanCollision() {
  }

  boolean bonusHit() {
    if (bonusHit) {
      if (count == 1) {
        println("Bonus count = 1");
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}