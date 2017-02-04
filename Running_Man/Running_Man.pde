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
Instructions instructions;

PFont text;

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
  instructions = new Instructions();

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

  text = loadFont("8bit.vlw");

  marioThemeMus = minim.loadFile("sounds/mario/theme.mp3");
  marioBonusMus = minim.loadFile("sounds/mario/bonus.mp3");
  marioDeathMus = minim.loadFile("sounds/mario/death.mp3");
  sonicThemeMus = minim.loadFile("sounds/sonic/theme.mp3");
  sonicBonusMus = minim.loadFile("sounds/sonic/bonus.mp3");
  sonicDeathMus = minim.loadFile("sounds/sonic/death.mp3");
  pacmanThemeMus = minim.loadFile("sounds/pacman/theme.mp3");
  pacmanBonusMus = minim.loadFile("sounds/pacman/bonus.mp3");
  pacmanDeathMus = minim.loadFile("sounds/pacman/death.mp3");



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
boolean characterRunning, speed, gameOver = false, menu = true, bonusHit = false, showInstructions = false, showExit = false;
int loopCount;


void draw() {
  textFont(text);
  if (showInstructions) {
    background(205);
    instructions.render();
  }
  if (menu) {
    background(205);
    startMenu.load();
    startMenu.textBorders();
  }
  if (characterRunning) {
    if (showInstructions) {
      //background(205);
      instructions.render();
    }
    if (showExit) {
      startMenu.exitBtn();
    }
    // Non specific methods


    if (userChoice =="mario") {
      // Calling all the relavent mario methods
      play.theme();
      background.loadMarioBg();
      background.loadEndGameBg();
      startMenu.pause();
      startMenu.instructions();

      score.createTable();
      score.setTime();
      score.setBonus();
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
      play.theme();
      background.loadSonicBg();
      startMenu.pause();
      startMenu.instructions();
      score.createTable();
      score.setTime();
      score.setBonus();
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
      play.theme();
      background.loadPacmanBg();
      startMenu.pause();
      startMenu.instructions();
      score.createTable();
      score.setTime();
      score.setBonus();
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

void mousePressed() {

  if (startMenu.detection() && !characterRunning) {
    menu = false;
    gameOver = false;
    characterRunning = true;
    newPlayer.setPosx(random(width));
    score.setTime();
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

  if (keyCode == 'I') {
    if (showInstructions) {
      menu = true;
      showInstructions = false;
    } else {
      //showInstructions = false; 
      menu = false;
      showInstructions = true;
    }
  }

  if (keyCode == 'E') {
    if (showExit) {
      showExit = false;
    } else {
      showExit = true;
    }
  }
}