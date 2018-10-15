PImage[] card = new PImage[52];
int aCard = int(random(0,51));
int xpos = int(random(10,720));
int ypos = 50;
float yspeed = random(1,10);
boolean direction = random(1)>.5;        // True = right, false = left

void setup() {
  for(int i=0;i<52;i++) card[i] = loadImage(i+".jpg");      // Loading all card images and put them in respective array positions
  size(800,400);
  background(0x00,0x7F,0x01);
}

void draw() {
  if(xpos<-70||xpos>800) reset();    // Reset all variables to start if card out of frame
  
  image(card[aCard],xpos,ypos);      // Generate new card image
  
  if(direction) xpos = xpos + 10;    // Decide which way to go
  else xpos = xpos - 10;
  
  if(ypos>=300) bounce();            // Bounce if below frame
  
  yspeed = yspeed - 0.5;            // Gravity mechanic
  ypos = ypos - int(yspeed);
}

void reset() {
  aCard = int(random(0,51));
  xpos = int(random(10,720));
  ypos = 50;
  yspeed = random(-10,10);
  direction = random(1)>.5;
}

void bounce() {
  yspeed = yspeed * -0.75;
  ypos = ypos - 5;
}
