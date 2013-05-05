class Level {
  String levelNumber;
  String objective;
  String[] type;
  int[] neededToPass;
  float[] targetValue;

  //levels[i] = new Level(levelNumber, objective, type, neededToPass, targetValue);
  Level(int id, String _objective, String[] _type, int[] _neededToPass, float[] _targetValue) {
    levelNumber = getLevelNumber(id);
    objective = _objective;
    type = _type;
    neededToPass = _neededToPass;
    targetValue = _targetValue;
  }

  String getLevelNumber(int i) {
    String level;
    switch(i) {
    
      case 0:
      level = "one"; 
      break;
      
      case 1:
      level = "two"; 
      break;
      
      case 2:
      level = "three"; 
      break;
      
      case 3:
      level = "four"; 
      break;
      
      case 4:
      level = "five"; 
      break;
      
      case 5:
      level = "six"; 
      break;
      
      case 6:
      level = "seven"; 
      break;
      
      case 7:
      level = "eight"; 
      break;
      
      case 8:
      level = "nine"; 
      break;
      
      case 9:
      level = "final level"; 
      break;
      
      default:
      level = "ERROR: LEVEL NOT FOUND";
    }
    return level;
  }
}

