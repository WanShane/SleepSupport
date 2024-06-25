/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */

class arm {
  int arm_width, arm_height, arm_depth;
  arm(int arm_width, int arm_height, int arm_depth) {
    this.arm_height = arm_height;
    this.arm_width = arm_width;
    this.arm_depth = arm_depth;
  }
  void agent_left_arm() {
    pushMatrix();
    translate(-(body_height/2), body_height, 0);
    fill(255, 204, 153, 128);
    box(arm_width, arm_height, arm_depth);
    popMatrix();
  }
  void agent_right_arm() {
    pushMatrix();
    translate(body_height/2, body_height, 0);
    fill(255, 204, 153, 128);
    box(arm_width, arm_height, arm_depth);
    popMatrix();
  }
}
