class Background{
  
  int numOfBackgrounds = 3;
  //PImage[] backgrounds;
  
  Background(){
    //backgrounds = new PImage[numOfBackgrounds];
    //for (int i=1; i<numOfBackgrounds; i++){
    //  // Load all the backgrounds images to the game
    //  backgrounds[i] = loadImage("images/backgrounds/bg" + i + ".png");     
    //}

  }
  
  // When called, sets background to Mario's background
  void loadMarioBg(){
    background(backgrounds[1]);    
  }
  // When called, sets background to Sonic's background  
  void loadSonicBg(){
    background(backgrounds[2]);
  }
  
  void loadPacmanBg(){
  }
  
  void loadEndGameBg(){
  }




}