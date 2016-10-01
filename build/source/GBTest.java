import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GBTest extends PApplet {


float windowX, windowY;
float windowActualX, windowActualY;
int windowWidth = 320;
int windowHeight= 288;

int marginX = 16;
int marginY = 32;

Runnable refresh;

public void setup(){
  
  windowX = windowActualX = displayWidth/2 - 160;
  windowY = windowActualY = displayHeight/2 - 144;
  surface.setLocation((int)windowActualX, (int)windowActualY);
  surface.setAlwaysOnTop(true);
  surface.setTitle("Forest");
  noStroke();

  refresh = throttle(new Runnable(){
    @Override
    public void run(){
      surface.setLocation((int)windowActualX, (int)windowActualY);
      windowActualX = lerp(windowActualX, windowX, 0.5f);
      windowActualY = lerp(windowActualY, windowY, 0.5f);
    }
  }, 30);
}

public void draw(){
  println("hello world");
  background(0xd7e894);
  scale(2, 2);

  fill(82, 127, 57);
  rect(0,windowHeight/2-16,windowWidth/2,16);
  //rect(5,5,10,1);

  refresh.run();
}

public void keyPressed(){
  if(keyCode == RIGHT)
    windowX += windowWidth/4;
  else if(keyCode == LEFT)
    windowX -= windowWidth/4;
  else if(keyCode == UP)
    windowY -= windowHeight/4;
  else if(keyCode == DOWN)
    windowY += windowHeight/4;

  windowX = windowX < marginX ?
    marginX : windowX > displayWidth-windowWidth-marginX ?
    displayWidth-windowWidth-marginX : windowX;
  windowY = windowY < marginY ?
    marginY : windowY > displayHeight-windowHeight-marginY*3 ?
    displayHeight-windowHeight-marginY*3 : windowY;
}

public Runnable throttle(Runnable callback, int delay){
  final Runnable c = callback;
  final int d = delay;
  return new Runnable(){
    long lastTime = millis();
    @Override
    public void run(){
      if(millis() - lastTime > d){
        c.run();
        lastTime = millis();
      }
    }
  };
};

public Runnable throttleCounter(Runnable callback, int count){
  final Runnable c = callback;
  final int cMax = count;
  return new Runnable(){
    int counter = 0;
    @Override
    public void run(){
      if(counter >= cMax){
        c.run();
        counter = 0;
      }
      else counter++;
    }
  };
};
  public void settings() {  size(320, 288); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GBTest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
