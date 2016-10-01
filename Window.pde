
public class Window{

  PVector pos;
  PVector targetPos;
  PVector shakeDisp;
  int width;
  int height;

  int marginX = 16;
  int marginY = 32;

  int shakeTimeLeft = 0;
  int shakeStrength = 5;

  public Window(int w, int h){
    pos = new PVector(0, 0);
    targetPos = new PVector(0, 0);
    shakeDisp = new PVector(0, 0);
    width = w;
    height = h;
  }

  public void setTitle(String title){
    surface.setTitle(title);
  }

  public void setSize(int w, int h){
    width = w;
    height = h;
    surface.setSize(width, height);
  }

  public void setPosition(int x, int y){
    targetPos.x = x;
    targetPos.y = y;
  }

  public void setPositionForce(int x, int y){
    targetPos.x = x;
    pos.x = x;
    targetPos.y = y;
    pos.y = y;
    surface.setLocation((int)pos.x, (int)pos.y);
  }

  public void refresh(){
    surface.setSize(width, height);
    surface.setLocation(int(pos.x+shakeDisp.x), int(pos.y+shakeDisp.y));
    float tempX = targetPos.x;
    float tempY = targetPos.y;
    pos.x = lerp(pos.x, tempX, 0.5);
    pos.y = lerp(pos.y, tempY, 0.5);

    if(shakeTimeLeft > 0){
      shakeTimeLeft -= int(Time.deltaTime*1000);
      if(shakeTimeLeft > 0){
        shakeDisp.x = random(-shakeStrength, shakeStrength);
        shakeDisp.y = random(-shakeStrength, shakeStrength);
      }
      else{
        shakeDisp.x = 0;
        shakeDisp.y = 0;
        shakeTimeLeft = 0;
      }
    }

  }

  public void setMargin(int x, int y){
    marginX = x;
    marginY = y;
  }

  public void translate(float x, float y){
    targetPos.x += x;
    targetPos.y += y;

    targetPos.x = targetPos.x < marginX ?
      marginX : targetPos.x > displayWidth-width-marginX ?
      displayWidth-width-marginX : targetPos.x;

    targetPos.y = targetPos.y < marginY ?
      marginY : targetPos.y > displayHeight-height-marginY*3 ?
      displayHeight-height-marginY*3 : targetPos.y;
  }

  public void shake(int duration, int strength){
    shakeTimeLeft = duration;
    shakeStrength = strength;
  }

}
