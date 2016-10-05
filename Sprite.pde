

public class Sprite{

  Scene scene;
  PVector position;
  Collider collider;
  SpriteSheet spriteSheet;
  int frame = 0;

  public Sprite(Scene s, String spriteSheet, int pX, int pY){
    scene = s;
    position = new PVector(pX, pY);
    this.spriteSheet = s.spriteSheets.get(spriteSheet);
  }

  void draw(){
    if(spriteSheet != null){
      image(spriteSheet.get(frame), position.x, position.y);
    }
  }

  void setCollider(int sX, int sY, int pX, int pY){
    collider = new Collider(int(position.x), int(position.y), sX, sY);
    scene.colliders.add(collider);
  }

  void destroy(){
    if(collider != null){
      scene.colliders.remove(scene.colliders.indexOf(collider));
    }
    scene.sprites.remove(scene.sprites.indexOf(this));
  }

}
