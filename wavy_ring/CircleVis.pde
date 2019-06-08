public class CircleVis{
  
  public ArrayList<VisPoint> points;
  PShape visShape;
  
  public CircleVis(int numPoints){
    points = new ArrayList();
    
    for(int i = 0; i < numPoints; i++){
      points.add(new VisPoint(i, 0));
    }
  }
  
  public void display(){
    visShape = createShape();
    visShape.beginShape();
    visShape.fill(0, 0, 100);
    visShape.noStroke();
    for(int i = 0; i < points.size(); i++){
      VisPoint currentPt = points.get(i);
      //visShape.vertex(currentPt.)
    }
  }
  
  
}
