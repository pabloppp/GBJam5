
ArrayList<Integer[][]> parseLevel(String path){
  String lines[] = loadStrings(path);
  int sceneW = parseInt(lines[0].split(" ")[1]);
  int sceneH = parseInt(lines[1].split(" ")[1]);
  ArrayList<Integer[][]> layers = new ArrayList<Integer[][]>();
  int currentLayer = 0;
  int row = 0;
  for(int i = 5; i<lines.length; i++){
    if(lines[i].length() == 0 && i < lines.length-1) currentLayer++;
    if(layers.size()-1 < currentLayer){
      layers.add(new Integer[sceneH][sceneW]);
      row = 0;
    }
    String tiles[] = lines[i].split(",");
    if(tiles.length == sceneW){
      for(int j = 0; j < tiles.length; j++){
        layers.get(currentLayer)[row][j] = parseInt(tiles[j]);
      }
      row++;
    }
  }
  return layers;
}
