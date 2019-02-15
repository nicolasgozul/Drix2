import processing.serial.*;

Serial port;

float posicionX1;
float ubicX1;

float x = 140;
float y = 30;

float xDrix = 512;
float yDrix = 600;

int ancho = 200;
int alto = 350;

int dir = 1;
int dir2 = 1;

float sensor;

int vel = 5;

PImage drix, fondo, virus1, virus2, virus3;

//Los viruses
float posX[]; 
float posY[];
int estado[];
float distancia=0;
int puntaje = 0;
int time = 0;

void setup()
{
  size(1024,768);
  fondo = loadImage ("fondoEstomago.png");
  drix = loadImage ("Drix.png");
  virus1 = loadImage ("Virus1.png");
  
  
   port = new Serial(this, Serial.list()[0], 9600);
  //port = new Serial(this,"/dev/cu.usbmodem1431",9600);
  
  posX = new float[100];
  posY = new float[100];
  
  estado = new int[100];
  
  for(int i=0;i<100;i++){
    
    
    posX[i] = random(400);              
    posY[i] = random(100);  
    
    estado[i]= 1;
  }//Cierre for 
}


void draw()
{
  background(0);
  //stroke(255);
  
  for(int i=0;i<100;i++){
    posY[i] = posY[i] + random(1,6);
  }
  
  for(int i=0;i<100;i++){
   if(estado[i] ==1){
     //ellipse(posX[i],posY[i],20,20);
     image (virus1,x,y,25,25);
   }
 }
  
 
  
  
  //Movimiento de la bolita
  x = x + vel * dir;
  y = y + vel * dir2;
  
  
  //Si llega al borde se devuelve
  if(x > 1024 || x < 0)
  {
    dir = dir * -1;
  }
  
  if(y < 0)
  {
    dir2 = dir2 * -1;
  }
  
  //Reiniciar al hacer punto
  if(y > 768)
  {
    y = 0;
    x = random(0,1024);
  }
  
  
  //usar el ultrasonido/potenciometro para jugar
  if(port.available() > 1)
  {
    sensor = port.read();
    posicionX1 = map(sensor,0,255,0,768);
    
  }
  
  
  //Hacer el jugador
  //Para jugar con mouse: posicionX1 = mouseY;  
  ubicX1 = posicionX1 - (ancho/2);
  image (drix,(ubicX1)+100,600);
  //rect(ubicX1,678,ancho,alto);
  
  
  
  //Rebote con el jugador
  /*if(x > 0 && x <= ancho + 10)
  {
    if(y >= posicionX1 - alto && y <= posicionX1 + alto)
    {
      dir = dir * -1;
    }
  }*/
  
  
  
  
}//Final draw
