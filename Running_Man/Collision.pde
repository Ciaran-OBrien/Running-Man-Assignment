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
    //line(enemyX, enemyY, enemyX, enemyY+marioEnemies[1].width/6);
    //line(enemyX, enemyY+marioEnemies[1].width/6, enemyX+marioEnemies[1].height/6, enemyY+marioEnemies[1].width/6); // Line to the right
    //line(enemyX, enemyY+marioEnemies[1].width/6, enemyX-marioEnemies[1].height/6, enemyY+marioEnemies[1].width/6); // Line to the left
    //// Chacter test lines
    //line(characterX, characterY, characterX, characterY-marioEnemies[1].width/5);  
    //line(characterX, characterY-marioEnemies[1].width/5, characterX+marioEnemies[1].height/5, characterY-marioEnemies[1].width/5); // Line to the right
    //line(characterX, characterY-marioEnemies[1].width/5, characterX-marioEnemies[1].height/5, characterY-marioEnemies[1].width/5); // Line to the left
    //// Bous test lines
    //line(bonusX, bonusY, bonusX, bonusY+bonusYBorder);
    //line(bonusX, bonusY+marioEnemies[1].width/5, bonusX+marioEnemies[1].height/5, bonusY+marioEnemies[1].width/5); // Line to the right
    //line(bonusX, bonusY+marioEnemies[1].width/5, bonusX-marioEnemies[1].height/5, bonusY+marioEnemies[1].width/5); // Line to the left

    if (enemyY + enemyYBorder >= characterY - characterBorder &&// Y line border
      enemyX + enemyXBorder >= characterX - characterXBorder && //Brigth enemy and Tleft char
      enemyX - enemyXBorder <= characterX + characterXBorder //BLeft enemy and Tright char
      ) {
      //Save the score when a hit collision has been registered
      gameOver = true;
      //background.loadEndGameBg();
      //score.writeScore();
      score.appendTextToFile("out.csv",score.getScore(),userChoice);
      play.dead();
      println("PLaying end game sound");
      
      background.loadEndGameBg();
      println("Loading gameGrund");
      score.myDelay(3000);
      score.showScore();
      userChoice = " ";
      //gameOver = false;
      characterRunning = false;
      //highScores.displayUserName();

      menu = true;
      noLoop();
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
      if (count == 3) {
        //println("Bonus count = 1");
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}