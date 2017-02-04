class Timer {
  int t, interval, score,timer,start;
  String time;
  int localBonus;
  Timer() {
    start = int(millis()/1000);
    time = "000";
    localBonus = 0;
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
  void setTime(){
    
   t = start;
   interval = 0;
   }

  void setBonus() {
    if (detect.bonusHit()) {
      localBonus += 10;
    }
  }
  void display() {
    fill(255);
    textSize(32);
    textAlign(CENTER);
    t = interval + localBonus + int(millis()/1000);
    text("Your score: " + t, width*9/13, height*1/10);
  }

  void myDelay(int ms) {
    timer = millis();
    while (millis()-timer < ms);
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