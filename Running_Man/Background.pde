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
  
  void setBg(){
    if (userChoice == "mario"){
      //loadMarioBg();
    }
  }
  
  void loadMarioBg(){
    image(backgrounds[1],width/2,height/2,1000,1000);
  }
  
  void loadSonicBg(){
  }
  
  void loadPacmanBg(){
  }
  
  void loadEndGameBg(){
  }




}