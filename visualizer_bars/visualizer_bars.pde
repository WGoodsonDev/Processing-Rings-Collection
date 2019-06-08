import processing.sound.*;

FFT fft;
int bands = 8192;
float[] spectrum = new float[bands];
Amplitude amp;
AudioIn in;
Sound s;

float ampScalar;

float metaRotation = 0.0;

void setup(){
  size(1600, 900, P2D);
  colorMode(HSB, 360, 100, 100);
  
  s = new Sound(this);
  s.inputDevice(5);
  
  amp = new Amplitude(this);
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  in.start();
  amp.input(in);
  fft.input(in);
  
  //Sound.list();
  
}

void draw(){
  
  ampScalar = amp.analyze();
  
  background(0, 0, 0);
 
  
  fft.analyze(spectrum);

  fill(0, 0, 0);
  
  pushMatrix();
  translate(width/2, height/2);
  
  int bandsDivisor = 8;
  int barScale = 150;
  
  rotate(metaRotation);
  float rotateAmount = TWO_PI / (bands/bandsDivisor);
  
  for(int i = 0; i < bands/bandsDivisor; i++){
    float ampScale = map(ampScalar, 0, 0.3, 1, 3);
    float len = constrain(map(spectrum[i], 0, 0.15, 0, barScale * ampScale), 0, 350);
    float hue = map(spectrum[i], 0, 0.12, 180, 300);
    stroke(hue, 100, 100);
    
    pushMatrix();
    resetMatrix();
    float xPos = map(i, 0, bands/bandsDivisor, 0, width);
    line(xPos, height, xPos, height - spectrum[i]*height);
    popMatrix();
    
    
    line(100, 0, 100+len, 0);
    rotate(rotateAmount);
  }
  
  

  stroke(180, 100, 100);
  circle(0, 0, 200);
  popMatrix();
  
  
  metaRotation += radians(0.1);
}
