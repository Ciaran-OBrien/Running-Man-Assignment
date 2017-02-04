class Sounds {

  Sounds() {
  }

  void theme() {
    if (userChoice == "mario") { 
      marioThemeMus.play();
    } else if (userChoice == "sonic") { 
      sonicThemeMus.play();
    } else if (userChoice == "pacman") {
      pacmanThemeMus.play();
    }
  }

  void bonus() {
    if (userChoice == "mario" && detect.bonusHit()) {
      marioThemeMus.pause();
      marioBonusMus.play();
      marioBonusMus.rewind();
    } else if (userChoice == "sonic" && detect.bonusHit()) {
      sonicThemeMus.pause();
      sonicBonusMus.play();
      sonicBonusMus.rewind();
    } else if (userChoice == "pacman" && detect.bonusHit()) {
      pacmanThemeMus.pause();
      pacmanBonusMus.play();
      pacmanBonusMus.rewind();
    }
  }

  void dead() {
    if (userChoice == "mario") {
      marioThemeMus.pause();
      marioThemeMus.rewind();
      marioDeathMus.play();
    } else if (userChoice == "sonic") {            
      sonicThemeMus.pause();
      sonicThemeMus.rewind();
      sonicDeathMus.play();
    } else if (userChoice == "pacman") {            
      pacmanThemeMus.pause();
      sonicThemeMus.rewind();
      pacmanDeathMus.play();
    }
  }

  void pause() {
    if (userChoice == "mario") {
      marioThemeMus.pause();
    } else if (userChoice == "sonic") {
      sonicThemeMus.pause();
    } else if (userChoice == "pacman") {
      pacmanThemeMus.pause();
    }
  }
}