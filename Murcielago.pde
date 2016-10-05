public class Murcielago extends Enemy{

  public PVector currentposition;
  public PVector accel;
  public PVector size;
  public PVector initialposition;//
  float speed;
  float dX=1;

  public Murcielago (int pX, int pY, int sX, int sY){
    initialposition= new PVector(pX,pY);
    currentposition= new PVector(pX,pY);
    size= new PVector(sX,sY);
    
   
  }

    void physics(){
     
      
      //float dY;
      
      
      //position.y+=dY;
      currentposition.x+=dX;
      if (abs(currentposition.x-initialposition.x)>160){
        dX*=-1;
      }
    }
    
      
      
      
      
      
      void draw(){
     //recuerda que esto es el main
      fill(#AEC440);                   //dibujando mi enemiguito
      rect(currentposition.x,currentposition.y, 16, 16);
 
    } 
}



   
   
    