


public class MainScene extends Scene{
Murcielago bat= new Murcielago(40,0,8,8);
  MainScene(){
    this.addSpriteSheet("wall", "sprites/pared.png", 16, 16);
    
  }

  public void setup(){
    this.whipeAll();
    player.position.x = 0;
    player.position.y = int(GBSize.y-48);
    

    //SUELO
    //colliders.add(new Collider(0, int(GBSize.y-32), 40, 2));
    for(int i=0; i<20;i++){
      Sprite s = this.addSprite(i*16, int(GBSize.y-32), "wall");
      s.setCollider(2, 2, 0, 0);

      for(int j=0; j<i-10; j++){
        Sprite s2 = this.addSprite(i*16, int(GBSize.y-32-16*j), "wall");
        s2.setCollider(2, 2, 0, 0);
      }

    }

    for(int i=0; i<6;i++){
      Sprite s = this.addSprite(i*16, int(GBSize.y-80), "wall");
      s.setCollider(2, 2, 0, 0);
    }

    //limites
    colliders.add(new Collider(-8, -144, 1, 36));
    colliders.add(new Collider(int(GBSize.x*2), -144, 1, 36));
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
    this.camera.x = constrain(player.position.x - GBSize.x/2 + 8, 0, 160);
    this.camera.y = constrain(player.position.y - GBSize.y/2 + 8, -144, 0);
    //this.camera.y = player.position.y;
  }


}