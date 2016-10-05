


public class MainScene extends Scene{

  int sceneWidth = int(GBSize.x*3);
  Murcielago bat= new Murcielago(72,0,8,8);
  MainScene(){
    this.addSpriteSheet("wall", "sprites/pared.png", 16, 16);

  }

  public void setup(){
    this.whipeAll();

    //player.position.x = 0;
    //player.position.y = int(GBSize.y-48)-4;

    ArrayList<Integer[][]> layers = parseLevel("levels/test.txt");
    for(Integer[][] layer : layers){
      int c = layers.indexOf(layer);
      for(int i = 0; i < layer.length; i++){
        int ydisp = layer.length-8;
        for(int j = 0; j < layer[i].length; j++){

          if(c == 0 && layer[i][j] == 0){
            player.position.x = j*16;
            player.position.y = (i-ydisp)*16;
          }
          //println(layer[i][j]);
          if(c > 0 && layer[i][j] == 1){
            Sprite s = this.addSprite(j*16, (i-ydisp)*16, "wall");
            s.setCollider(2, 2, 0, 0);
          }
        }
      }
    }

    //limites
    colliders.add(new Collider(-8, -144, 1, 36));
    colliders.add(new Collider(sceneWidth, -144, 1, 36));
  }

  public void draw(){

    for(Sprite s : sprites){
      s.draw();
    }

    player.draw();
    translate();

    for(Collider c : colliders){
      c.draw();
    }
    bat.physics();
    bat.draw();

  }

  public void drawGUI(){
    fill(#AEC440);//#D7E894);
    rect(0, int(GBSize.y-16), 16*10, 16);
  }

  void translate(){
    this.camera.x = constrain(player.position.x - GBSize.x/2 + 8, 0, sceneWidth-GBSize.x);
    this.camera.y = constrain(player.position.y - GBSize.y/2 + 8, -144, 0);
    //this.camera.y = player.position.y;
  }


}
