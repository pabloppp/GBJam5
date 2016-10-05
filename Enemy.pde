
public class Enemy{
  
  public PVector position;
  public PVector accel;
  public PVector size;
  float speed;
      public Enemy (int pX, int pY, int sX, int sY){
        position.x=positionX;
        position.y=post
    speed=s;
    size = new PVector(16, 16);
    smooth();
      }
    
    void move(){
    position.x+=speed;
    position.y+=speed;
    
    
    }
    
    
    
    
    void draw(){ 
     //recuerda que esto es el main
      fill(#AEC440);                   //dibujando mi enemiguito
      rect(position.x, position.y, 16, 16);
      move();
      bounce();
    }
    void bounce(){       // se mueve de un lado a otro
      if ((position.x> width) || (position.x < 0)){ 
      speed = speed * -1; }
} 