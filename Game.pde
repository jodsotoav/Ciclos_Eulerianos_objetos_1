/**
 Para cambiar el 'nivel' presione cualquier tecla
 */

Graph[] levels;
// total, current por defecto vale 0
// ver: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html
int total, current;


void setup() {
  size(600, 600);
  // numero total de niveles
  total = 3;
  levels = new Graph[total];
  for (int i = 0; i < levels.length; i++)
    levels[0] = new Graph ("puntos1.csv","conexiones1.csv");
    levels[1] = new Graph ("puntos2.csv","conexiones2.csv");
    levels[2]= new Graph ("puntos3.csv","conexiones3.csv");  
    //levels[i]=  new Graph();
}

void draw() {
  background(0,0,0);
  levels[current].display();
}

void keyPressed() {
  current = current < total-1 ? current+1 : 0;
}