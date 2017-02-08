# Running-Man-Assignment

<p align="center">
  <img src="http://i.giphy.com/oNlPuwLlBOl3i.gif">
</p>
<p align="center"><i>How long can you out run your enemies</i></p>
==========
Running man is a side scrolling action game that follows you, The Man, running from various enemies. You score is taken from the time you start, till you get hit. Collect bonus, pick me ups, along the way.

### TODO
- [ ] Images
![Progress](http://progressed.io/bar/100?title=progress)

- [ ] Power Ups
![Progress](http://progressed.io/bar/100?title=progress)

- [ ] Power Downs
![Progress](http://progressed.io/bar/100?title=progress)

- [ ] Touch Controls
![Progress](http://progressed.io/bar/100?title=completed)

### Controls

The games is based off touch controls, a touch enabled laptop, or on mobile devices

  * Simple Touch/Click interaciton with menu
  * Once game is running, touch/click screen to change running direction
  
  
### Scoring System

  * Each second counts towards your running score keeper
  * Catch a bonus = 10 points
  
### Game Over

The game ends when you get hit by an enemy. The score is then saved and will be displayed upon playing the game again, highest score remains persistant. 

### Youtube Video Demo

[![Demo Video](http://img.youtube.com/vi/5ezeo7EM3yk/0.jpg)](https://youtu.be/5ezeo7EM3yk "Demo Video")

### Key Coding Samples
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
This section of the sketch deas with the guts of the timer functions
``` java
Timer() {
    time = "000";
    localBonus = 0;
    ms = 3000;
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
```
The fuzzy background of the main menu, coll little animaiton
```java
// The background of the main menu
  // Random strokes and lines falling down the screen
  void backgroundFuzz() {
    strokeWeight(10);
    for (int i=0; i<=0.5*width; i+=50) {
      stroke(random(0, 255));
      x = random(0, width);
      y = random(0, width);
      line(x, y, x+random(0, s), y);
    }

    stroke(100, 100);
    line(0, wipe[0], width, wipe[0]);
    wipe[0]+=2;
    if (wipe[0]>width/2) {
      wipe[0]=0;
    }
    line(0, wipe[1], width, wipe[1]);
    wipe[1]+=4;
    if (k>width/4) {
      wipe[1]=0;
    }
    line(0, wipe[2], width, wipe[2]);
    wipe[2]+=4;
    if (l>width/8) {
      wipe[2]=0;
    }
  }
```
