
public class SpriteSheet{

  ArrayList<PImage> images = new ArrayList<PImage>();
  public SpriteSheet(String imageSrc, int sX, int sY){
    PImage tilesetImg = loadImage(imageSrc);
    int tilesW = tilesetImg.width/sX;
    int tilesH = tilesetImg.height/sY;
    for(int i=0;i<tilesH;i++){
      for(int j=0;j<tilesW;j++){
        images.add(tilesetImg.get(j*sX, i*sY, sX, sY));
      }
    }
  }

  PImage get(int p){
    return images.get(p);
  }

}
