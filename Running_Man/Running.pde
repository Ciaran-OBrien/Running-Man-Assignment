CharacterObject characters;
Player newPlayer;
Menu startMenu;
Enemy enemies;
Background background;
// Declaring all images
PImage playerSkin;
PImage[] marioEnemies;  
PImage[] marioSkins;
PImage[] sonicSkins;
PImage[] pacmanSkins;
PImage[] backgrounds;

int numOfSkins = 5,numOfBackgrounds = 5;


void setup() {
  size(2000,1000);
  //fullScreen();
  characters = new CharacterObject();
  newPlayer = new Player();
  startMenu = new Menu();
  enemies = new Enemy();
  background = new Background();
  
  // Inisialling all images
  marioEnemies = new PImage[numOfSkins];
  marioSkins = new PImage[numOfSkins];
  sonicSkins = new PImage[numOfSkins];
  pacmanSkins = new PImage[numOfSkins];
  backgrounds = new PImage[numOfBackgrounds];
   
  for(int i = 1; i < numOfSkins;i++){
    marioEnemies[i] = loadImage("images/enemy/enemy" + i + ".png");
    marioSkins[i] = loadImage("images/characters/mario/mario" + i + ".png");
    sonicSkins[i] = loadImage("images/characters/sonic/sonic" + i + ".png");
    pacmanSkins[i] = loadImage("images/characters/pacman/pacman" + i + ".png");
  }
  
  for (int i=1; i<numOfBackgrounds; i++){
    // Load all the backgrounds images to the game
    backgrounds[i] = loadImage("images/backgrounds/bg" + i + ".png");     
  }
}

String userChoice = "";
boolean characterRunning;



void draw() {

  background(205);
  startMenu.load();
  startMenu.textBorders();
  if(characterRunning){
      background(205);
      if (userChoice =="mario"){
        background(backgrounds[1]);
        newPlayer.loadMario();
        newPlayer.movePlayer();
        enemies.loadMarioEnemy();
        enemies.moveEnemy();
        collision();
     }
        
      else if (userChoice == "sonic"){
        background(backgrounds[2]);
        newPlayer.loadSonic();
        newPlayer.movePlayer();
      }
      else if(userChoice == "pacman"){
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

void collision(){
  int enemyYBorder = 50,enemyXBorder = 25, characterXBorder = 20, characterBorder = 70;
  //strokeWeight(15);
  // // Enemy test lines
  // line(enemies.getEnemyX(),enemies.getEnemyY(),enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder);
  // line(enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder,enemies.getEnemyX()+enemyXBorder,enemies.getEnemyY()+enemyYBorder); // Line to the right
  // line(enemies.getEnemyX(),enemies.getEnemyY()+enemyYBorder,enemies.getEnemyX()-enemyXBorder,enemies.getEnemyY()+enemyYBorder); // Line to the left
  // // Chacter test lines
  // line(newPlayer.getPlayerX(),newPlayer.getPlayerY(),newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder);  
  // line(newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder,newPlayer.getPlayerX()+characterXBorder,newPlayer.getPlayerY()-characterBorder); // Line to the right
  // line(newPlayer.getPlayerX(),newPlayer.getPlayerY()-characterBorder,newPlayer.getPlayerX()-characterXBorder,newPlayer.getPlayerY()-characterBorder); // Line to the left
   if (enemies.getEnemyY() + enemyYBorder >= newPlayer.getPlayerY() - characterBorder &&// Y line border
      enemies.getEnemyX() + enemyXBorder >= newPlayer.getPlayerX()-characterXBorder && //Brigth enemy and Tleft char
      enemies.getEnemyX() - enemyXBorder <= newPlayer.getPlayerX() + characterXBorder //BLeft enemy and Tright char
      ){
        background(backgrounds[3]);
        noLoop();
      }
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