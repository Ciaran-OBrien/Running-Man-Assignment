class Instructions {

  void render() {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("INSTRUCTIONS", width*5/10, height*1/10);
    textSize(45);    
    // Instructions explaining controls, powerups and scoring systems
    text("Welcome to the Running Man\n\n\n" + 
      "Move: Touch the screen to change directions\n\n" +
      "Avoid the relavent enemies\n\n" +
      "Ain for the relavent bonuses\n\n" + 
      "P = Pause      M = Mute      I = Instructions (Show/Hide)", 
      width * 5/10, height * 3/10);    

  }
}