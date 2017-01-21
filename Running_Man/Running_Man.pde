void setup() {

  size(1000,1000);
  frameRate(60);


  
  // Create a new table to contain the high scores
  highScore = new Table();
  highScore.clearRows();
  highScore.addColumn("Scores");

  marioBg = loadImage("images/backgrounds/mario/mario.png");

}

PImage playerSkin,marioBg;
int horizon = 800, speed = 30, direction = 1, numOfSkins = 5;
float posX , posY = horizon;
String time = "000",character;
PImage[] skins = new PImage[numOfSkins];
PImage[] enemies = new PImage[numOfSkins];

// Save the highscore to a table
Table highScore;

float x0 = 200;
float y0 = 0;
float y0_speed=20;
int r = (int)random(1,3);

void draw() {
  background(205);
  
  if(menu()){
  println("GAME RUNNING");
  imageMode(CENTER);
  image(marioBg,width/2,height/2,1000,1000);
  drawCharacter();
  timer(); // Start timer at start of programe for now
  falling();
  collision();
  }
}


boolean menu(){
    
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("Please enter the number of the character you'd like to play\n1.Mario\n2.Sonic\n3.Pacman",width/2,height/2);

    if (key == '1'){
      character = "mario";
      return true;
    }
    
    else if (key == '2'){
      character = "sonic";
      return true;
    }
    
    else if (key == '3'){
      character = "pacman";
      return true;
    }
    
  return false;
}

void drawCharacter(){
      
  for (int i=1; i<5; i++){
    skins[i] = loadImage("images/characters/"+ character + "/"+ character + i + ".png");
    enemies[i] = loadImage("images/enemy/enemy" + i + ".png");
   }
    
  posX=posX+speed*direction;
   
  if(posX > width){
    posX = 0;
  }
   if (posX < 0) {
     posX = width;
   }

  // Character standing facing right
  if((frameCount/2)%2==0 && direction == 1){
    playerSkin = skins[1];
  }
  
  // Character runnning facing right
  else if ((frameCount/2)%2!=0 && direction == 1){
    playerSkin = skins[2];
  }
  
  // Characater standing facing left
  if((frameCount/2)%2==0 && direction == -1){
    playerSkin = skins[3];
  }
  
  // Character standing facing left
  else if ((frameCount/2)%2!=0 && direction == -1){
    playerSkin = skins[4];
  }


  imageMode(CENTER);
  image(playerSkin,posX,posY);
  // Draw image using CENTER mode, playerSkin, based on above

}

void falling (){


  if(y0 > horizon+40) {
    y0 = -15;
    x0 = random(width); 
    y0_speed = random(3,7); 
  }
  
  
  //Move the ball
  y0 += y0_speed; 
  imageMode(CENTER);
  image(enemies[1],x0,y0,100,100);
 
}

void collision(){
  int enemyYBorder = 50,enemyXBorder = 25, characterXBorder = 50, characterBorder = 90;
  strokeWeight(15);
  
  if (y0 + enemyYBorder >= posY - characterBorder &&// Y line border
      x0 + enemyXBorder >= posX-characterXBorder && //Brigth enemy and Tleft char
      x0 - enemyXBorder <= posX + characterXBorder //BLeft enemy and Tright char
      ){
        
        println("Game Over");
        TableRow value = highScore.addRow();
        value.setString("Scores",time);
        saveTable(highScore,"data/highScores.csv");
        noLoop();
  }

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
  
  
  // Testing key to save a score
   if(key == 's'){
    TableRow value = highScore.addRow();
    value.setString("Scores",time);
    saveTable(highScore,"data/highScores.csv");
  }

}

// Touches are registered same as a clicked with touch enabled laptops
void mouseClicked() {

  if (direction == 1){
  
    direction = -1;
  }
  
  else{
    direction = 1;
  }

}