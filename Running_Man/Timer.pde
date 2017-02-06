class Timer {
  int t, interval, score, timer, start, bonusCount;
  String time;
  int localBonus;
  int startTime = millis();
  int currentTime = 0;

  // Integer list of previous scores
  IntList scores;
  // String list of previous player names
  StringList players;
  // String array of names of top five scoring players
  String[] playerArray;
  // Variables to enable writing of highscores to text file
  PrintWriter scoring;
  String playerName = "Dave";
  String outFilename = "out.csv";

  File f;
  Scanner scanner = null;

  Timer() {
    time = "000";
    localBonus = 0;
    //ms = 3000;
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

  void myDelay(int ms) {
    println("Delay is running");
    timer = millis();
    while (millis() - timer < ms);
  }
  void appendTextToFile(String filename, int score, String level) {
    f = new File(dataPath(filename));
    if (!f.exists()) {
      createFile(f);
    }
    try {
      PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
      out.println(playerName  + score + userChoice);
      out.flush();
      out.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  void createFile(File f) {
    File parentDir = f.getParentFile();
    try {
      parentDir.mkdirs(); 
      f.createNewFile();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }    

  void showScore() {
    try {  
      scanner = new Scanner( f ); 
      while ( scanner.hasNextLine() ) {
        String line = scanner.nextLine();
        System.out.println( line );
      }
    } 
    catch ( FileNotFoundException e ) {
      e.printStackTrace();
    }
    finally {
      scanner.close();
    }
  }
  
  //void calculateHighScores()
  //{
  //  // Load table of all highscores from csv file
  //  highScore = loadTable("data/out.csv", "header");
  //  for (TableRow row : highScore.rows())
  //  {
  //    players.append(row.getString("Name"));
  //    scores.append(row.getInt("Score"));
  //  }

  //  int[] scoresArray = scores.array();
  //  scores.sortReverse();

  //  // Go through top 5 elements of sorted scores list, finding them in the unsorted array of scores in order to find player names
  //  int display = scores.size();
  //  if (scores.size() > 5)
  //    display = 5;
  //  for (int s = 0; s < display; s++)
  //  {
  //    for (int a = 0; a < scoresArray.length; a++)
  //    {
  //      if (scores.get(s) == scoresArray[a])
  //        playerArray[s] = players.get(a);
  //    }
  //  }
  //} // End Calculate High Scores

  //void showScores() {
  //  text("HighScores", width*0.5, height*0.1f);
  //  int display = scores.size();
  //  if (scores.size() > 5)
  //    display = playerArray.length;
  //  for (int i = 0; i < display; i++)
  //  {
  //    text(playerArray[i], width * 0.3f, height * 0.3f + (i * height * 0.06f));
  //    text(scores.get(i), width * 0.7f, height * 0.3f + (i * height * 0.06f));
  //  }
  //  text("Player", width * 0.3f, height * 0.2f);
  //  text("Score", width * 0.7f, height * 0.2f);
  //  line(width * 0.2f, height * 0.22f, width * 0.4f, height * 0.22f);
  //  line(width * 0.6f, height * 0.22f, width * 0.8f, height * 0.22f);
  //} // Enf of showScores
}