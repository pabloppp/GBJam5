
public class Player{

  public PVector position;
  public PVector accel;
  public PVector size;
  boolean grounded = false;
  boolean jumping = false;
  int direction = 0;

  public Player(){
    position = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(16, 16);
  }

  void draw(){
    fill(#AEC440);
    rect(position.x, position.y, 16, 16);
    physics();
  }

  void physics(){
    position.y += accel.y;
    position.x += accel.x;
    accel.y += Time.deltaTime * 16; //Gravity
    if(accel.x > 0){
      accel.x -= Time.deltaTime * 7;
      if(accel.x < 0) accel.x = 0;
    }
    else if(accel.x < 0){
      accel.x += Time.deltaTime * 7;
      if(accel.x > 0) accel.x = 0;
    }

    if(keftKey.getPressed()){
      Keyboard.KeyEvent e = keftKey.getEvent();
      direction = -1;
      move(-1);
    }
    if(rightKey.getPressed()){
      Keyboard.KeyEvent e = rightKey.getEvent();
      direction = 1;
      move(1);
    }

    if(aKey.getPressed() && grounded){
      grounded = false;
      Keyboard.KeyEvent e = aKey.getEvent();
      if(e.count == 1){
        jump();
      }
    }

    for(Collider c: currentScene.colliders){
      if(!c.traversable){
        if(c.isColliding(int(position.x), int(position.y), int(size.x), int(size.y))){
          int pos[] = c.relativePosition(int(position.x), int(position.y), int(size.x), int(size.y));
          if(pos[1] == 1){
            if(accel.y > 9) window.shake(200, 3); //Shake if falling very fast
            position.y = c.position.y - (size.y-1);
            if(!jumping) accel.y = 0;
            grounded = true;
          }
          else if(pos[1] == -1){
            position.y = c.position.y + c.size.y*8;
            accel.y = 0;
          }
          if(pos[0] != 0){
            if(pos[0] == direction){
              if(pos[0] == -1) position.x = c.position.x + c.size.x*8;
              else if(pos[0] == 1) position.x = c.position.x - size.x;
              accel.x = 0;
            }
          }
        }
      }
    }
    jumping = false;

  }

  void jump(){
    jumping = true;
    accel.y = -5.2;
  }

  void move(int direction){
    accel.x = direction*2;
  }

}
