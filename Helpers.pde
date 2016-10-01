Runnable throttle(Runnable callback, int delay){
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

Runnable throttleCounter(Runnable callback, int count){
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

public static class Time{

  static long initTime;
  static float deltaTime = 0;

  static void reset(long t){
    deltaTime = (t - initTime)/1000.0;
    initTime = t;
  }

}
