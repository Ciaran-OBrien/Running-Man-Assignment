class Menu{

  int textBuffer = 15;
  //float[] textMutiples = new textMultiples;
  //float marioTextMultiple = 6/10,sonicTextMultiple = 7/10,pacmanTextMultiple = 8/10;
  Menu(){
  
  }
  
  void load(){
    textAlign(CENTER);
    textSize(38);
    text("Please select your character",width/2,height/2);
    text("Mario",width/2,height*6/10);
    text("sonic",width/2,height*7/10);
    text("Pacman",width/2,height*8/10);
  }
  
  void textBorders(){
    noFill();
    rectMode(CENTER);
    strokeWeight(10);
    rect(width/2,height*6/10-textBuffer,200,70);
    rect(width/2,height*7/10-textBuffer,200,70);
    rect(width/2,height*8/10-textBuffer,200,70);
  }
  
  boolean detection(){
    
      if(mouseY < (height*6/10 + 35)  
      && mouseY > (height*6/10 - 35) 
      && mouseX < width/2 + 100 
      && mouseX > width/2 - 100){
        userChoice = "mario";
        characterRunning = true;
        return true;
      }
      if(mouseY < (height*7/10 + 35)  
      && mouseY > (height*7/10 - 35) 
      && mouseX < width/2 + 100 
      && mouseX > width/2 - 100){
        userChoice = "sonic";
        return true;
      }
      if(mouseY < (height*8/10 + 35)  
      && mouseY > (height*8/10 - 35) 
      && mouseX < width/2 + 100 
      && mouseX > width/2 - 100){
        userChoice = "pacman";
        return true;
      }

    return false;
  }

  



}