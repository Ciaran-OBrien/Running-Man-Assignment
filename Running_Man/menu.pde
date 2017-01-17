class menu{

  void display(){
  
    textSize(32);
    textAlign(CENTER);
    text("Please enter the number of the character you'd like to play\n1.Mario\n2.Sonic\n3.Pacman",width/2,height/2);
      
    for (int i=1; i<5; i++){
      skins[i] = loadImage("images/characters/mario/marioRunning" + i + ".png");
      enemies[i] = loadImage("images/enemy/enemy" + i + ".png");
    
    }
  
  }

}