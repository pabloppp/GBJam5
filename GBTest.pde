
PVector GBSize = new PVector(160, 144);
Keyboard keyboard = new Keyboard();
Window window = new Window((int)GBSize.x, (int)GBSize.y);

float gameScale = 2;

boolean debugColliders = true;

//KEYS
Keyboard.Key keftKey = keyboard.newKey(LEFT);
Keyboard.Key rightKey = keyboard.newKey(RIGHT);
Keyboard.Key upKey = keyboard.newKey(UP);
Keyboard.Key downKey = keyboard.newKey(DOWN);

Keyboard.Key aKey = keyboard.newKey(32);

PFont gbClassic, m3x6;

Scene currentScene;

Player player;

void setup(){

  noStroke();
  frameRate(60);

  gbClassic = createFont("fonts/gb.ttf", 8);
  m3x6 = createFont("fonts/m3x6.ttf", 16);

  textFont(m3x6);

  window.setSize(int(GBSize.x*gameScale), int(GBSize.y*gameScale));
  window.setTitle("GameBoy");
  window.setPositionForce(int(displayWidth/2 - GBSize.x*gameScale/2), int(displayHeight/2 - GBSize.y*gameScale/2));

  // keftKey.pressed(new Runnable(){
  //   @Override
  //   public void run(){
  //     Keyboard.KeyEvent e = keftKey.getEvent();
  //     if(e.count == 0){
  //       window.translate(-window.width/2.0, 0f);
  //     }
  //   }
  // });
  //
  // rightKey.pressed(new Runnable(){
  //   @Override
  //   public void run(){
  //     Keyboard.KeyEvent e = rightKey.getEvent();
  //     if(e.count == 0){
  //       window.translate(window.width/2.0, 0f);
  //     }
  //   }
  // });
  //
  // upKey.pressed(new Runnable(){
  //   @Override
  //   public void run(){
  //     Keyboard.KeyEvent e = upKey.getEvent();
  //     if(e.count == 0){
  //       window.translate(0f, -window.height/2.0);
  //     }
  //   }
  // });
  //
  // downKey.pressed(new Runnable(){
  //   @Override
  //   public void run(){
  //     Keyboard.KeyEvent e = downKey.getEvent();
  //     if(e.count == 0){
  //         window.translate(0f, window.height/2.0);
  //     }
  //   }
  // });
  //
  // spaceKey.pressed(new Runnable(){
  //   @Override
  //   public void run(){
  //     Keyboard.KeyEvent e = spaceKey.getEvent();
  //     if(e.count == 0){
  //         window.shake(50, 5);
  //     }
  //   }
  // });

  player = new Player();
  currentScene = new MainScene();
  currentScene.setup();

}

void draw(){
  background(#D7E894);
  scale(gameScale, gameScale);

  //WORLD
  pushMatrix();
  translate(-currentScene.camera.x, -currentScene.camera.y);

  currentScene.draw();

  popMatrix();

  //GUI
  /*fill(#D7E894);
  rect(0, GBSize.y-16,GBSize.x,16);
  fill(#204631);
  text("Hello world 1 2 3", 4, GBSize.y-5);*/

  currentScene.drawGUI();

  //rect(5,5,10,1);
  keyboard.runActions();
  window.refresh();
  Time.reset(millis());
}

void keyPressed(){
  //println(keyCode);
  keyboard.bind(keyCode);
}

void keyReleased(){
  keyboard.unBind(keyCode);
}
