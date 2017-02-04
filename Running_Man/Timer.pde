class Timer {
  int t, interval, score, timer, start, ms;
  String time;
  int localBonus;
  int startTime = millis();
  int currentTime = 0;
  // currentTime = millis - startTime; // getTime
  // currentTime = 0; // resetTime
  // startTime = millis(); // resetTime

  Timer() {

    time = "000";
    localBonus = 0;
    ms = 3000;
    //t = interval;
  }

  //void display() {
  //  interval = 0;
  //  t = interval + int(millis()/1000);
  //  println("T = " + t);
  //  if (detect.bonusHit()) {
  //    t+= localBonus;
  //    println("Post = " + t);
  //  }

  //  time = nf(t, 3);    
  //  textSize(32);
  //  text("Your score: " + time, width*9/13, height*1/8);
  //}
  void update() {
    
    currentTime = int(millis()/1000) - startTime;
  }
  void setTime() {

    currentTime = 0; // resetTime
    localBonus = 0;
    startTime = int(millis()/1000); // resetTime
    //println("StartTime = " + startTime);
    //println("Curent Time = " + currentTime);
  }



  void setBonus() {
    if (detect.bonusHit()) {
      localBonus += 10;
    }
  }


  void display() {

    //println("currentTime" + currentTime);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    t = localBonus + currentTime;
    text("Your score: " + t, width*9/13, height*1/10);
  }

  void myDelay() {
    timer = millis();
    while (millis() - timer < ms);
  }

  void createTable() {
    // Create a new table to contain the high scores
    highScore = new Table();
    highScore.clearRows();
    highScore.addColumn("Scores");
  }

  void writeScore() {
    println("Score saved");
    TableRow value = highScore.addRow();
    value.setInt("Scores", t);
    saveTable(highScore, "data/highScores.csv");
  }
}