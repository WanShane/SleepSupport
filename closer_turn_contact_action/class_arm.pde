/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */
//define the agent's arm action
float rightArmRotation = 0; // 存储右臂的旋转角度
float rotationSpeed = radians(1); // 每帧旋转的角度
boolean armSwinging = false; // 控制臂摆动的变量
float maxArmRotation = radians(95); // 增加最大旋转角度
float minArmRotation = radians(50); // 增加最小旋转角度
float armRotationSpeed = radians(2); // 加快旋转速度

class arm {

  int arm_width, arm_height, arm_depth;
  arm(int arm_width, int arm_height, int arm_depth) {
    this.arm_height = arm_height;
    this.arm_width = arm_width;
    this.arm_depth = arm_depth;
  }
  void agent_left_arm() {
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度

    translate(-(body_height/2), body_height, 0);
    fill(255, 204, 153, 200);
    box(arm_width, arm_height, arm_depth);
    popMatrix();
  }
  void agent_right_arm() {
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度

    translate(body_height/2, body_height, 0);
    fill(255, 204, 153, 200);
    box(arm_width, arm_height, arm_depth);
    popMatrix();
  }

  void agent_right_arm_action() {
    if (armSwinging) {
      rightArmRotation += armRotationSpeed; // 使用适当的旋转速度
      if (rightArmRotation > maxArmRotation) {
        rightArmRotation = maxArmRotation; // 限制最大旋转角度
        armRotationSpeed *= -1; // 反转旋转方向
      } else if (rightArmRotation < minArmRotation) {
        rightArmRotation = minArmRotation; // 限制最小旋转角度
        armRotationSpeed *= -1; // 反转旋转方向
      }
    }

    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度
    
    translate(body_height/2, body_height, 0);
    rotateX(rightArmRotation);
    translate(-body_height/2, -body_height, 0);
    theArm.agent_right_arm();
    popMatrix();
  }
}
