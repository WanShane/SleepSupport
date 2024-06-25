/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */

class head {
  int headsize;
  head(int headsize) {
    this.headsize = headsize;
  }
  //agent's head
  void agent_head() {
    pushMatrix();
    noStroke();
    //填充颜色RGB(255,204,153)，半透明：透明值取128
    fill(255, 204, 153, 128);
    box(this.headsize);
    popMatrix();
    //return this.headsize;
  }
  //agent's eyes
  void agent_eyes(int eye_wide, int eye_height, int eye_depth) {
    //the left eye
    pushMatrix();
    translate(-eye_distant, -20, this.headsize/2);
    fill(0);
    //box(w, h, d)
    box(eye_wide, eye_height, eye_depth);
    popMatrix();
    //the right eye
    pushMatrix();
    translate(eye_distant, -20, this.headsize/2);
    fill(0);
    box(eye_wide, eye_height, eye_depth);
    popMatrix();
  }
  //agent's mouth
  void agent_mouth() {
    pushMatrix();
    //why x should be eye_distant??????????
    translate(eye_distant, 0, this.headsize/2+1);
    fill(255, 102, 51, 100);
    arc(-31, 0, 50, 100, radians(25), radians(155), OPEN);
    popMatrix();
  }
}
