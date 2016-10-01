
import java.awt.Rectangle;

public class Collider{

  PVector position;
  PVector size;
  boolean traversable;

  public Collider(int pX, int pY, int sX, int sY){
    position = new PVector(pX, pY);
    size = new PVector(sX, sY);
    traversable = false;
  }

  void draw(){
    if(debugColliders){
      fill(0,0);
      strokeWeight(0.5);
      stroke(#ff0000);
      rect(position.x, position.y, size.x*8, size.y*8);
      noStroke();
    }
  }

  boolean isColliding(int pX, int pY, int sX, int sY){
    Rectangle r1 = new Rectangle(pX, pY, sX, sY);
    return r1.intersects(new Rectangle(int(position.x), int(position.y), int(size.x*8), int(size.y*8)));
  }

  int[] relativePosition(int pX, int pY, int sX, int sY){
    int a[] = new int[2];

    float b_collision = position.y+size.y*8 - pY;
    float t_collision = pY+sY - position.y;
    float l_collision = pX+sX - position.x;
    float r_collision = position.x+size.x*8 - pX;

    if (t_collision < b_collision && t_collision < l_collision && t_collision < r_collision ){
    //Top collision
      a[1] = 1;
    }
    if (b_collision < t_collision && b_collision < l_collision && b_collision < r_collision){
    //bottom collision
      a[1] = -1;
    }
    if (l_collision < r_collision && l_collision < t_collision && l_collision < b_collision){
    //Left collision
      a[0] = 1;
    }
    if (r_collision < l_collision && r_collision < t_collision && r_collision < b_collision ){
    //Right collision
      a[0] = -1;
    }

    return a;
  }

}
