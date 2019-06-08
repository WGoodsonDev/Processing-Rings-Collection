float noiseInput = 0;
float ampScalar;

float metaRotation = 0.0;

void setup(){
  size(1600, 900, P2D);
  noiseSeed(0);
  colorMode(HSB, 360, 100, 100);

  
}

void draw(){
  
  
  background(0, 0, 0);


  fill(0, 0, 0);
  
  pushMatrix();
  translate(width/2, height/2);
  
  int bandsDivisor = 8;
  int barScale = 150;
  
  rotate(metaRotation);
  float rotateAmount = radians(1);
  
  for(int i = 0; i < 360; i++){
    // float ampScale = map(ampScalar, 0, 0.3, 1, 3);
    // float len = constrain(map(spectrum[i], 0, 0.15, 0, barScale * ampScale), 0, 350);
    float len = map(noise(noiseInput), 0, 1, 0, barScale);
    float hue = map(noise(noiseInput), 0, 1, 180, 320);
    stroke(hue, 100, 100);
    
    //pushMatrix();
    //resetMatrix();
    //float xPos = map(i, 0, 360, 0, width);
    //line(xPos, height, xPos, height - spectrum[i]*height);
    //popMatrix();
    
    
    line(100, 0, 100+len, 0);
    rotate(rotateAmount);
    noiseInput += 0.01;
  }
  
  

  stroke(180, 100, 100);
  circle(0, 0, 200);
  popMatrix();
  
  
  metaRotation += radians(0.1);
}
