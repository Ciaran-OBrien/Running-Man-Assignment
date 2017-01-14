void setup() {

  size(1000,1000);
  frameRate(24);

  for (int i=1; i<5; i++){
    skins[i] = loadImage("images/characters/mario/marioRunning" + i + ".png");
    enemies[i] = loadImage("images/enemy/enemy" + i + ".png");
  }
  
  // Create a new table to contain the high scores
  highScore = new Table();
  highScore.clearRows();
  highScore.addColumn("Scores");
  


}

PImage playerSkin;
int horizon = 800, speed = 10, direction = 1, numOfSkins = 5;
float posX , posY = horizon;
String time = "000";
PImage[] skins = new PImage[numOfSkins];
PImage[] enemies = new PImage[numOfSkins];

// Save the highscore to a table
Table highScore;

float x0 = 200;
float y0 = 0;
float y0_speed=5;
int r = (int)random(1,3);

void draw() {
  background(205);
  timer(); // Start timer at start of programe for now
  posX=posX+speed*direction;
   
  if(posX > width){
    posX = 0;
  }
   if (posX < 0) {
     posX = width;
   }

  // Character standing facing right
  if((frameCount/4)%2==0 && direction == 1){
    playerSkin = skins[1];
  }
  
  // Character runnning facing right
  else if ((frameCount/4)%2!=0 && direction == 1){
    playerSkin = skins[2];
  }
  
  // Characater standing facing left
  if((frameCount/4)%2==0 && direction == -1){
    playerSkin = skins[3];
  }
  
  // Character standing facing left
  else if ((frameCount/4)%2!=0 && direction == -1){
    playerSkin = skins[4];
  }


  imageMode(CENTER);
  image(playerSkin,posX,posY);
  // Draw image using CENTER mode, playerSkin, based on above
 
  falling();
}

void falling (){


  if(y0 > horizon+40) {
    y0 = -15;
    x0 = random(width); 
    y0_speed = random(3,7); 
  }
  
  
  //Move the ball
  y0 += y0_speed; 
  
  image(enemies[1],x0,y0,100,100);
 
}

void timer()
{
  
  int t,interval = 0;
  
  t = interval + int(millis()/1000);
  time = nf(t,3);
  // Formating the string 'time' with int numbers from 't'
  textSize(32);
  text("Your score: " + time,width*9/13,height*1/8);
  
}


void keyPressed(){
  
  if(key == 'a'){
    // Change direction leftward once key is pressed
    direction = -1;
  
  }
  
  else if(key == 'd'){
    // Change direction rightward once key is pressed
    direction = 1;
  
  }
  
  // Testing key to save a score
  else if(key == 's'){
    TableRow value = highScore.addRow();
    value.setString("Scores",time);
    saveTable(highScore,"data/highScores.csv");
  }

}