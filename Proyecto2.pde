//Importo las librerías a mi proyecto
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import processing.sound.*;
import org.jbox2d.dynamics.contacts.*;

//Declaro las variables
Box2DProcessing box2d;
ArrayList <Figura1> Figuras1;
ArrayList<Figura2> Figuras2;
Boundary suelo;
SoundFile C4;
SoundFile C7;


int Escenario = 0;
int Instrucciones = 0;

//Doy las condiciones iniciales a mi proyecto
void setup(){
size(900,650);
box2d = new Box2DProcessing(this);
box2d.createWorld();
box2d.setGravity(0,-20);
box2d.listenForCollisions();
Figuras1 = new ArrayList<Figura1>();
Figuras2 = new ArrayList<Figura2>();
suelo = new Boundary(width/2,height,width,1);
C4 = new SoundFile(this, "C4.mp3");
C7 = new SoundFile(this, "C7.mp3");
cursor(CROSS);
}

//
void draw(){
  background(226,252,247);
  suelo.display();
  box2d.step();
  // Pantalla de Inicio
  if(Escenario == 0){
    textAlign(CENTER);
    textSize(200);
    fill(72,112,102);
    text("AUVI", width/2,250); 
    textSize(20);
    text("Para iniciar presiona\nENTER",width/2,550);
  }
  if (key == ENTER){
    Escenario = 1;
  }
  //Pantalla de interacción
  if(Escenario == 1){
    if(Instrucciones == 0){
    fill(72,112,102);
    textSize(15);
    textAlign(CENTER);
    text("Instrucciones: TAB",width/2,25);
    noStroke();
    rectMode(CENTER);
    fill(72,112,102,90);
    rect(width/2,20,200,25);
    }
  for(Figura1 f1: Figuras1){
   f1.display();
 }
 for(Figura2 f2: Figuras2){
   f2.display();
 }
 //Pantalla de instrucciones
 if (key == TAB){
   textAlign(CENTER);
   noStroke();
   fill(72,112,102,90);
   rect(width/2,height/2,700,450);
   fill(72,112,102);
   textSize(30);
   text("INSTRUCCIONES",width/2,140);
   textAlign(LEFT);
   textSize(20);
   text("Mueve el puntero por la pantalla",120,260);
   text("Presiona la tecla 'W' para generar figuras circulares",120,300);
   text("Presiona la tecla 'E' para generar figuras rectangulares",120,340);
   textAlign(CENTER);
   text("Presiona cualquier tecla para continuar",width/2,520);
   Instrucciones = 1;
 }
 }
}
 
 //Esto nos servira para que aparezca en pantalla la figura dependiendo de la tecla presionada
 void keyPressed(){
   if(Escenario == 1){
   if(key == 'w' || key == 'W'){
    Figura1 f1 = new Figura1(mouseX,mouseY);
    Figuras1.add(f1);
  }
  else if(key == 'e' || key == 'E'){
    Figura2 f2 = new Figura2(mouseX,mouseY);
    Figuras2.add(f2);
  }
}
}


//Esto nos servira para detectar colisiones
/*void beginContact(Contact cp){
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if(o1.getClass() == Boundary.class && o2.getClass() == Figura1.class){
    C4.play();
  }
}*/