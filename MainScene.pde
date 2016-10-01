
public class MainScene extends Scene{

  MainScene(){}

  public void setup(){
    player.position.x = 0;//GBSize.x/2 - 8;
    player.position.y = int(GBSize.y-48);

    //SUELO
    colliders.add(new Collider(0, int(GBSize.y-32), 40, 2));

    colliders.add(new Collider(0, 70, 10, 1));

    colliders.add(new Collider(50, int(GBSize.y-48), 2, 2));
    colliders.add(new Collider(50+16, int(GBSize.y-48), 2, 2));
    colliders.add(new Collider(50+32, int(GBSize.y-48), 2, 2));
    colliders.add(new Collider(50+48, int(GBSize.y-48), 2, 2));
    colliders.add(new Collider(50+64, int(GBSize.y-48-8), 2, 2));
    colliders.add(new Collider(50+80, int(GBSize.y-48-16), 2, 2));
    colliders.add(new Collider(50+96, int(GBSize.y-48-24), 2, 2));

    colliders.add(new Collider(-8, 0, 1, 18));
  }

  public void draw(){

    fill(#527F39);
    rect(32, 16, 16, 16);

    player.draw();
    translate();

    for(Collider c : colliders){
      c.draw();
    }
  }

  public void drawGUI(){
    fill(#527F39);
    rect(0, 16, 16, 16);
  }

  void translate(){
    this.camera.x = constrain(player.position.x - GBSize.x/2 + 8, 0, 160);
    //this.camera.y = player.position.y;
  }


}
