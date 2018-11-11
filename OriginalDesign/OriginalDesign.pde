/*
  FALLING CARDS by Elias A., inspired by the classic victory animation from the built-in Microsoft application Solitaire.
  If the GitHub page only displays a green background, download the repo and run the Processing file on your computer.
  Window dimensions can be changed with the variables width and height
*/

PImage[] card = new PImage[52];
int aCard = int(random(1)*52);
int width = 1000;
int height = 500;
int xpos = int(random(10,width-80));
int ypos = 50;
float yspeed = random(-5,10);
boolean direction = random(1)>=.5;        // True = right, false = left

void settings() {
  size(width,height);
}

void setup() {
  for(int i=0;i<52;i++) card[i] = loadImage("https://github.com/eliasa2019/OriginalDesign/blob/master/OriginalDesign/data/"+i+".jpg");      // Loading all card images and put them in respective array positions
  background(0x00,0x7F,0x01);
}

void draw() {
  if(xpos<-70||xpos>width) reset();    // Reset all variables to start if card out of frame
  
  image(card[aCard],xpos,ypos);      // Generate new card image
  
  if(direction) xpos = xpos + 10;    // Decide which way to go
  else xpos = xpos - 10;
  
  if(ypos>=height-100) bounce();            // Bounce if below frame
  
  yspeed = yspeed - 0.5;            // Gravity mechanic
  ypos = ypos - int(yspeed);
}

void reset() {
  aCard = int(random(1)*52);
  xpos = int(random(10,width-80));
  ypos = 50;
  yspeed = random(-5,10);
  direction = random(1)>=.5;
}

void bounce() {
  yspeed = yspeed * -0.8;
  ypos = ypos - 5;
}
