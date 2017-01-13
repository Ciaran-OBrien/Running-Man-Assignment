class Player {

  PImage playerSkin; // Set the skin of the charater to the skin that the user has chosen, default for now.
  float setX,setY;
  
  Player(PImage userSkin,float locationX, float locationY){
  
  playerSkin = userSkin; // Set the skin of the charater to the skin that the user has chosen, default for now.
  setX = locationX;
  setY = locationY;
  }
  
  
  
  void display(){
  
    image(playerSkin,setX,setY);
    
  }

}