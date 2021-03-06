//Clase que nos ayudara a generar la figura 1
class Figura1{
  
  Body body;
  
  float w;
  float h;
  
  Figura1(float x,float y){
    w = 40;
    h = 40;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    Vec2 xy = box2d.coordPixelsToWorld(new Vec2(x,y));
    bd.position.set(xy);
    body = box2d.createBody(bd);
    body.setUserData(this);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 0.4;
    
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
    }
 
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(137,185,176);
    noStroke();
    ellipse(0,0,w,h);
    popMatrix();
    
  }
  
  void makeBody(Vec2 center){
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(center));
  body = box2d.createBody(bd);
  }
}

/*void sonido(){
      C4.play();
}*/