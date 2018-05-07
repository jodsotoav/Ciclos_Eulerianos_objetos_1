class Graph {
  // 1. Attributes
  Node[] nodes;
  Line[] lines;
   Table tablaPunto;
  Table tablaConexiones;
  Table camino;


  Graph(String file, String file2, String file3) {
    camino= loadTable(file3);
    tablaPunto = loadTable(file);
    int numNodos = tablaPunto.getRowCount();
    nodes=new Node[numNodos];
    for (int l=0; l< numNodos; l++) {
      float posx = tablaPunto.getFloat(l, 0);
      float posy = tablaPunto.getFloat(l, 1);
      nodes[l]= l<3 ? new Circle(new PVector(posx, posy), (float)30): new Rectangle(new PVector(posx, posy), (float)30);
    }
    tablaConexiones= loadTable(file2);

    int c=0;
    for (int i=0; i<tablaConexiones.getRowCount(); i++) {  
      for (int j=0; j<tablaConexiones.getRowCount(); j++) {
        float a= tablaConexiones.getInt(i, j);
        if (a!=0) {
          c=(c+tablaConexiones.getInt(i, j));
        }
      }
    }


    lines = new Line[c];


    int p=0;
    for (int i=0; i<tablaConexiones.getRowCount(); i++) {
      for (int j=0; j< tablaConexiones.getRowCount(); j++) {
        if (tablaConexiones.getFloat(i, j)!=0) {

          lines[p]= i< 3 ? new Line_normal(nodes[i], nodes[j]):new Linea_diferente(nodes[i], nodes[j]);
          p++;
        }
      }
    }
  }

  void dibujar() {

    if (flag) {
      flag=false;
      for (int i=0; i<tablaPunto.getRowCount(); i++) {
        if (mouseX<tablaPunto.getFloat(i, 0)+30 & mouseX>tablaPunto.getFloat(i, 0)-30 & mouseY<tablaPunto.getFloat(i, 1)+30 & mouseY>tablaPunto.getFloat(i, 1)-30) {

          Y=i;
        }
      }
    } else {


      for (int j=0; j<tablaPunto.getRowCount(); j++) {
        if (mouseX< tablaPunto.getFloat(j, 0)+30 & mouseX> tablaPunto.getFloat(j, 0)-30 & mouseY< tablaPunto.getFloat(j, 1)+30 & mouseY> tablaPunto.getFloat(j, 1)-30) {

          if ((tablaConexiones.getFloat(Y, j)!=0) & (camino.getFloat(Y, j)==0)) {
            camino.setFloat(j, Y, camino.getFloat(j, Y)+1);
            camino.setFloat(Y, j, camino.getFloat(j, Y)+1);
            Linea_dibujar a = new Linea_dibujar(nodes[Y], nodes[j]);
            a.display();
            Y=j;
          }
        }
      }
    }
  }

  boolean comparar () {
    int p=0;
    for (int i=0; i<camino.getRowCount(); i++) {

      for (int j=0; j<tablaConexiones.getRowCount(); j++) { 

        if ((camino.getFloat(i, j) ==1)& (tablaConexiones.getFloat(i, j)==1)) {
          p++;

          if (p== (lines.length/2)) {

            ganar=true;
            if(current<4){

            current++;
            }
          }
        }
      }
    }
    return ganar;
  }
  void solucion(String file, float x, float y) {
    Table solucion;
    solucion = loadTable(file);
    if (x>410 & x<495 & y<580 & y>560) {
      int c=0;
      for (int i=0; i<solucion.getRowCount(); i++) {  
        for (int j=0; j<solucion.getRowCount(); j++) {
          float a= solucion.getInt(i, j);
          if (a!=0) {
            c++;
          }
        }
      }
      lines1 = new Line[c];         
      int p=0;
      int h=1;
      for (int i=0; i<solucion.getRowCount(); i++) {
        for (int j=0; j< solucion.getRowCount(); j++) {
          if (solucion.getFloat(i, j)==h) {
            lines1[p]= new Linea_dibujar(nodes[i], nodes[j]);
            p++;
            h++;
            i=0;
            j=0;
          }
        }
      }

      if (q<lines1.length) {
        lines1[q].display();
        q=q+1;
      }
    }
  }
  void display() {
    textSize(30);
    if(juego_normal){
    text("REINICIAR", 100, 580);
    text("SOLUCION", 400, 580);
    }
    pushStyle();
    strokeWeight(3);
    stroke(255, 255, 0);
    for (int i = 0; i < nodes.length; i++)
      nodes[i].display();
    for (int i = 0; i < lines.length; i++)
      lines[i].display();
    popStyle();
  }
  void reiniciar(float x, float y ) {
    if (x<235 & x>105 & y<580 & y>560) {
      q=0;
      flag=true;
      background(0, 0, 0);
      for (int i=0; i<camino.getRowCount(); i++) {
        for (int j=0; j<tablaConexiones.getRowCount(); j++) {
          camino.setFloat(i, j, 0);
        }
      }
    }
  }
  void leer_cordenadas(String b){
    
    tablaPunto=loadTable(b);
    float posx=mouseX;
    float posy=mouseY;
    if(c<5){
  tablaPunto.setFloat(a,0,posx);
  tablaPunto.setFloat(a,1,posy);
  
    }
      }

}
 
   
  