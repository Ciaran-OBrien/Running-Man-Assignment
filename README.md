# Running-Man-Assignment

<p align="center">
  <img src="http://i.giphy.com/oNlPuwLlBOl3i.gif">
</p>
<p align="center"><i>How long can you out run your enemies</i></p>
==========
Running man is a side scrolling action game that follows you, The Man, running from various enemies. You score is taken from the time you start, till you get hit. Collect bonus, pick me ups, along the way.

### TODO
- [ ] Images
![Progress](http://progressed.io/bar/90?title=progress)

- [ ] Power Ups
![Progress](http://progressed.io/bar/85?title=progress)

- [ ] Power Downs
![Progress](http://progressed.io/bar/85?title=progress)

- [ ] Touch Controls
![Progress](http://progressed.io/bar/100?title=completed)

- [ ] Key Controls
![Progress](http://progressed.io/bar/20?title=progress)

### Controls

The games is based off touch controls, a touch enabled laptop, or on mobile devices

  * Simple Touch interaciton with menu
  * Once game is running, touch screen to change running direction
  
  
### Scoring System

  * Each second counts towards your running score keeper
  * Coffee = 50 points
  
### Game Over

The game ends when you get hit by an enemy. The score is then saved and will be displayed upon playing the game again, highest score remains persistant. 

### Youtube Video Demo

[![Demo Video](http://img.youtube.com/vi/5ezeo7EM3yk/0.jpg)](https://youtu.be/5ezeo7EM3yk "Demo Video")

### Code Samples
The below code runs for each character

```java
  // Setting the image of the character based on the frameCount and direction
  void loadMario() {
    // Character standing facing right
    if ((frameCount/5)%2==0 && direction == 1) {
      playerSkin = marioSkins[1];
    }
    // Character runnning facing right
    else if ((frameCount/5)%2!=0 && direction == 1) {
      playerSkin = marioSkins[2];
    }
    // Characater standing facing left
    if ((frameCount/5)%2==0 && direction == -1) {
      playerSkin = marioSkins[3];
    }
    // Character standing facing left
    else if ((frameCount/5)%2!=0 && direction == -1) {
      playerSkin = marioSkins[4];
    }
    // Drawing the image of the character based on above
    image(playerSkin, posX, horizon);
  } 
```
