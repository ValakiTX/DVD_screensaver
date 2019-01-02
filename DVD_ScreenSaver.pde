boolean hitCorner = false;

float secsFromBeginning = 0;
float seconds;

int edgesHit = 0;
int cornersHit = 0;
int frames = 0;

int sizeX = 150;
int sizeY = 110;
PVector loc = new PVector(140,290);
PVector pLoc = new PVector(140,190);
PVector spd = new PVector(1,1);

PImage DVD;

void setup()
{
  size(displayWidth, displayHeight);
  background(0);
  frameRate(100);
  strokeWeight(2);
  stroke(255);
  fill(255,255,255,127);
  DVD = loadImage("DVD.jpg");
}

int abc(float a)
{
  if(a - int(a) < 0.5)
  {
    return int(a);
  }
  else
  {
    return int(a) + 1;
  }
}

void draw()
{
  translate(width - 840, 40);
  clear();
  
  background(0);
  
  rect(-20, -20, 840, 640);
  fill(0);
  rect(0, 0, 800, 600);
  
  strokeWeight(2);
  stroke(255);
  fill(255,255,255,127);
  rect(loc.x,loc.y,sizeX,sizeY);
  image(DVD,loc.x,loc.y,sizeX,sizeY);
  
  
  loc.add(spd);
  
  pLoc = loc;
  
  if(loc.x + sizeX == 800)
  {
    spd.set( - spd.x,spd.y);
    edgesHit++;
  }
  if(loc.x == 0)
  {
    spd.set( - spd.x,spd.y);
    edgesHit++;
  }
  
  if(loc.y + sizeY == 600)
  {
    spd.set(spd.x, - spd.y);
    edgesHit++;
  }
  if(loc.y == 0)
  {
    spd.set(spd.x, - spd.y);
    edgesHit++;
  }
  
  if(loc.x == 0 && loc.y == 0)
  {
    hitCorner = true;
    edgesHit -= 2;
  }
  if(loc.x == 0 && loc.y + sizeY == 600)
  {
    hitCorner = true;
    edgesHit -= 2;
  }
  if(loc.x + sizeX == 800 && loc.y == 0)
  {
    hitCorner = true;
    edgesHit -= 2;
  }
  if(loc.x + sizeX == 800 && loc.y + sizeY == 600)
  {
    hitCorner = true;
    edgesHit -= 2;
  }
  
  frames++;
  secsFromBeginning += 1/frameRate;
  
  if(hitCorner)
  {
    cornersHit++;
    hitCorner = false;
    seconds = frames/cornersHit/frameRate;
  }
  
  fill(255);
  
  text("Seconds From Start:", -300, 25);
  text(int(secsFromBeginning), -300, 40);
  
  text("Edges Hit:", -300, 70);
  text(edgesHit, -300, 90);
  
  text("Corners Hit:", -300, 120);
  text(cornersHit, -300, 140);
  
  text("Est. Seconds Between Corner Hits:", -300, 170);
  if(cornersHit > 0)
  {
    text(abc(seconds), -300, 190);
  }
  else
  {
    text("---", -300, 190);
  }
}
