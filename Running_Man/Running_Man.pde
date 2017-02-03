import ddf.minim.*;

Minim minim;
AudioPlayer marioThemeMus;
AudioPlayer marioBonusMus;
AudioPlayer marioDeathMus;
AudioPlayer sonicThemeMus;
AudioPlayer sonicBonusMus;
AudioPlayer sonicDeathMus;
AudioPlayer pacmanThemeMus;
AudioPlayer pacmanBonusMus;
AudioPlayer pacmanDeathMus;

// Decleration of each class
CharacterObject characters;
Player newPlayer;
Menu startMenu;
Enemy enemies;
Background background;
Collision detect;
Timer score;
Bonus item;
Sounds play;

// Declaring all images, and image arrays
PImage playerSkin;
PImage[] marioSkins;
PImage[] marioEnemies;  
PImage[] marioBonus;
PImage[] sonicSkins;
PImage[] sonicEnemies;
PImage[] sonicBonus;
PImage[] pacmanSkins;
PImage[] pacmanEnemies;
PImage[] pacmanBonus;
PImage[] backgrounds;

// Variables for the image arrays, based on the number of characters
int numOfSounds = 3, numOfSkins = 5, numOfBackgrounds = 5, speedMultiplier = 0; // This multiplier busisness is to do with increasing the speed, and then subtractied form the collission detction in order to keep the x/y coordinates the same as before
// Save the highscore to a table
Table highScore;

final static String[] fileNames = {"theme", "bonus", "death"};



void setup() {
  size(2000, 1000);
  //frameRate(10);
  //fullScreen();

  minim = new Minim(this);

  // Instances of each class
  characters = new CharacterObject();
  newPlayer = new Player();
  startMenu = new Menu();
  enemies = new Enemy();
  background = new Background();
  detect = new Collision();
  score = new Timer();
  item  = new Bonus();
  play = new Sounds();

  // Instances of all images
  marioEnemies = new PImage[numOfSkins];
  marioSkins = new PImage[numOfSkins];
  sonicSkins = new PImage[numOfSkins];
  pacmanSkins = new PImage[numOfSkins];
  backgrounds = new PImage[numOfBackgrounds];
  marioBonus = new PImage[numOfSkins];
  sonicBonus = new PImage[numOfSkins];
  pacmanBonus = new PImage[numOfSkins];
  pacmanEnemies = new PImage[numOfSkins];
  sonicEnemies = new PImage[numOfSkins];

  marioThemeMus = minim.loadFile("sounds/mario/theme.mp3");
  marioBonusMus = minim.loadFile("sounds/mario/bonus.mp3");
  marioDeathMus = minim.loadFile("sounds/mario/death.mp3");
  sonicThemeMus = minim.loadFile("sounds/sonic/theme.mp3");
  sonicBonusMus = minim.loadFile("sounds/sonic/bonus.mp3");
  sonicDeathMus = minim.loadFile("sounds/sonic/death.mp3");
  pacmanThemeMus = minim.loadFile("sounds/pacman/theme.mp3");
  pacmanBonusMus = minim.loadFile("sounds/pacman/bonus.mp3");
  pacmanDeathMus = minim.loadFile("sounds/pacman/death.mp3");

  //  // Loading all of the game's sounds
  //  for (int i = 0; i< numOfSounds; i++) {
  //    sounds[i] = new SoundFile(this, "sounds/mario/" + fileNames[i] + ".mp3");
  //  }

  //sounds = new SoundFile(this, "death.mp3");

  // Loading all of the charater's skins
  for (int i = 1; i < numOfSkins; i++) {
    marioSkins[i] = loadImage("images/mario/skin/mario" + i + ".png");
    marioEnemies[i] = loadImage("images/mario/enemy/enemy" + i + ".png");
    marioBonus[i] = loadImage("images/mario/bonus/bonus" + i + ".png");
    sonicSkins[i] = loadImage("images/sonic/skin/sonic" + i + ".png");
    sonicEnemies[i] = loadImage("images/sonic/enemy/enemy" + i + ".png");
    sonicBonus[i] = loadImage("images/sonic/bonus/bonus" + i + ".png");
    pacmanSkins[i] = loadImage("images/pacman/skin/pacman" + i + ".png");
    pacmanEnemies[i] = loadImage("images/pacman/enemy/enemy" + i + ".png");
    pacmanBonus[i] = loadImage("images/pacman/bonus/bonus" + i + ".png");
  }

  // Loading all the background images to the game
  for (int i=1; i<numOfBackgrounds; i++) {
    backgrounds[i] = loadImage("images/backgrounds/bg" + i + ".png");
  }
}

String userChoice = "";
boolean characterRunning, speed, gameOver, menu = true, bonusHit = false;
int loopCount;


