
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
int[] red = {
  255, 255, 255, 0, 0, 75, 143
};

int[] green = {
  0, 127, 255, 255, 0, 0, 0
};
int[] blue = {
  0, 0, 0, 0, 255, 130, 255
};
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
  //colors of background/bubbles(2)
  cycle_color = 0;
  cycle_color2 = 1;

  //cool effect
  disco = true;
}

void draw() {
  background(red[cycle_color], green[cycle_color], blue[cycle_color]);

  bubbleadd = true;
  bubblecount2 = bubblecount;

  for (int i = 0; i <= bubblecount2; i++) {
    if (disco) {
      fill(red[cycle_color2], green[cycle_color2], blue[cycle_color2]);
    }
    else {
      fill(random(255), random(255), random(255));
    }

    bubble_speed(i);
    check_sides(i);
    check_top_and_bottom(i);
    draw_bubble(i);
    change_color();
  }
}



void check_sides(int index) {
  if (bubbleX[index] >= width || bubbleX[index] <= 0) {
    bubblevelocityX[index] *= -1;

    if (bubbleadd) {
      bubblecount += 1;
      bubbleX[bubblecount] = bubbleX[index];
      bubbleY[bubblecount] = bubbleY[index];
      bubblevelocityX[bubblecount] = bubblevelocityX[index];
      bubblevelocityY[bubblecount] = -bubblevelocityY[index]+(int)random(5);
      bubbleadd = false;
    }
  }
}


void check_top_and_bottom (int index) {
  if (bubbleY[index] >= (height) || bubbleY[index] <= 0) {
    bubblevelocityY[index] *= -1;
    if (bubbleadd) {
      bubblecount += 1;
      bubbleX[bubblecount] = bubbleX[index];
      bubbleY[bubblecount] = bubbleY[index];
      bubblevelocityX[bubblecount] =-bubblevelocityX[index]+(int)random(5);
      bubblevelocityY[bubblecount] = bubblevelocityY[index];
      bubbleadd = false;
    }
  }
}


void draw_bubble(int i) {
  strokeWeight(0);
  stroke(red[cycle_color2], green[cycle_color2], blue[cycle_color2]);
  ellipse(bubbleX[i], bubbleY[i], 120, 120);
}

void bubble_speed (int index) {
  bubbleX[index]+=   bubblevelocityX[index];
  bubbleY[index]+= bubblevelocityY[index];
}

void change_color () {
  if (bubblecount2 > 500) {
    bubblecount2=0;
    bubblecount=0;
    cycle_color += 1;
    cycle_color2 += 1;
    if (cycle_color >= 7){
      cycle_color=0;
      cycle_color2 += 1;
    
  }
    if (cycle_color2 >= 7){
      cycle_color2=0;
    }
  }
}


  //Cool effect (on)
  void mousePressed() {
    disco=false;
  }

  //Cool effect (off)
  void keyPressed() {
    disco=true;
  }

