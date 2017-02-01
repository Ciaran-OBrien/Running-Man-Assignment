// Decleration of each class
CharacterObject characters;
Player newPlayer;
Menu startMenu;
Enemy enemies;
Background background;
Collision detect;

// Declaring all images
PImage playerSkin;
PImage[] marioEnemies;  
PImage[] marioSkins;
PImage[] sonicSkins;
PImage[] pacmanSkins;
PImage[] backgrounds;

// Variables for the image arrays, based on the number of characters
int numOfSkins = 5,numOfBackgrounds = 5, speedMultiplier = 0; // This multiplier busisness is to do with increasing the speed, and then subtractied form the collission detction in order to keep the x/y coordinates the same as before


void setup() {
  size(2000,1000);
  //frameRate(10);
  //fullScreen();
  // Instances of each class
  characters = new CharacterObject();
  newPlayer = new Player();
  startMenu = new Menu();
  enemies = new Enemy();
  background = new Background();
  detect = new Collision();
  
  // Instances of all images
  marioEnemies = new PImage[numOfSkins];
  marioSkins = new PImage[numOfSkins];
  sonicSkins = new PImage[numOfSkins];
  pacmanSkins = new PImage[numOfSkins];
  backgrounds = new PImage[numOfBackgrounds];
   
  // Loading all of the charater's skins
  for(int i = 1; i < numOfSkins;i++){
    marioEnemies[i] = loadImage("images/enemy/enemy" + i + ".png");
    marioSkins[i] = loadImage("images/characters/mario/mario" + i + ".png");
    sonicSkins[i] = loadImage("images/characters/sonic/sonic" + i + ".png");
    pacmanSkins[i] = loadImage("images/characters/pacman/pacman" + i + ".png");
  }
  
  // Loading all the background images to the game
  for (int i=1; i<numOfBackgrounds; i++){
    backgrounds[i] = loadImage("images/backgrounds/bg" + i + ".png");     
  }
}

String userChoice = "";
boolean characterRunning,speed;



void draw() {

  background(205);
  startMenu.load();
  startMenu.textBorders();
  if(characterRunning){
      background(205);
      if (userChoice =="mario"){
        // Calling all the relavent mario methods
        background(backgrounds[1]);
        newPlayer.loadMario();
        newPlayer.movePlayer();
        enemies.loadMarioEnemy();
        enemies.moveEnemy();
        detect.setEnemyX(enemies.getEnemyX());
        detect.setEnemyY(enemies.getEnemyY());
        detect.setCharacterX(newPlayer.getPlayerX());
        detect.setCharacterY(newPlayer.getPlayerY());
        detect.marioCollision();
        //collision();
     }
        
      else if (userChoice == "sonic"){
        // Calling all the relavent sonic methods
        background(backgrounds[2]);
        newPlayer.loadSonic();
        newPlayer.movePlayer();
      }
      else if(userChoice == "pacman"){
        // Calling all the relavent pacman methods
        newPlayer.loadPacman();
        newPlayer.movePlayer();
      }
      else{
        println("ERROR");
      }
  }
  //mario.move();
  //mario.loadMario();
  
}

// Make this a separate class !!!
// Current collision is only for mario, and mario enemy number 1
void collision(){
  int enemyYBorder = 50,enemyXBorder = 25, characterXBorder = 20, characterBorder = 70;
  //strokeWeight(15);
  if(speed){
    enemyYBorder = enemyYBorder - speedMultiplier*2;
    //characterBorder = characterBorder - speedMultiplier;
      // // Enemy test lines
   line(enemies.getEnemyX(),enemies.getEnemyY(),enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder);
   line(enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder,enemies.getEnemyX()+enemyXBorder,enemies.getEnemyY()+enemyYBorder); // Line to the right
   line(enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder,enemies.getEnemyX()-enemyXBorder,enemies.getEnemyY()+enemyYBorder); // Line to the left
   // Chacter test lines
   line(newPlayer.getPlayerX(),newPlayer.getPlayerY(),newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder);  
   line(newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder,newPlayer.getPlayerX()+characterXBorder,newPlayer.getPlayerY()-characterBorder); // Line to the right
   line(newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder,newPlayer.getPlayerX()-characterXBorder,newPlayer.getPlayerY()-characterBorder); // Line to the left
   if (enemies.getEnemyY() + enemyYBorder >= newPlayer.getPlayerY() - characterBorder &&// Y line border
      enemies.getEnemyX() + enemyXBorder >= newPlayer.getPlayerX()-characterXBorder && //Brigth enemy and Tleft char
      enemies.getEnemyX() - enemyXBorder <= newPlayer.getPlayerX() + characterXBorder //BLeft enemy and Tright char
      ){
        background(backgrounds[3]);
        noLoop();
      }//end of nested if
  } // end of if
  else{
  // // Enemy test lines
   line(enemies.getEnemyX(),enemies.getEnemyY(),enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder);
   line(enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder,enemies.getEnemyX()+enemyXBorder,enemies.getEnemyY()+enemyYBorder); // Line to the right
   line(enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder,enemies.getEnemyX()-enemyXBorder,enemies.getEnemyY()+enemyYBorder); // Line to the left
   // Chacter test lines
   line(newPlayer.getPlayerX(),newPlayer.getPlayerY(),newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder);  
   line(newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder,newPlayer.getPlayerX()+characterXBorder,newPlayer.getPlayerY()-characterBorder); // Line to the right
   line(newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder,newPlayer.getPlayerX()-characterXBorder,newPlayer.getPlayerY()-characterBorder); // Line to the left
   if (enemies.getEnemyY() + enemyYBorder >= newPlayer.getPlayerY() - characterBorder &&// Y line border
      enemies.getEnemyX() + enemyXBorder >= newPlayer.getPlayerX()-characterXBorder && //Brigth enemy and Tleft char
      enemies.getEnemyX() - enemyXBorder <= newPlayer.getPlayerX() + characterXBorder //BLeft enemy and Tright char
      ){
        background(backgrounds[3]);
        noLoop();
      } // end of nested if
  }// end of else
}

void mousePressed(){
  if(startMenu.detection() && !characterRunning){
    characterRunning = true;
  }
  //else{
  //  characterRunning = false;
  //}
  
  if (newPlayer.getDirection() == 1){
  
    newPlayer.setDirection(-1);
  }
  
  else{
    newPlayer.setDirection(1);
  }
}

void keyPressed(){
  if(key == 's'){
    speed = true;
    speedMultiplier = speedMultiplier + 30; // No work, needs more work
  }
  
}