float metaRotation = 0.0;

ArrayList<Ring> rings;
float baseRadius = 100;
float offset = 10;
int numRings = 10;

int frame = 0;

void setup(){
  size(800, 800, P2D);
  smooth(8);
  frameRate(60);
  noiseSeed(0);
  randomSeed(0);
  colorMode(HSB, 360, 100, 100);
  background(0, 100, 0);
  
  rings = new ArrayList();
  for(int i = 0; i < numRings; i++){
    rings.add(new Ring(baseRadius, offset));
    offset += 14;
  }
  
}

void draw(){
  background(0, 100, 0);
  for(int i = 0; i < rings.size(); i++){
    Ring currentRing = rings.get(i);
    if(frame % 1 == 0)
      currentRing.noiseShift();
    currentRing.display();
  }
  frame++;
  metaRotation += radians(1);
}
