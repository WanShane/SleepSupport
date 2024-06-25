/*
 :::::::::::::::::::::::::define the agent from here:::::::::::::::::::::::::
 */
//define the agent's arm action: patting
/*
float rightArmRotation = 0; // 存储右臂的旋转角度
float rotationSpeed = radians(1); // 每帧旋转的角度
boolean armPatting = false; // 控制臂摆动的变量
float maxArmPattingRotation = radians(95); // 增加最大旋转角度
float minArmPattingRotation = radians(50); // 增加最小旋转角度
float armRotationSpeed = radians(2); // 加快旋转速度
*/
boolean armPatting = false; // 控制臂摆动的变量
float rightArmRotation = 0; // 存储右臂的旋转角度
float rotationSpeed = radians(1); // 每帧旋转的角度
float maxRotation = radians(37); // 最大旋转角度
float minRotation = radians(0); // 最小旋转角度

//define the agent's arm action: stroke
boolean armStroke = false; // 控制臂摆动的变量
float armStrokeY = 0; // Y轴摇摆角度，用于抚摸动作
float strokeSpeedY = radians(1); // Y轴摇摆速度
float maxArmStrokeRotation = radians(38); // 增加最大旋转角度
float maxStrokeY = radians(10); // Y轴最大摆动角度
float minStrokeY = radians(-2); // Y轴最小摆动角度

class Arm {

  int arm_width, arm_height, arm_depth;
  Arm(int arm_width, int arm_height, int arm_depth) {
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
  
  void agent_right_arm_action_patting() {
    if (armPatting) {
      rightArmRotation += rotationSpeed * 0.6; // 更新旋转角度
      if (rightArmRotation > maxRotation || rightArmRotation < minRotation) {
        rotationSpeed *= -1; // 改变旋转方向
      }
    }

    // 在绘制右臂之前应用旋转
    pushMatrix();
    stroke(0); // 设置线条颜色为黑色
    strokeWeight(2); // 设置线条宽度
    
    translate(0, 0, 0);
    rotateX(rightArmRotation); // 应用旋转
    theArm.agent_right_arm();
    popMatrix();
  }
  
/*
  void agent_right_arm_action_patting() {
    if (armSwinging) {
      rightArmRotation += armRotationSpeed *0.6; // 使用适当的旋转速度
      if (rightArmRotation > maxArmPattingRotation || rightArmRotation < minArmPattingRotation) {
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
*/

  void agent_right_arm_action_stroke() {
    // 更新手臂的摆动角度
    if (armStroke) {
      rightArmRotation += rotationSpeed * 0.05;
      if (rightArmRotation > maxArmStrokeRotation) {
        rotationSpeed *= 0;
      }
      armStrokeY += strokeSpeedY * 0.3;
      if (armStrokeY > maxStrokeY || armStrokeY < minStrokeY) {
        strokeSpeedY *= -1; // 改变摆动方向
      }
    }
    pushMatrix();
    // 将胳膊向前伸展
    translate(0, 0, 0);
    // 将胳膊向前伸展
    rotateX(maxArmStrokeRotation);
    // 围绕 Z 轴旋转胳膊以模拟抚摸动作
    rotateZ(armStrokeY);
    // 绘制胳膊
    theArm.agent_right_arm();
    popMatrix();
  }
}
