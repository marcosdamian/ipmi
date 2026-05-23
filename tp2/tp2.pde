int estado; //variable guarda numero de pantalla
PImage img1, img2, img3, img4, img5, mee, meecumple, meebaile;
PFont tipo;
float transp;
float mastamañotext;
float velocidadTexto;

void setup(){
  
size(640,480);
println(estado);
frameRate (30);
//imagenes
img1=loadImage("cabra.jpeg");
img2=loadImage("cabra2.jpeg");
img3=loadImage("cabra3.jpeg");
img4=loadImage("cabra4.jpeg");
img5=loadImage("cabra5.jpeg");
mee=loadImage("mee.png");
meecumple=loadImage("meefelizcumple.jpeg");
meebaile=loadImage("cabrasbailando.png");
tipo=loadFont("TempusSansITC-48.vlw");
textFont(tipo,30);
estado = 0;
frameCount = 0;
mastamañotext = 30;
velocidadTexto = 1;
}

void draw(){
  

if(frameCount < 90){ //cambio automatico pantalla por tiempo de framecount
estado = 0;
} 
else if(frameCount >= 90 && frameCount < 180){
estado = 1;
}
else if(frameCount >= 180 && frameCount < 270){
estado = 2;
}
else if(frameCount >= 270 && frameCount < 360){
estado = 3;
} 
else if(frameCount >= 360 && frameCount < 450){
estado = 4;
} 

//pantalla 1
if(estado == 0){
image(img1, 0, 0, width, height);
cabravoladora();
float y = map(frameCount, 0, 85,710, 0); //animacion texto subir
textAlign(CENTER, CENTER);
textSize (55);
fill (0);
text("GOAT SIMULATOR\n El mejor juego de la historia\ny del mundo mundial  \n juegenlo papus\n yo no lo descargo por\n que ya lo tengo", width/2, y);
}

//pantalla 2
else if(estado==1){
image(img2, 0, 0, width, height);
cabracumple();
textAlign(CENTER, CENTER); // animacion texto +
fill (255);
textSize (mastamañotext);
text("Es un MMORPG no\n lineal en el que puedes crear\n tu prop-\n oh no me equivoque,\n es un sandbox\n caótico donde controlas\n una cabra! MEEEEE", width/2, height/2);
mastamañotext += 0.2; 
}
//pantalla 3
else if(estado==2){
  
image(img3, 0, 0, width, height);
push(); // push y pop para que no se rote todo solo en dentro de eso 
translate(width/2, height/2); // medicion del centro de donde gira
if(frameCount < 240){ //si framecount es menor 
rotate(radians(frameCount * 5)); //se va a rotar
}
textAlign(CENTER, CENTER);
text("¡Fue creado por\n el estudio sueco \nCoffee Stain North\n y dirigido por\n Santiago Ferrero!", 0, 0);
pop();
}

//pantalla 4

else if(estado==3){
image(img4, 0, 0, width, height);
cabrasbailando();
mastamañotext += velocidadTexto;

if(mastamañotext > 70){ // condicional para que + o - el texto
velocidadTexto = -1;
}
else if(mastamañotext < 30){
velocidadTexto = 1;
}
textAlign(CENTER, CENTER);
textSize(mastamañotext);
text("¡ Podes destruir y explotar\n TODO a tu paso\n ..mientras haces...\n MEEEEEEEE !", width/2, height/2);

}
//pantalla 5
else if(estado==4){
image(img5, 0, 0, width, height);

textSize (55);
transp = transp + 2;
fill(200,200,0, transp); // transparencia 
text("¡Muchas gracias\n por ver profe Matias!\n Hecho por \nMarcos Damián Gonzales", width/2, height/2-80);

stroke(0, transp);
strokeWeight(5);

if(dist(320,370,mouseX,mouseY) < 75){ //condicion para transparencia
fill(255,150,150, transp);
}
else{
fill(255,0,0, transp);
}
circle(320,370,150);
textSize(25);
fill(255, transp);
text ("Reiiiinicio",320,370,150);
}
}

void keyPressed(){
  //estado = estado + 1;
estado++;  //incremento en 1
println( estado );
if( estado > 4)  // si estado es mayor a cuatro
reiniciarVariables(); // se reinicia
}


void mousePressed (){
if(estado == 4 && dist(320,370,mouseX,mouseY) < 75){
reiniciarVariables();
  }
}

void mouseClicked (){
if(estado == 4 && dist(320,370,mouseX,mouseY) < 75){
reiniciarVariables();
  }
}

void reiniciarVariables(){ //se reinicia todo 
estado = 0;
frameCount = 0;
transp = 0;
mastamañotext = 30;
}
//funciones mias de cabras
void cabravoladora(){ 
  
float x = map(frameCount,10,85,710,0);
push();
translate(x, 100);
rotate(radians(frameCount * 10));
imageMode(CENTER);
image(mee, 0, 0, 150, 150);
pop();
imageMode(CORNER);
}

void cabracumple(){

float x = map(frameCount,90,180,710,0);
push();
translate(x, 250);
rotate(radians(frameCount*10));
imageMode(CENTER);
image(meecumple,0,0,150,150);
pop();
imageMode(CORNER);
}

void cabrasbailando(){

if(frameCount % 30 < 15){
image(meebaile, 200, 100, 250, 250);
}
}
