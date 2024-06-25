/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */

float leftLegRotation = 0;
float rightLegRotation = 0;
float legRotationSpeed = radians(1);

class Leg {
  int leg_width, leg_height, leg_depth;
  Leg(int leg_width, int leg_height, int leg_depth) {
    this.leg_height = leg_height;
    this.leg_width = leg_width;
    this.leg_depth = leg_depth;
  }
  void agent_left_leg() {
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度
    translate(-(body_height/4), body_height*2, 0);
    fill(255, 204, 153, 200);
    box(leg_width, leg_height, leg_depth);
    popMatrix();
  }
  void agent_right_leg() {
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度
    translate(body_height/4, body_height*2, 0);
    fill(255, 204, 153, 200);
    box(leg_width, leg_height, leg_depth);
    popMatrix();
  }
  // 添加左腿的旋转逻辑
  void agent_left_leg_action() {
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度
    translate(-(body_height/4), body_height*2, 0);
    rotateX(leftLegRotation);
    fill(255, 204, 153, 200);
    box(leg_width, leg_height, leg_depth);
    popMatrix();
  }
  // 添加右腿的旋转逻辑
  void agent_right_leg_action() {
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度
    translate(body_height/4, body_height*2, 0);
    rotateX(rightLegRotation);
    fill(255, 204, 153, 200);
    box(leg_width, leg_height, leg_depth);
    popMatrix();
  }
}
