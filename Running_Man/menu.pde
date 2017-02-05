class Menu {

  int textBuffer = 15,fill;
  boolean paused;
  String[] buttons = {"EXIT", "||", "INSTRUCTION"};
  String[] userMenu = {"Please select your character", "Mario", "Sonic", "Pacman"};

  //float[] textMutiples = new textMultiples;
  //float marioTextMultiple = 6/10,sonicTextMultiple = 7/10,pacmanTextMultiple = 8/10;
  Menu() {
    paused = false;
    fill = 255;
  }

  void load() {
    textAlign(CENTER);
    textSize(38);
    text(userMenu[0], width/2, height/2);
    text(userMenu[1], width/2, height*6/10);
    text(userMenu[2], width/2, height*7/10);
    text(userMenu[3], width/2, height*8/10);
    text(buttons[2], width*1/10, height*1/10);
  }

  void pause() {
    fill(fill);
    textSize(50);
    textAlign(CENTER);
    text(buttons[1], width*9/10, height*1/10);
    noFill();
  }

  void exitBtn() {
    //println("Showing exit button");
    fill(fill);
    textSize(50);
    textAlign(CENTER);
    text(buttons[0], width*5/10, height*5/10);
    noFill();
    plays = false;
  }

  void instructions() {
    fill(fill);
    textSize(40);
    textAlign(CENTER);
    text(buttons[2], width*1/10, height*1/10);
    noFill();
  }

  boolean detection() {
    if (paused//Detection of exit button 
      && mouseY < height*5/10 + 2*textAscent() // Un hard code thiis lots of work
      && mouseY > height*5/10 - 2*textAscent()
      && mouseX < width*5/10 + textWidth(buttons[0])
      && mouseX > width*5/10 - textWidth(buttons[0])
      ) {
      //println("Exit pressed !");
      characterRunning = false;
      paused = false;
      menu = true;
      loop();
    }

    // Detection of the instruction button
    if (mouseY < height*1/10 + 2*textAscent()
      && mouseY > height*1/10 - 2*textAscent()
      && mouseX < width*1/10 + textWidth(buttons[2])
      && mouseX > width*1/10 - textWidth(buttons[2])
      ) {
      if (looping) { 
        play.pause();
        menu = false;
        instructions.render();
        noLoop();
      } else {
        menu = true;
        loop();
      }
    } 
    // Detection of the pause button
    if (mouseY < height*1/10 + 2*textAscent()
      && mouseY > height*1/10 - 2*textAscent()
      && mouseX < width*9/10 + textWidth(buttons[1])
      && mouseX > width*9/10 - textWidth(buttons[1])
      ) {
      if (looping) { 
        paused = true;

        play.pause();

        startMenu.exitBtn();

        noLoop();
      } else {
        //play = false;
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