import peasy.*;

float a = 0;
int count = 0;
ArrayList<Box> sponge;
PeasyCam cam;

void setup(){
 size(400, 400, P3D);
 cam = new PeasyCam(this, 500);
 sponge = new ArrayList<Box>();
 Box b = new Box(0, 0, 0, 200);
 sponge.add(b);
}

void mousePressed(){
  if((mouseButton == RIGHT)&&(count<3)){
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b : sponge){
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
    }
    sponge = next;
    count += 1;
  }
  else{
    if(mouseButton == RIGHT){
      println("Trop !! Mon ordi assume pas après !");
    }
  }
}

void draw(){
 background(0);
 stroke(255);
 noFill();
 colorMode(HSB, 100);
 ambientLight(100, 20, 20, 100, 100, 100);
 colorMode(RGB, 255);
 pointLight(100, 0, 0, 100, 100, 100);
 lights();
 translate(width/2, height/2);
 rotateX(a);
 rotateY(a);
 rotateZ(a);
 for (Box b : sponge){
   b.show();
 }
 a += 0.01;
}
