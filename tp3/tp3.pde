//Url video: https://youtu.be/UIzBsZsS3e8

//mis hermosas variables
PImage cuadrados;
//cantidad de columnas y filas
int cantColumnas = 2;
int cantFilas = 2; 
// cantidad de cuadrados 
int numCapas = 10;
int numCapasInicial = 10;
//variable de colores principales
color colorNegro = color(0);
color colorBlanco = color(255);
//controlar el rotate
float angulo = 0;
boolean rotar = false;
//tamaño cuadrantes de la grilla
float espacioX, espacioY; 
float offsetX; 
// variables de direccion
float dirX = 0;
float dirY = 0;
//margen entre cuadrados
float margen = 12;

void setup() {
  size(800, 400);
  cuadrados = loadImage("cuadraditos.jpg");
  imageMode(CORNER);
  rectMode(CENTER);
  noStroke();
  //calcula espacio cada cuadrante 
  espacioX = 400 / (float)cantColumnas; // 200 px 
  espacioY = height / (float)cantFilas; // 200 px
  offsetX = 400; 
}

void draw() {

background(255);
image(cuadrados, 0, 0, 400, 400); 

//si la animacion esta true, aumenta la angulacion
if (rotar) {
  angulo += 0.02;
}
// mi funcion para dibujar la grilla
dibujarGrilla(cantColumnas, cantFilas, espacioX, espacioY, offsetX); 

}

void keyPressed() {
 

if (key == ' ') {
rotar = !rotar; 
}

if (key == '+') {
numCapas++;
}

else if (key == '-') {
if (numCapas > 2) {
numCapas--;
}
}

else if (key == 'c') {
colorNegro = color(random(255), random(255), random(255));
colorBlanco = color(random(255), random(255), random(255));
}

else if (key == 'r') {
reiniciarTodo();
}
}
