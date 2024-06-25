/*
:::::::::::::::::::::::::Just for
 drawing the agent:::::::::::::::::::::::::
 */

int eye_distant = 31;
//define the agent's headsize
int headsize = 120;
//define the agent's body height
int body_height = 90;

float turnRotation = -(PI/10);

/*
:::::::::::::::::::::::::Start From Here:::::::::::::::::::::::::
 */
head theHead;
body theBody;
arm theArm;
leg theLeg;

PImage photo;

int z_axis = 0;

void setup() {
  size(1200, 1000, P3D);
  smooth(8);

  photo = loadImage("bedroom-night.jpeg");

  theHead = new head(130);
  theBody = new body(90);
  theArm = new arm(15, 135, 20);
  theLeg = new leg(30, 80, 20);
}

void draw() {
  background(188);

  pushMatrix();
  imageMode(CENTER);
  translate(width/2, height/2, -200);
  image(photo, 0, 0, 1500, 1300);
  popMatrix();

  //lights();

  translate(width/2, height/2, z_axis);
  //A键：agent be closer to user
  if (key == 'a' || key == 'A') {
    if (z_axis < 580) {
      z_axis++;
    }
  }
  if (z_axis == 580) {
    rotateY(turnRotation);
  }

  updateLegsRotation();
  updateArmsRotation();

  //rotateY(frameCount * 0.01);
  //rotateY(mouseX * 0.01);
  //rotateX(mouseY * 0.01);

  //draw agent's head
  theHead.agent_head();
  //draw agent's eyes
  theHead.agent_eyes(10, 30, 10);
  //draw agent's mouth
  theHead.agent_mouth();
  //draw agent's body
  theBody.agent_body();
  //draw agent's arms
  theArm.agent_left_arm();
  //theArm.agent_right_arm();
  theArm.agent_right_arm_action();

  //draw agent's legs
  //theLeg.agent_left_leg();
  //theLeg.agent_right_leg();
  theLeg.agent_left_leg_action();
  theLeg.agent_right_leg_action();
}

void updateLegsRotation() {
  if (key == 'a' || key == 'A') {
    leftLegRotation += legRotationSpeed;
    rightLegRotation -= legRotationSpeed;
    // 保持腿部旋转在一定范围内
    if (leftLegRotation > radians(35) || leftLegRotation < radians(-35)) {
      legRotationSpeed *= -1;
    }
  }
}

void updateArmsRotation() {
  if (key == 's' || key == 'S') {
    armSwinging = !armSwinging;
  }
}
