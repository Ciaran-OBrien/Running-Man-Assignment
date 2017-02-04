class Menu {

  int textBuffer = 15;
  boolean paused;
  //float[] textMutiples = new textMultiples;
  //float marioTextMultiple = 6/10,sonicTextMultiple = 7/10,pacmanTextMultiple = 8/10;
  Menu() {

    paused = false;
  }

  void load() {
    textAlign(CENTER);
    textSize(38);
    text("Please select your character", width/2, height/2);
    text("Mario", width/2, height*6/10);
    text("sonic", width/2, height*7/10);
    text("Pacman", width/2, height*8/10);
  }

  void textBorders() {
    noFill();
    rectMode(CENTER);
    strokeWeight(10);
    rect(width/2, height*6/10-textBuffer, 200, 70);
    rect(width/2, height*7/10-textBuffer, 200, 70);
    rect(width/2, height*8/10-textBuffer, 200, 70);
  }

  void pause() {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("PAUSE", width*9/10, height*1/10);
  }

  void exitBtn() {
    println("Showing exit button");
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("EXIT", width*5/10, height*8/10);
    noFill();
    rectMode(CENTER);
    rect(width*5/10, height*8/10, 200, 50);
  }

  void instructions() {
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("INSTRUCTIONS", width*1/10, height*1/10);
  }

  boolean detection() {
    if (paused//Detection of exit button
      && mouseY < height*8/10 + 25
      && mouseY > height*8/10 - 45
      && mouseX < width*5/10 + 100
      && mouseX > width*5/10 - 100
      ) {
      println("Exit pressed !");
      characterRunning = false;
      menu = true;
      paused = false;
      loop();
    }

    // Detection of the instruction button
    if (mouseY < height*1/10 + 25
      && mouseY > height*1/10 - 25
      && mouseX < width*1/10 + 100
      && mouseX > width*1/10 - 100
      ) {
      if (looping) { 
        instructions.render();
        play.pause();
        noLoop();
      } else {
        loop();
      }
    } 
    // Detection of the pause button
    if (mouseY < height*1/10 + 25
      && mouseY > height*1/10 - 25
      && mouseX < width*9/10 + 100
      && mouseX > width*9/10 - 100
      ) {
      if (looping) { 
        play.pause();
        paused = true;
        startMenu.exitBtn();

        noLoop();
      } else {
        loop();
      }
    }

    if (!characterRunning
      && mouseY < (height*6/10 + 35)  
      && mouseY > (height*6/10 - 35) 
      && mouseX < width/2 + 100 
      && mouseX > width/2 - 100) {
      userChoice = "mario";

      return true;
    }
    if (!characterRunning
      && mouseY < (height*7/10 + 35)  
      && mouseY > (height*7/10 - 35) 
      && mouseX < width/2 + 100 
      && mouseX > width/2 - 100) {
      userChoice = "sonic";
      return true;
    }
    if (!characterRunning
      && mouseY < (height*8/10 + 35)  
      && mouseY > (height*8/10 - 35) 
      && mouseX < width/2 + 100 
      && mouseX > width/2 - 100) {

      userChoice = "pacman";
      return true;
    }
    return false;
  }
}