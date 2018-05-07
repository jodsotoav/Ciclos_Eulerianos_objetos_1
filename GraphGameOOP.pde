
Graph[] levels;
Graph[] constructor;
Line[] lines1;
int total, current, q=0, Y,T=0,a=-1 ,c=0;
boolean flag=true, ganar=false, nivel_creador=false, juego_normal=false, menu=true,node=true,line=false;

void setup() {
  size(600, 600);
  background(0, 0, 0);
  constructor=new Graph[1];
  constructor[0]=new Graph ("puntosC.csv","conexionesC.csv","caminoC.csv");
  total = 5;
  levels = new Graph[total];
  levels[0] = new Graph ("puntos1.csv", "conexiones1.csv", "camino1.csv");
  levels[1] = new Graph ("puntos2.csv", "conexiones2.csv", "camino2.csv" );
  levels[2]= new Graph ("puntos3.csv", "conexiones3.csv", "camino3.csv");  
  levels[4]= new Graph ("puntos5.csv", "conexiones5.csv", "camino5.csv"); 
  levels[3]= new Graph ("puntos4.csv", "conexiones4.csv", "camino4.csv");
 
}

void draw() {
  if (menu) {
    textSize(30);
    text("MENU", 250, 100);
    text("Juego normal", 100, 300);
    text("nivel creador", 100, 200);
  };
  if(nivel_creador){
  text("ok nodos", 100, 500);
    text("ok lineas", 400, 500);
    }


  if (juego_normal) {
    levels[current].comparar();
    levels[current].display();
    if (ganar) {
      background(0, 0, 0);
      ganar=false;
      flag=true;
    }
  }
 
}

void mousePressed() {
  if (juego_normal) {
    if (current==0) {
      levels[0].solucion("solucion1.csv", mouseX, mouseY);
    }
    if (current==1) {
      levels[1].solucion("solucion2.csv", mouseX, mouseY);
    }
    if (current==2) {
      levels[2].solucion("solucion3.csv", mouseX, mouseY);
    }
    if (current==3) {
      levels[3].solucion("solucion4.csv", mouseX, mouseY);
    }
    if (current==4) {
      levels[4].solucion("solucion5.csv", mouseX, mouseY);
    }

    levels[current].dibujar();
    levels[current].reiniciar(mouseX, mouseY);
  }
  if (nivel_creador) {
    if(c<6){
      if(node){
      c++;
    a++;
  }
    
  ellipse(mouseX,mouseY,30,30);
     //constructor[0].leer_cordenadas("puntosC.csv");
 }
}
}
void mouseClicked() {
  if(menu){
  if (mouseX<277 & mouseX> 107 & mouseY<200 & mouseY>183) {
    nivel_creador=true;
    menu=false;
    background(0, 0, 0);
  }
  if (mouseX<285 & mouseX> 110 & mouseY<305 & mouseY>280) {
    juego_normal=true;
    menu=false;
    background(0, 0, 0);
  }
  }
  
  
}