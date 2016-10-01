
public abstract class Scene{

  public PVector camera = new PVector(0,0);

  ArrayList<Collider> colliders = new ArrayList<Collider>();

  public abstract void setup();
  public abstract void draw();
  public abstract void drawGUI();

}
