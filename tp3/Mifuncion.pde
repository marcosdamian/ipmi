void dibujarGrilla(int cantidadColumnas, int cantidadFilas, float espX, float espY, float offX) { // mi funcion

  //reduzco espacio para un margen
float espXReducido = espX - margen;
float espYReducido = espY - margen;

//recorre columnas y filas 
//si i es igual a 0 y i es menor a la cantidad de columnas va aumentar la grilla 
for (int i = 0; i < cantidadColumnas; i++) {
for (int j = 0; j < cantidadFilas; j++) {

// Calcula el centro de cada cuadrado
float centroX = i * espX + espX / 2 + offX;
float centroY = j * espY + espY / 2;

// mover la posicion 
centroX += (i == 0) ? -margen/4 : margen/4;
centroY += (j == 0) ? -margen/4 : margen/4;

// cambiar la  direccion de los cuadrados con if
if (i == 0 && j == 0) {
// Arriba a la izquierda
dirX = 1;
dirY = -1;
} 
else if (i == 1 && j == 0) {
// Arriba a la  derecha
dirX = 1;
dirY = 1;
} 
else if (i == 0 && j == 1) {
// Abajo a la izquierda
dirX = -1;
dirY = -1;
} 
else if (i == 1 && j == 1) {
// Abajo a la derecha
dirX = -1;
dirY = 1;
}

for (int k = 0; k < numCapas; k++) { // recorrer las capas 

  float d = dist(mouseX, mouseY, centroX, centroY); // Calculo donde esta el mouse

  if (d < 80) { // si el mouse < 80 va a pasar
    fill(random(255), random(255), random(255)); // para cambiar color
  } 
  else { // si no
    if (k % 2 == 0) {
      fill(colorNegro);
    } else {
      fill(colorBlanco); // se mantiene los colores originales 
    }
  }

//calculo cada tamaño de cuadrado para que se haga mas chiquito
float tamX = map(k, 0, numCapas, espXReducido, 0);
float tamY = map(k, 0, numCapas, espYReducido, 0);

// calcula el punto de fuga de x e y 
float factorFugaX = calcularFuga(espXReducido / 2.0);
float factorFugaY = calcularFuga(espYReducido / 2.0);
//calcula el desplazamiento de la capa segun la direccion que le asigne
float desvX = map(k, 0, numCapas, 0, factorFugaX * dirX);
float desvY = map(k, 0, numCapas, 0, factorFugaY * dirY);


pushMatrix(); // guarda coordenadas

translate(centroX + desvX, centroY + desvY); // mueve el origen al centro 

if (rotar) {
  rotate(angulo); // si la animacion activa se rota 
}

rect(0, 0, tamX, tamY); //dibujar cuadrado 

popMatrix();
       
   }
  }
 }
}
  
float calcularFuga(float valor) { // funcion que recibe valor para saber cuando los cuadrados se desplazan
return valor * 0.435;
}

void reiniciarTodo() { // funcion que no retorna valor y vuelve a reiniciar todo
  numCapas = numCapasInicial;
  colorNegro = color(0);
  colorBlanco = color(255);
  rotar = false;
  angulo = 0;
}
