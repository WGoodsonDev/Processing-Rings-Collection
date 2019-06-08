class Ring{
  private float radius;
  public float noiseInit = random(0, 10);
  private float points[];
  
  public Ring(float baseRadius, float offset){
    radius = baseRadius + offset;
    points = new float[360];
    
    float currentNoise = noiseInit;
    for(int i = 0; i < 360; i++){
      float noiseVal = noise(currentNoise);
      points[i] = noiseVal;
        
      currentNoise += 0.01;
    }
  }
  
  public void display(){
    
    pushMatrix();
    translate(width/2, height/2);
    
    
    for(int i = 0; i < 360; i++){
      stroke(160, 100, 100);
      strokeWeight(6);
      
      if(points[i] >= 0.5){
        float hue = map(points[i], 0.5, 1.0, 180, 340);
        stroke(hue, 100, 100);
        point(0, -radius);
      }
        
        
      rotate(radians(1));
    }
    popMatrix();
    
  }
  
  public void noiseShift(){
    noiseInit += 0.01;
    float currentNoise = noiseInit;
    for(int i = 0; i < 360; i++){
      float noiseVal = noise(currentNoise);
      points[i] = noiseVal;
        
      currentNoise += 0.01;
    }
  }
}
