PImage img;
void setup(){
size(800,400);
img=loadImage("miObraArquitectonica.jpeg");
}

void draw(){
background(105, 152, 194);
textSize(24);
println(mouseX+"/"+mouseY);
//montaña
fill(189, 161, 124);
stroke (154, 133, 112);
circle(420, 320, 140);

//FOTO
image(img, 0, 0, 400, 400);

//piramide 1 
fill(236,211,188);
stroke(236,211,188);
triangle(699,155,682,270,490,280);
fill(204,169,128);
stroke(0);
triangle(699,155,672,277,775,277);

//pirámide 2 
fill(236,211,188);
stroke(236,211,188);
triangle(630,81,520,280,620,190);
fill(204,169,128);
stroke(0);
triangle(630,81,605,280,746,277); 

//pirámide 3 
fill(236,211,188);
stroke(236,211,188);
triangle(573,99,475,277,520,280);
fill(204,169,128);
stroke(0);
triangle(573,99,520,280,680,277);

//piso
stroke(204,169,128);
fill(210, 176, 125);
rect(400,275,400,400);

//pequeñas piramides 1 
fill(204,169,128);
stroke(0);
triangle(450,300,412,296,465,239);
fill(107, 68, 41);
rect(449,280,65,20);
fill(107, 68, 41);
rect(455,255,50,25);
fill(107, 68, 41);
rect(462,237,30,18);

//pequeñas piramides 2 (sumamos 90 px a la derecha a los ejes X)
fill(204,169,128); 
triangle(540,300,515,296,555,239);
fill(107, 68, 41); 
rect(539,280,65,20); 
fill(107, 68, 41); 
rect(545,255,50,25); 
fill(107, 68, 41); 
rect(552,237,30,18);

//pequeñas piramides 3
fill(206, 173, 132);
triangle(652,210,610,280,640,295);
fill(179, 140, 97); 
triangle(652,210,640,295,700,288);

//personitas
noStroke ();
fill(70);
rect(433,324,5,15);
rect(444,314,5,15);
rect(461,314,5,15);
rect(765,270,4,13);
rect(778,268,4,13);
rect(778,268,4,13);
rect(790,269,4,13);

// MONTAÑAS 1
fill(202, 168, 123);
stroke (236, 210, 177);
circle(620, 370, 100);
circle(551, 365, 100);
noStroke ();
fill(210, 176, 125);
rect(500,353,500,100);

//MONTAÑAS 2
fill(202, 168, 123);
stroke (236, 210, 177); // color linea
circle(750, 316, 72);
circle(709, 337, 70);
noStroke (); // quitar color linea
fill(210, 176, 125);
rect(672,317,500,100); // Cuadrado que tape los circle 
}
