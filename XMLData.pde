class XMLData {
  //this class parses level data from xml doc
  //and sends it to the LevelController class

  XMLElement[] data;

  XMLData(XMLElement[] _data) {
    data = _data;
    levelCont.initializeLevels(data.length);
  }

  void getLevelData() {
    for (int i = 0; i<data.length; i++) {
      //get level number
      XMLElement levelNumberNode = data[i].getChild(0).getChild(0);
      String levelNumber = levelNumberNode.getText();

      //get level objective
      XMLElement objectiveNode = data[i].getChild(1).getChild(0);
      String objective = objectiveNode.getText();

      //get level completion requirements
      int numRequirements = 0;
      int index = data[i].countChildren()-2;
      String[] type = new String[index];
      int[] neededToPass = new int[index];
      int[] targetValue = new int[index];

      for (int j = 0; j < index; j++) {
        XMLElement requirement = data[i].getChild(2+j);
        XMLElement typeNode = requirement.getChild(0);
        type[j] = typeNode.getChild(0).getText();
        XMLElement neededToPassNode = requirement.getChild(1);
        neededToPass[j] = int(neededToPassNode.getChild(0).getText());
        XMLElement targetValueNode = requirement.getChild(2);
        targetValue[j] = int(targetValueNode.getChild(0).getText());
      }
      levelCont.levels[i] = new Level(levelNumber, objective, type, neededToPass, targetValue);
    }
  }
}
