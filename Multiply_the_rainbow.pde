
int circleX;
int circleY;
int velocityX;
int velocityY;
int bubblecount;
int bubblecount2;
boolean bubbleadd;

//MousePressed/keyPressed
boolean disco;

//Use arrays to store color values:
int[] red = {255, 255, 255, 0, 0, 75, 143};
int[] green = {0, 127, 255, 255, 0, 0, 0};
int[] blue = {0,0,0,0,255,130,255};
int cycle_color;
int cycle_color2;


//Use arrays to store coordinates of new bubbles
int[] bubbleX = new int[1000];
int[] bubbleY = new int[1000];

//Use arrays to store velocities of new bubbles
int[] bubblevelocityX = new int [1000];
int[] bubblevelocityY = new int [1000];
void setup() {
  strokeWeight(0);
  stroke(100, 0, 150);
  size(800, 600);
  circleX = mouseX;
  circleY = mouseY;
  velocityX = 7;
  velocityY = 7;
  bubblecount = 0;
  bubblecount2 = 0;
  bubbleX[0]=circleX;
  bubbleY[0]=circleY;
  bubblevelocityX[0]=velocityX;
  bubblevelocityY[0]=velocityY;
//colors of background/bubbles 
cycle_color = 0;
cycle_color2 = 1;

//cool effect
disco = true;




}
void draw() {
  background(red[cycle_color],green[cycle_color],blue[cycle_color]);
  
  
  bubbleadd = true;
  bubblecount2 = bubblecount;
  
  //Array is used to store 
  //For loop checks activities of each bubble that is created 
  //Bubblecount2 is used to prevent the for loop from expanding itself during the iteration 
  //Bubblecount is used to refer to the next index where the new bubble would be created 
  
  
  
  for (int i = 0; i <= bubblecount2; i++) {
    if (disco) {
    fill(red[cycle_color2],green[cycle_color2],blue[cycle_color2]);
    }
    else {
          fill(random(255),random(255),random(255));
    }
    bubbleX[i]+= bubblevelocityX[i];
    bubbleY[i]+= bubblevelocityY[i];

    if (bubbleX[i] >= width || bubbleX[i] <= 0) {
      bubblevelocityX[i] *= -1;

      if (bubbleadd) {
        bubblecount += 1;
        bubbleX[bubblecount] = bubbleX[i];
        bubbleY[bubblecount] = bubbleY[i];
        bubblevelocityX[bubblecount] = bubblevelocityX[i];
        bubblevelocityY[bubblecount] = -bubblevelocityY[i]+(int)random(5);
        bubbleadd = false;
      }
    }
    
    
    if (bubbleY[i] >= (height) || bubbleY[i] <= 0) {
      bubblevelocityY[i] *= -1;
      if (bubbleadd) {
        bubblecount += 1;
        bubbleX[bubblecount] = bubbleX[i];
        bubbleY[bubblecount] = bubbleY[i];
        bubblevelocityX[bubblecount] =-bubblevelocityX[i]+(int)random(5);
        bubblevelocityY[bubblecount] = bubblevelocityY[i];
        bubbleadd = false;
      }
    }
    
    //drawing new bubbles
    strokeWeight(0);
    stroke(red[cycle_color2],green[cycle_color2],blue[cycle_color2]);
    ellipse(bubbleX[i], bubbleY[i], 120, 120);
  }
  
  
  if (bubblecount2 > 500){
    bubblecount2=0;
    bubblecount=0;
    cycle_color += 1;
      if (cycle_color >= 7)
        cycle_color=0;
        
    cycle_color2 += 1;
     if (cycle_color2 >= 7)
       cycle_color2=0;
  }

}

//Cool effect (on)
  void mousePressed(){
    disco=false;
    
  }
  
//Cool effect (off)
  void keyPressed() {
    disco=true;
  }
  
