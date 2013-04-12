class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
  
  //returns percent complete out of 1. 
  //i.e. 80% is returned as .80
  float percentComplete(){
    int passedTime = millis()- savedTime;
    float seconds = passedTime+millis()/savedTime;
    seconds /= 1000;
    float percent = seconds/(totalTime/1000);
    return percent;
  }
}
