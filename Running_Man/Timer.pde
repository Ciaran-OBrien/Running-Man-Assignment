class Timer {
  int t, interval, score, timer, start, bonusCount;
  String time;
  int localBonus;
  int startTime = millis();
  int currentTime = 0;
  int count = 0;


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
    timer = millis();
    while (millis() - timer < ms);
    if (timer > ms) {
      println("Delay is over");
    }
  }
  void appendTextToFile(String filename, int score, String level) {
    f = new File(dataPath(filename));
    if (!f.exists()) {
      createFile(f);
    }
    try {
      PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
      out.println(score + "," + level);
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
    background(0);
    try {  
      scanner = new Scanner( f ); 
      while ( scanner.hasNextLine() && count<10 ) {
        String line = scanner.nextLine();
        String delims = "[,]";
        String[] tokens = line.split(delims);
        scores[count] = tokens[0];
        levels[count] = tokens[1];
        text("Last few game scores", width*0.5, height*0.3);
        textAlign(CENTER);
        text(tokens[0] + " "+ tokens[1], width*0.5, height*0.4 + count*30);
        count ++;
      }
    } 
    catch ( FileNotFoundException e ) {
      e.printStackTrace();
    }
    finally {
      scanner.close();
    }
  }
}