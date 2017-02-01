class Timer{
  int t,interval;
  String time = "000";;
  Timer(){

  }
  
  void display(){
    interval = 0;
    t = interval + int(millis()/1000);
    time = nf(t,3);
    // Formating the string 'time' with int numbers from 't'
    textSize(32);
    text("Your score: " + time,width*9/13,height*1/8);
  }
  
  void createTable(){
       // Create a new table to contain the high scores
    highScore = new Table();
    highScore.clearRows();
    highScore.addColumn("Scores");
  }

  void writeScore(){
      TableRow value = highScore.addRow();
      value.setString("Scores",time);
      saveTable(highScore,"data/highScores.csv");
  }
  
}