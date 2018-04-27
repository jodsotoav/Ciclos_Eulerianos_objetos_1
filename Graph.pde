/**
 Un grafo esta compuesto de un conjunto de nodos
 y un conjunto de lineas.
 */

class Graph {
  // 1. Attributes
  Node[] nodes;
  Line[] lines;
  Table tablaPunto;
  Table tablaConexiones;


  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  Graph() {

    nodes = new Node[int(random(5, 15))];
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i<5 ? new Circle() : new Rectangle();
    // conecta todos los nodos en bucle
    lines = new Line[nodes.length];
    for (int i = 0; i < lines.length; i++)
      if (i < lines.length-1)
        lines[i] = i< 5 ?new Line_normal(nodes[i], nodes[i+1]):new Linea_diferente(nodes[i], nodes[i+1]);
      else
        lines[i] = new Line_normal(nodes[i], nodes[0]);
  }

  // 2.2. Main constructor
  // file es un archico csv ubicado en la carpeta
  // data del sketch. Implemente este constructor
  // empleando Table (https://processing.org/reference/Table.html)
  Graph(String file, String file2) {

    tablaPunto = loadTable(file);
    int numNodos = tablaPunto.getRowCount();
    nodes=new Node[numNodos-1];
    for (int l=0; l< numNodos-1; l++) {
      float posx = tablaPunto.getFloat(l+1, 0);
      float posy = tablaPunto.getFloat(l+1, 1);
      nodes[l]= new Circle(new PVector(posx, posy), (float)30);

      tablaConexiones= loadTable(file2);
      //lines = new Line[nodes.length];
      int c=0;
      for (int i=0; i<4; i++) {  
        for (int j=0; j<4; j++) {
          float a= tablaConexiones.getFloat(i,j);
          if (a==1) {
            c++;
            
          }
        }
      }
        lines= new Line[c/2];
        for (int g = 0; g < lines.length; g++)
          if (g < lines.length-1)
        lines[g] = g<5 ?new Line_normal(nodes[g], nodes[g+1]):new Linea_diferente(nodes[g], nodes[g+1]);
      else
        lines[g] = new Line_normal(nodes[g], nodes[0]);
      }
     
    }
  




  void display() {
    pushStyle();
    strokeWeight(3);
    stroke(255, 255, 0);
    for (int i = 0; i < nodes.length; i++)
      nodes[i].display();
     for (int i = 0; i < lines.length; i++)
     lines[i].display();
    popStyle();
  }
}