void draw() {

  if (menu) {
    background(205);
    startMenu.load();
    startMenu.textBorders();
  }
  if (characterRunning) {
    if (userChoice =="mario") {
      // Calling all the relavent mario methods
      background.loadMarioBg();
      play.theme();
      score.createTable();
      score.setTime();
      score.display();
      newPlayer.movePlayer();
      newPlayer.loadMario();
      enemies.loadMarioEnemy();
      enemies.moveEnemy();
      item.moveBonus();
      item.loadMarioBonus();
      detect.setEnemyX(enemies.getEnemyX());
      detect.setEnemyY(enemies.getEnemyY());
      detect.setCharacterX(newPlayer.getPlayerX());
      detect.setCharacterY(newPlayer.getPlayerY());
      detect.setBonusX(item.getBonusX());
      detect.setBonusY(item.getBonusY());
      detect.collision();
    } else if (userChoice == "sonic") {
      // Calling all the relavent sonic methods
      background.loadSonicBg();
      score.createTable();
      score.setTime();
      score.display();
      newPlayer.movePlayer();
      newPlayer.loadSonic();
      enemies.loadSonicEnemy();
      enemies.moveEnemy();
      item.moveBonus();
      item.loadSonicBonus();
      detect.setEnemyX(enemies.getEnemyX());
      detect.setEnemyY(enemies.getEnemyY());
      detect.setCharacterX(newPlayer.getPlayerX());
      detect.setCharacterY(newPlayer.getPlayerY());
      detect.setBonusX(item.getBonusX());
      detect.setBonusY(item.getBonusY());
      detect.collision();
    } else if (userChoice == "pacman") {
      // Calling all the relavent pacman methods
      background.loadPacmanBg();
      score.createTable();
      score.setTime();
      score.display();
      newPlayer.movePlayer();
      newPlayer.loadPacman();
      enemies.loadPacmanEnemy();
      enemies.moveEnemy();
      item.moveBonus();
      item.loadPacmanBonus();
      detect.setEnemyX(enemies.getEnemyX());
      detect.setEnemyY(enemies.getEnemyY());
      detect.setCharacterX(newPlayer.getPlayerX());
      detect.setCharacterY(newPlayer.getPlayerY());
      detect.setBonusX(item.getBonusX());
      detect.setBonusY(item.getBonusY());
      detect.collision();
    } else {
      println("ERROR");
    }
  }
}

// Make this a separate class !!!
// Current collision is only for mario, and mario enemy number 1
void collision() {
  int enemyYBorder = 50, enemyXBorder = 25, characterXBorder = 20, characterBorder = 70;
  //strokeWeight(15);
  if (speed) {
    enemyYBorder = enemyYBorder - speedMultiplier*2;
    //characterBorder = characterBorder - speedMultiplier;
    // // Enemy test lines
    line(enemies.getEnemyX(), enemies.getEnemyY(), enemies.getEnemyX(), enemies.getEnemyY()+enemyYBorder);
    line(enemies.getEnemyX(), enemies.getEnemyY()+enemyYBorder, enemies.getEnemyX()+enemyXBorder, enemies.getEnemyY()+enemyYBorder); // Line to the right
    line(enemies.getEnemyX(), enemies.getEnemyY()+enemyYBorder, enemies.getEnemyX()-enemyXBorder, enemies.getEnemyY()+enemyYBorder); // Line to the left
    // Chacter test lines
    line(newPlayer.getPlayerX(), newPlayer.getPlayerY(), newPlayer.getPlayerX(), newPlayer.getPlayerY()-characterBorder);  
    line(newPlayer.getPlayerX(), newPlayer.getPlayerY()-characterBorder, newPlayer.getPlayerX()+characterXBorder, newPlayer.getPlayerY()-characterBorder); // Line to the right
    line(newPlayer.getPlayerX(), newPlayer.getPlayerY()-characterBorder, newPlayer.getPlayerX()-characterXBorder, newPlayer.getPlayerY()-characterBorder); // Line to the left
    if (enemies.getEnemyY() + enemyYBorder >= newPlayer.getPlayerY() - characterBorder &&// Y line border
      enemies.getEnemyX() + enemyXBorder >= newPlayer.getPlayerX()-characterXBorder && //Brigth enemy and Tleft char
      enemies.getEnemyX() - enemyXBorder <= newPlayer.getPlayerX() + characterXBorder //BLeft enemy and Tright char
      ) {
      gameOver = true;
      background(backgrounds[3]);
      noLoop();
    }//end of nested if
  } // end of if
  else {
    // // Enemy test lines
    line(enemies.getEnemyX(), enemies.getEnemyY(), enemies.getEnemyX(), enemies.getEnemyY()+enemyYBorder);
    line(enemies.getEnemyX(), enemies.getEnemyY()+enemyYBorder, enemies.getEnemyX()+enemyXBorder, enemies.getEnemyY()+enemyYBorder); // Line to the right
    line(enemies.getEnemyX(), enemies.getEnemyY()+enemyYBorder, enemies.getEnemyX()-enemyXBorder, enemies.getEnemyY()+enemyYBorder); // Line to the left
    // Chacter test lines
    line(newPlayer.getPlayerX(), newPlayer.getPlayerY(), newPlayer.getPlayerX(), newPlayer.getPlayerY()-characterBorder);  
    line(newPlayer.getPlayerX(), newPlayer.getPlayerY()-characterBorder, newPlayer.getPlayerX()+characterXBorder, newPlayer.getPlayerY()-characterBorder); // Line to the right
    line(newPlayer.getPlayerX(), newPlayer.getPlayerY()-characterBorder, newPlayer.getPlayerX()-characterXBorder, newPlayer.getPlayerY()-characterBorder); // Line to the left
    if (enemies.getEnemyY() + enemyYBorder >= newPlayer.getPlayerY() - characterBorder &&// Y line border
      enemies.getEnemyX() + enemyXBorder >= newPlayer.getPlayerX()-characterXBorder && //Brigth enemy and Tleft char
      enemies.getEnemyX() - enemyXBorder <= newPlayer.getPlayerX() + characterXBorder //BLeft enemy and Tright char
      ) {
      gameOver = true;
      background(backgrounds[3]);
      noLoop();
    } // end of nested if
  }// end of else
}

void mousePressed() {
  if (startMenu.detection() && !characterRunning) {
    menu = false;
    characterRunning = true;
  }
  //else{
  //  characterRunning = false;
  //}

  if (newPlayer.getDirection() == 1) {

    newPlayer.setDirection(-1);
  } else {
    newPlayer.setDirection(1);
  }
}


void keyPressed() {
  final int k = keyCode;

  if (k == 'S')
    if (looping) { 
      
      noLoop();
    } else {
      loop();
    }
}