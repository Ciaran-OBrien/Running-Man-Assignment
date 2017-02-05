class Sounds {

  // Method with the relevant theme souds
  void theme() {
    if (userChoice == "mario") { 
      marioThemeMus.play();
    } else if (userChoice == "sonic") { 
      sonicThemeMus.play();
    } else if (userChoice == "pacman") {
      pacmanThemeMus.play();
    }
  }

 // Method with the relevant bonus sounds
  void bonus() {
    // Extra logic to insure the sound only plays once
    if (userChoice == "mario" && detect.bonusHit()) {
      marioThemeMus.pause();
      // Rewind the Bonus sound for each character
      // Necessary to rewind the sound for the next time the sound is played
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

  // Method with the relevant death sounds
  void dead() {
    if (userChoice == "mario") {
      marioThemeMus.pause();
      // Same as above, rewind the sound for the next time it's played
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

  // Ensuring all sounds are paused
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