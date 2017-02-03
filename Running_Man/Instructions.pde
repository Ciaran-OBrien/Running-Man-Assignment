class Instructions {

  void render() {
    fill(255);
    textFont(text);
    textAlign(CENTER);
    textSize(40);
    text("INSTRUCTIONS", width * 0.5f, height * 0.1f);
    textSize(25);    
    // Instructions explaining controls, powerups and scoring systems
    text("Welcome to the Running Man\n" + 
      "Move: Touch the screen to change directions" +
      "Avoid the relavent enemies\n" + " \n" +
      "Ain for the relavent bonuses\n" + 
      "P = Pause      M = Mute      I = Instructions (Show/Hide)", 
      width * 0.05f, height * 0.2f, width * 0.9f, height * 0.7f);
  }
}