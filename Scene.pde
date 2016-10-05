
public abstract class Scene{

  public PVector camera = new PVector(0,0);

  ArrayList<Collider> colliders = new ArrayList<Collider>();
  private HashMap<String, SpriteSheet> spriteSheets = new HashMap<String, SpriteSheet>();
  ArrayList<Sprite> sprites = new ArrayList<Sprite>();

  public abstract void setup();
  public abstract void draw();
  public abstract void drawGUI();

  public void addSpriteSheet(String name, String imageSrc, int sX, int sY){
    spriteSheets.put(name, new SpriteSheet(imageSrc, sX, sY));
  }

  public Sprite addSprite(int pX, int pY, String spriteSheet){
    Sprite s = new Sprite(this, spriteSheet, pX, pY);
    sprites.add(s);
    return s;
  }

  public void whipeAll(){
    camera = new PVector(0, 0);
    colliders = new ArrayList<Collider>();
    sprites = new ArrayList<Sprite>();
  }

}
