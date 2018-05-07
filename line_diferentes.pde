class Linea_diferente extends Line {
  @Override
   void display() {
    pushStyle();
    strokeWeight(5);
    stroke(0, 0, 255);
    
    line(origin().position().x, origin().position().y, end().position().x, end().position().y);
    popStyle();
  }
  public Linea_diferente(Node node1, Node node2){
    super(node1,node2);
   }
   }