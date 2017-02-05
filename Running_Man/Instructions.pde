class Instructions {

  void render() {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("INSTRUCTIONS", width*0.5, height*0.1);
    textSize(45);    
    // Instructions explaining controls, powerups and scoring systems
    text("Welcome to the Running Man\n\n\n" + 
      "Move: Touch the screen to change directions\n\n" +
      "Avoid the relavent enemies\n\n", 
      width * 0.5, height * 0.3);  
    marioEnemies[1].resize(100, 100);
    image(marioEnemies[1], width*0.4, height*0.47);
    marioEnemies[1].resize(400, 400);
    sonicEnemies[1].resize(100, 100);
    image(sonicEnemies[1], width*0.5, height*0.47);
    sonicEnemies[1].resize(400, 400);
    pacmanEnemies[1].resize(100, 100);
    image(pacmanEnemies[1], width*0.6, height*0.47);
    pacmanEnemies[1].resize(400, 400);
    text("Ain for the relavent bonuses\n\n", width*0.5, height*0.65);
    marioBonus[1].resize(100, 100);
    image(marioBonus[1], width*0.4, height*0.7);
    marioBonus[1].resize(400, 400);
    sonicBonus[1].resize(100, 100);
    image(sonicBonus[1], width*0.5, height*0.7);
    sonicBonus[1].resize(400, 400);
    pacmanBonus[1].resize(100, 100);
    image(pacmanBonus[1], width*0.6, height*0.7);
    pacmanBonus[1].resize(400, 400);
  }
}