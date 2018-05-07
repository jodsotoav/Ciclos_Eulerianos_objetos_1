class Linea_dibujar extends Line {
  @Override
   void display() {
    pushStyle();
    strokeWeight(14);
    stroke(0, 255, 255);
    line(origin().position().x, origin().position().y, end().position().x, end().position().y);
    popStyle();
  }
  public Linea_dibujar(Node node1, Node node2){
    super(node1,node2);
   }
   }