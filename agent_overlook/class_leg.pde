/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */

class leg {
  int leg_width, leg_height, leg_depth;
  leg(int leg_width, int leg_height, int leg_depth) {
    this.leg_height = leg_height;
    this.leg_width = leg_width;
    this.leg_depth = leg_depth;
  }
  void agent_left_leg() {
    pushMatrix();
    translate(-(body_height/4), body_height*2, 0);
    fill(255, 204, 153, 128);
    box(leg_width, leg_height, leg_depth);
    popMatrix();
  }
  void agent_right_leg() {
    pushMatrix();
    translate(body_height/4, body_height*2, 0);
    fill(255, 204, 153, 128);
    box(leg_width, leg_height, leg_depth);
    popMatrix();
  }
}
