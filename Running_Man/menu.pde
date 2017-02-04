class Menu {

  int textBuffer = 15;
  boolean paused;
  String[] buttons = {"EXIT", "PAUSE", "PLAY", "INSTRUCTION"};
  String[] userMenu = {"Please select your character", "Mario", "Sonic", "Pacman"};

  //float[] textMutiples = new textMultiples;
  //float marioTextMultiple = 6/10,sonicTextMultiple = 7/10,pacmanTextMultiple = 8/10;
  Menu() {
    paused = false;
  }

  void load() {
    textAlign(CENTER);
    textSize(38);
    text(userMenu[0], width/2, height/2);
    text(userMenu[1], width/2, height*6/10);
    text(userMenu[2], width/2, height*7/10);
    text(userMenu[3], width/2, height*8/10);
  }

  void textBorders() {
    noFill();
    rectMode(CENTER);
    rect(width/2, height*6/10, textWidth(userMenu[1]), 2*textAscent());
    rect(width/2, height*7/10, textWidth(userMenu[2]), 2*textAscent());
    rect(width/2, height*8/10, textWidth(userMenu[3]), 2*textAscent());
    //strokeWeight(10);
    //rect(width/2, height*6/10-textBuffer, 200, 70);
    //rect(width/2, height*7/10-textBuffer, 200, 70);
    //rect(width/2, height*8/10-textBuffer, 200, 70);
  }

  void pause() {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    if (!paused) {
      text(buttons[1], width*9/10, height*1/10);
    } else {
      text(buttons[2], width*9/10, height*1/10);
    }
    noFill();
    rectMode(CENTER);
    rect(width*9/10, height*1/10, textWidth(buttons[1]), 2*textAscent());
  }

  void exitBtn() {
    println("Showing exit button");
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text(buttons[0], width*5/10, height*5/10);
    noFill();
    rectMode(CENTER);
    rect(width*5/10, height*5/10, textWidth(buttons[0]), 2*textAscent());
  }

  void instructions() {
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text(buttons[3], width*1/10, height*1/10);
    noFill();
    rectMode(CENTER);
    rect(width*1/10, height*1/10, textWidth(buttons[3]), 2*textAscent());
  }

  boolean detection() {
    if (paused//Detection of exit button 
      && mouseY < height*5/10 + 2*textAscent() // Un hard code thiis lots of work
      && mouseY > height*5/10 - 2*textAscent()
      && mouseX < width*5/10 + 100
      && mouseX > width*5/10 - 100
      ) {
      println("Exit pressed !");
      characterRunning = false;
      paused = false;
      menu = true;
      loop();
    }

    // Detection of the instruction button
    if (mouseY < height*1/10 + 2*textAscent()
      && mouseY > height*1/10 - 2*textAscent()
      && mouseX < width*1/10 + 100
      && mouseX > width*1/10 - 100
      ) {
      if (looping) { 
        instructions.render();
        noLoop();
      } else {
        loop();
      }
    } 
    // Detection of the pause button
    if (mouseY < height*1/10 + 2*textAscent()
      && mouseY > height*1/10 - 2*textAscent()
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
      && mouseY < (height*6/10 + 2*textAscent())  
      && mouseY > (height*6/10 - 2*textAscent()) 
      && mouseX < width/2 + textWidth(userMenu[1]) 
      && mouseX > width/2 - textWidth(userMenu[1])) {
      userChoice = "mario";

      return true;
    }
    if (!characterRunning
      && mouseY < (height*7/10 + 2*textAscent())  
      && mouseY > (height*7/10 - 2*textAscent()) 
      && mouseX < width/2 + textWidth(userMenu[2]) 
      && mouseX > width/2 - textWidth(userMenu[2])) {
      userChoice = "sonic";
      return true;
    }
    if (!characterRunning
      && mouseY < (height*8/10 + 2*textAscent())  
      && mouseY > (height*8/10 - 2*textAscent()) 
      && mouseX < width/2 + textWidth(userMenu[3])
      && mouseX > width/2 - textWidth(userMenu[3])) {

      userChoice = "pacman";
      return true;
    }
    return false;
  }
}