class Enemy extends CharacterObject {

  int numOfSkins, enemyIndex;
  float x0, y0, y0_speed;

  Enemy() {
    super();
    numOfSkins = 5;
    enemyIndex = (int)random(1, 4);
    x0 = random(width);
    y0 = 0;
    y0_speed = 10;
  }

  void moveEnemy() {
    if (y0 > horizon+40) {
      y0 = -30;
      x0 = random(width); 
      y0_speed = 10 + speedMultiplier; 
      enemyIndex  = (int)random(1, 4);
    }
    //Move the ball
    y0 += y0_speed;
  } 
  // Drawing all the Mario Enemies
  void loadMarioEnemy() {
    imageMode(CENTER);
    image(marioEnemies[enemyIndex], x0, y0, marioEnemies[enemyIndex].width/4, marioEnemies[enemyIndex].height/4);
  }
  // Drawing all the Mario Enemies
  void loadSonicEnemy() {
    imageMode(CENTER);
    image(sonicEnemies[enemyIndex], x0, y0, sonicEnemies[enemyIndex].width/2, sonicEnemies[enemyIndex].height/2);
  }
  // Drawing all the Mario Enemies
  void loadPacmanEnemy() {
    imageMode(CENTER);
    image(pacmanEnemies[enemyIndex], x0, y0, pacmanEnemies[enemyIndex].width/2, pacmanEnemies[enemyIndex].height/2);
  }
  // Returning the X co-ordinates of the Enemy
  float getEnemyX() {
    return x0;
  }
  // Returning the X co-ordinates of the Enemy
  float getEnemyY() {
    return y0;
  }
}