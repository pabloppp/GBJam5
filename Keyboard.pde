
public class Keyboard{

  private HashMap<Integer, Boolean> _pressedKeyCodes = new HashMap<Integer, Boolean>();
  private HashMap<Integer, ArrayList<Runnable>> _pressedKeyActions = new HashMap<Integer, ArrayList<Runnable>>();
  private HashMap<Integer, KeyEvent> _pressedKeyEvents = new HashMap<Integer, KeyEvent>();

  public void bind(int kC){
    _pressedKeyCodes.put(kC, true);
    if(_pressedKeyEvents.get(keyCode) == null) _pressedKeyEvents.put(kC, new KeyEvent(kC));
  }
  public void unBind(int kC){
    _pressedKeyCodes.put(kC, false);
    _pressedKeyEvents.remove(kC);
  }

  public void runActions(){
    for(int keyCode : _pressedKeyCodes.keySet()){
      if(_pressedKeyCodes.get(keyCode) == true && _pressedKeyActions.get(keyCode) != null){
        KeyEvent ke = _pressedKeyEvents.get(keyCode);
        for(Runnable r : _pressedKeyActions.get(keyCode)){
          r.run();
        }
        ke.increment();
      }
    }
  }

  public boolean isPressed(int k){
    if(_pressedKeyCodes.get(k) != null) return _pressedKeyCodes.get(k);
    else return false;
  }

  protected void onPress(int k, Runnable r){
    ArrayList<Runnable> actions = _pressedKeyActions.get(k);
    if(actions != null) actions.add(r);
    else{
      ArrayList<Runnable> runnables = new ArrayList<Runnable>();
      runnables.add(r);
      _pressedKeyActions.put(k, runnables);
    }
  }

  public Key newKey(int keyCode){
    return new Key(keyCode);
  }

  public class Key{
    int keyCode;
    Key(int keyCode){
      this.keyCode = keyCode;
    }
    void pressed(Runnable r){
      onPress(keyCode, r);
    }
    boolean getPressed(){
      return isPressed(keyCode);
    }
    KeyEvent getEvent(){
      _pressedKeyEvents.get(keyCode).increment();
      return _pressedKeyEvents.get(keyCode);
    }
  }

  public class KeyEvent{
    int key;
    int count;
    long elapsedTime;
    long initTime;
    KeyEvent(int key){
      this.key = key;
      elapsedTime = 0;
      initTime = millis();
      count = 0;
    }
    public void increment(){
      count++;
      elapsedTime = millis() - initTime;
    }
  }

}
