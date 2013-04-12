class Level{
  String levelNumber;
  String objective;
  String[] type;
  int[] neededToPass;
  float[] targetValue;
  
  //levels[i] = new Level(levelNumber, objective, type, neededToPass, targetValue);
  Level(String _levelNumber, String _objective, String[] _type, int[] _neededToPass, float[] _targetValue){
    levelNumber = _levelNumber;
    objective = _objective;
    type = _type;
    neededToPass = _neededToPass;
    targetValue = _targetValue;
  } 
}
