class Timer {
  int t, interval, score, timer, start, ms, bonusCount;
  String time;
  int localBonus;
  int startTime = millis();
  int currentTime = 0;

  Timer() {
    time = "000";
    localBonus = 0;
    ms = 3000;
    bonusCount = 0;
  }

  void update() {
    currentTime = int(millis()/1000) - startTime;
  }

  void setTime() {
    currentTime = 0; // resetTime
    localBonus = 0;
    startTime = int(millis()/1000); // resetTime
  }

  int getScore() {
    return t;
  }

  void setBonus() {
    if (detect.bonusHit()) {
      localBonus += 10;
      bonusCount++;
    }
  }


  void display() {
    fill(255);
    textSize(32);
    textAlign(CENTER);
    t = localBonus + currentTime;
    text("Your score: " + t, width*9/13, height*1/10);
    if (t == 50 || t == 100 ) {
      speedMultiplier =+ 5;
    }
  }

  void myDelay() {
    timer = millis();
    while (millis() - timer < ms);
  }

  void createTable() {
    highScore.addColumn("Scores");
    highScore.addColumn("Level");
    highScore.addColumn("Bonuses");
  }

  void writeScore() {
    highScore.addRow();
    highScore.setInt(0, "Scores", t);
    highScore.setString(0, "Level", userChoice);
    highScore.setInt(0, "Bonuses", bonusCount);
    saveTable(highScore, "data/highScores.csv");
  }
}