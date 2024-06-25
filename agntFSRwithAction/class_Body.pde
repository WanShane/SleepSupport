/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */

class Body {
  int body_height;
  int body_width;
  int body_depth;
  Body(int body_height) {
    this.body_height = body_height;
    this.body_width = body_height-10;
    this.body_depth = body_height-10;
  }

  void agent_body() {
    pushMatrix();
    noStroke();
    translate(0, (headsize+this.body_height)/2, 0);
    fill(255, 230, 0, 128); // 填充颜色
    box(this.body_width, this.body_height, this.body_depth);
    popMatrix();
  }
}
