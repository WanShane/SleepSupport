/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */

class Head {
  int headsize;
  
  Head(int headsize) {
    this.headsize = headsize;
  }
  //agent's head
  void agent_head() {
    pushMatrix();

    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2);

    //填充颜色RGB(255,204,153)，半透明：透明值取128
    fill(255, 204, 153, 200);
    box(this.headsize);
    popMatrix();
    //return this.headsize;
  }
  //agent's eyes
  void agent_eyes(int eye_wide, int eye_height, int eye_depth) {
    //the left eye
    pushMatrix();
    noStroke();
    translate(-eye_distant, -20, this.headsize/2);
    fill(94, 40, 0);
    //box(w, h, d)
    box(eye_wide, eye_height, eye_depth);
    popMatrix();
    //the right eye
    pushMatrix();
    noStroke();
    translate(eye_distant, -20, this.headsize/2);
    fill(94, 40, 0);
    box(eye_wide, eye_height, eye_depth);
    popMatrix();
  }
  //agent's mouth
  /*
  void agent_mouth() {
   pushMatrix();
   translate(eye_distant, 0, this.headsize/2+1);
   fill(255, 102, 51);
   arc(-31, 0, 50, 100, radians(25), radians(155), OPEN);
   popMatrix();
   }
   */
  void agent_mouth() {
    pushMatrix();
    translate(0, 20, this.headsize/2+1); // 调整嘴巴的位置
    //noFill(); // 不填充颜色
    //stroke(0); // 设置线条颜色为黑色
    //strokeWeight(6); // 设置线条宽度
    // 绘制圆弧
    // arc(a, b, c, d, start, stop) 其中a, b是圆弧中心的x, y坐标
    // c, d是宽度和高度，start和stop是圆弧的起始和结束角度
    //arc(0, 0, 50, 20, 0, PI);
    fill(255, 102, 51);
    arc(0, 0, 50, 30, radians(25), radians(155), OPEN);
    popMatrix();
  }
}
