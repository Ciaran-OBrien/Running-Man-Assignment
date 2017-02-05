class Bonus extends CharacterObject {

  int numOfSkins, bonusIndex, bonusValue;
  float x0, y0, y0_speed;

  Bonus() {
    super();
    numOfSkins = 5;
    bonusIndex = (int)random(1, 4);
    x0 = 200;
    y0 = 0;
    y0_speed = random(3, 8);
    bonusValue = 10;
  }

  void moveBonus() {
    if (y0 > horizon+40) {
      y0 = -30;
      x0 = random(width); 
      y0_speed = 10 + speedMultiplier;//random(3,7); 
      bonusIndex  = (int)random(1, 4);
    }


    //Move the ball
    y0 += y0_speed;
  } 

  void loadMarioBonus() {
    imageMode(CENTER);
    image(marioBonus[bonusIndex], x0, y0, marioBonus[bonusIndex].width/4, marioBonus[bonusIndex].height/4);
  }

  void loadSonicBonus() {

    imageMode(CENTER);
    image(sonicBonus[bonusIndex], x0, y0,sonicBonus[bonusIndex].width/2, sonicBonus[bonusIndex].height/2);
  }

  void loadPacmanBonus() {
    imageMode(CENTER);
    image(pacmanBonus[bonusIndex], x0, y0, pacmanBonus[bonusIndex].width/4, pacmanBonus[bonusIndex].height/4);
  }

  int getBonusIndex(){
    return bonusIndex;
  }
  float getBonusX() {
    return x0;
  }

  float getBonusY() {
    return y0;
  }
}