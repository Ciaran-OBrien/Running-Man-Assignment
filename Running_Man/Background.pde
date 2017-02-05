class Background {

  int numOfBackgrounds = 3;

  // When called, sets background to Mario's background
  void loadMarioBg() {
    background(backgrounds[1]);
  }
  // When called, sets background to Sonic's background  
  void loadSonicBg() {
    background(backgrounds[2]);
  }
  // When called, sets background to Pacman's background  
  void loadPacmanBg() {
    background(backgrounds[4]);
  }

  void loadEndGameBg() {
    if (gameOver) {
      //background(100);
      background(backgrounds[3]);
    }
  }
}