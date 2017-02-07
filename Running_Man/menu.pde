class Menu {
  // Menu variables
  int textBuffer = 15, fill;
  boolean paused;
  // Array of each separate 'wipe' line
  float wipe[] = {0, -250, -500};
  float s=10; //length of line
  float x, y; //start of line
  // String of buttons names
  String[] buttons = {"EXIT", "||", "INSTRUCTION", "PLAY AGAIN", "YES", "NO"};
  // String of text for the main menu
  String[] userMenu = {"Please select your character", "Mario", "Sonic", "Pacman"};

  int a=2000; //sketch size

  int j = 0; //first "wipe"
  int k = -250; //second "wipe"
  int l = -500; // Third "wipe"
  
  Menu() {
    paused = false;
    fill = 255;
  }

  // The background of the main menu
  // Random strokes and lines falling down the screen
  void backgroundFuzz() {
    strokeWeight(10);
    for (int i=0; i<=0.5*width; i+=50) {
      stroke(random(0, 255));
      x = random(0, width);
      y = random(0, width);
      line(x, y, x+random(0, s), y);
    }

    stroke(100, 100);
    line(0, wipe[0], width, wipe[0]);
    wipe[0]+=2;
    if (wipe[0]>width/2) {
      wipe[0]=0;
    }
    line(0, wipe[1], width, wipe[1]);
    wipe[1]+=4;
    if (k>width/4) {
      wipe[1]=0;
    }
    line(0, wipe[2], width, wipe[2]);
    wipe[2]+=4;
    if (l>width/8) {
      wipe[2]=0;
    }
  }

  // Main menu text method
  void load() {
    textAlign(CENTER);
    textSize(38);
    text(userMenu[0], width/2, height/2);
    text(userMenu[1], width/2, height*6/10);
    text(userMenu[2], width/2, height*7/10);
    text(userMenu[3], width/2, height*8/10);
    text(buttons[2], width*1/10, height*1/10);
  }

  // Pause text method
  void pause() {
    fill(fill);
    textSize(50);
    textAlign(CENTER);
    text(buttons[1], width*9/10, height*1/10);
  }

  // Exit text method
  void exitBtn() {
    fill(fill);
    textSize(50);
    textAlign(CENTER);
    text(buttons[0], width*5/10, height*5/10);
    plays = false;
  }

  // Instructions text method
  void instructions() {
    fill(fill);
    textSize(40);
    textAlign(CENTER);
    text(buttons[2], width*1/10, height*1/10);
  }

  void play() {
    fill(fill);
    textSize(40);
    textAlign(CENTER);
    text(buttons[3], width*0.5, height*0.8);
    text(buttons[4], width*0.3, height*0.9);
    text(buttons[5], width*0.7, height*0.9);
  }

  // Method that checks the mouse's X & Y positions over the 'buttons'
  // Calleed from main class, mouseClicked()
  boolean detection() {
    // Play again buttons
    // Yes Button
    if (mouseY < height*9/10 + 2*textAscent()
      && mouseY > height*9/10 - 2*textAscent()
      && mouseX < width*3/10 + textWidth(buttons[4])
      && mouseX > width*3/10 - textWidth(buttons[4])) {
      if (gameOver) {
        menu = true;
        gameOver = false;
      }
    }
    // Play again buttons
    // No Button
    if (mouseY < height*9/10 + 2*textAscent()
      && mouseY > height*9/10 - 2*textAscent()
      && mouseX < width*7/10 + textWidth(buttons[4])
      && mouseX > width*7/10 - textWidth(buttons[4])) {
      if (gameOver) {
        exit();
        gameOver = false;
      }
    }
    // Dectection of the exit button
    if (mouseY < height*5/10 + 2*textAscent()
      && mouseY > height*5/10 - 2*textAscent()
      && mouseX < width*5/10 + textWidth(buttons[0])
      && mouseX > width*5/10 - textWidth(buttons[0])) {
      //when the game is finshed
      if (gameOver) {
        score.showScore();
        play();
        loop();
      }
      // Game is still running, just paused for a moment
      if (paused) {
        {
          // Insuring the screen in only displaying what is needed
          userChoice = " ";
          characterRunning = false;
          paused = false;
          menu = true;
          loop(); // Sketch would've stopped looping from the pause detection
        }
      }
    }

    // Detection of the instruction button

    if ( mouseY < height*1/10 + 2*textAscent()
      && mouseY > height*1/10 - 2*textAscent()
      && mouseX < width*1/10 + textWidth(buttons[2])
      && mouseX > width*1/10 - textWidth(buttons[2])
      ) {
      showInstructions = false;
      if (characterRunning) {
        // Instruction button also works as a pause button when the game is running
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
      // Extra logic to show/hide instructions/menu out of the game
      else if (!characterRunning) {
        background(0);
        if (!showInstructions) {
          menu = false;
          showInstructions = true;
          instructions();
          loop();
        } else {
          loop();
          showInstructions = false;
          menu = true;
        }
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
        // The user may only exit the game from the pause button
        startMenu.exitBtn();
        noLoop();
      } else {
        loop();
      }
    }

    // All the following checks can only proceed when the game is not active
    // Insuring that the game doesn't switch levels mid game
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
  }// End of Dectection
} // End of Menu class