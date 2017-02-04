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
      if (!marioBonusMus.isPlaying()) {
        marioThemeMus.play();
      }
    } else if (userChoice == "sonic") {
      sonicThemeMus.pause();
      sonicBonusMus.play();
      if (!sonicBonusMus.isPlaying()) {
        sonicThemeMus.play();
      }
    } else if (userChoice == "pacman") {
      pacmanThemeMus.pause();
      pacmanBonusMus.play();
      if (!pacmanBonusMus.isPlaying()) {
        pacmanThemeMus.play();
      }
    }
  }

  void dead() {
    if (userChoice == "mario") {
    } else if (userChoice == "sonic") {
    } else if (userChoice == "pacman") {
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