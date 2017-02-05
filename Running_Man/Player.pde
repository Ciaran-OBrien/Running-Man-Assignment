class Player extends CharacterObject {
  int numOfSkins = 5, speed = 10;
  float posX, direction = 1;

  Player() {
    super();
  }

  void setPosx(float x) {
    posX = x;
  }
  // Moving the character based on the direction
  void movePlayer() {
    posX=posX+speed*direction;
    if (posX > width) {
      posX = 0;
    }
    if (posX < 0) {
      posX = width;
    }
  }
  // Increasing the player's speed
  void setPlayerSpeed(int s) {
    speed = s;
  }
  // Returning the direction of the character
  float getDirection() {
    return direction;
  }
  // Returning the speed of the character
  float getSpeed() {
    return speed;
  }
  // Changing the direction of the character
  void setDirection(float newDirection) {
    direction = newDirection;
  }
  // Setting the image of the character based on the frameCount and direction
  void loadMario() {
    // Character standing facing right
    if ((frameCount/5)%2==0 && direction == 1) {
      playerSkin = marioSkins[1];
    }
    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1) {
      playerSkin = marioSkins[2];
    }
    // Characater standing facing left
    if ((frameCount/5)%2==0 && direction == -1) {
      playerSkin = marioSkins[3];
    }
    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1) {
      playerSkin = marioSkins[4];
    }
    // Drawing the image of the character based on above
    image(playerSkin, posX, horizon);
  } 
  // Setting the image of the character based on the frameCount and direction  
  void loadSonic() {
    // Character standing facing right
    if ((frameCount/5)%2==0 && direction == 1) {
      playerSkin = sonicSkins[1];
    }

    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1) {
      playerSkin = sonicSkins[2];
    }

    // Characater standing facing left
    if ((frameCount/5)%2==0 && direction == -1) {
      playerSkin = sonicSkins[3];
    }

    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1) {
      playerSkin = sonicSkins[4];
    }
    // Drawing the image of the character based on above
    image(playerSkin, posX, horizon);
  }
  // Setting the image of the character based on the frameCount and direction  
  void loadPacman() {
    // Character standing facing right
    if ((frameCount/5)%2==0 && direction == 1) {
      playerSkin = pacmanSkins[1];
    }

    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1) {
      playerSkin = pacmanSkins[2];
    }

    // Characater standing facing left
    if ((frameCount/5)%2==0 && direction == -1) {
      playerSkin = pacmanSkins[3];
    }

    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1) {
      playerSkin = pacmanSkins[4];
    }
    // Drawing the image of the character based on above
    image(playerSkin, posX, horizon);
  }
  // Returning the X co-ordinates of the Player
  float getPlayerX() {
    return posX;
  }
  // Returning the X co-ordinates of the Player
  float getPlayerY() {
    return horizon;
  }
}