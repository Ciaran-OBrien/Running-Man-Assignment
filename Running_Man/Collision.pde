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
    if (enemyY + enemyYBorder >= characterY - characterBorder &&// Y line border
      enemyX + enemyXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
      enemyX - enemyXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
      ) {
      //Save the score when a hit collision has been registered
      gameOver = true;
      score.appendTextToFile("out.csv", score.getScore(), userChoice);
      background.loadEndGameBg();
      play.dead();
      startMenu.exitBtn();
      userChoice = " ";
      characterRunning = false;
      menu = false;    
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

  boolean bonusHit() {
    if (bonusHit) {
      if (count == 3) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}