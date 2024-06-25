/*
:::::::::::::::::::::::::Just for
 drawing the agent:::::::::::::::::::::::::
 */
import processing.serial.*;
Serial myPort;

import processing.sound.*;
SoundFile stepSound;
SoundFile storyStart;

int eye_distant = 31;
//define the agent's headsize
int headsize = 120;
//define the agent's body height
int body_height = 90;
//define the rotation of agent
float turnRotation = -(PI/10);

/*
:::::::::::::::::::::::::Start From Here:::::::::::::::::::::::::
 */
Head theHead;
Body theBody;
Arm theArm;
Leg theLeg;

PImage photo;

int z_axis = 0;

int input_data_FSR = 0;

void setup() {
  // to get Arduino message from fsr:
  //myPort = new Serial(this, "COM6", 9600);
  myPort = new Serial(this, "/dev/cu.usbmodem1101", 9600);

  size(1200, 1000, P3D);
  smooth(8);

  photo = loadImage("data/bedroom-night.jpeg");
  stepSound = new SoundFile(this, "data/footstep_single.mp3");
  storyStart = new SoundFile(this, "data/story_start.wav");
  
  theHead = new Head(130);
  theBody = new Body(90);
  theArm = new Arm(15, 135, 20);
  theLeg = new Leg(30, 80, 20);
  
  storyStart.play();
}

void draw() {
  background(188);

  pushMatrix();
  imageMode(CENTER);
  translate(width/2, height/2, -10);
  image(photo, 0, 0, 1500, 1300);
  popMatrix();

  lights();
  

  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    input_data_FSR = int(inString);
  }

  translate(width/2, height/2, z_axis);

  if (input_data_FSR < 1022) {
    //打印FSR的数据
    print(input_data_FSR);
    print("\n");

    if (z_axis < 550) {
      z_axis++;
      //输出走路步伐的声音
      if (z_axis % 60 == 0) {
        stepSound.amp(0.2);
        stepSound.play();
      }
    }
  }
  if (z_axis == 550) {
    rotateY(turnRotation);
  }

  updateLegsRotation();
  //updateArmsRotation();

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

  if (key == '1') {
    armPatting = !armPatting;
    myPort.write('1');
    theArm.agent_right_arm_action_patting();
  } else if (key == '2') {
    armStroke = !armStroke;
    myPort.write('2');
    theArm.agent_right_arm_action_stroke();
  } else {
    theArm.agent_right_arm();
  }


  //draw agent's legs
  //theLeg.agent_left_leg();
  //theLeg.agent_right_leg();
  theLeg.agent_left_leg_action();
  theLeg.agent_right_leg_action();
}

//
void updateLegsRotation() {
  if (input_data_FSR < 1023) {
    leftLegRotation += legRotationSpeed;
    rightLegRotation -= legRotationSpeed;
    // 保持腿部旋转在一定范围内
    if (leftLegRotation > radians(35) || leftLegRotation < radians(-35)) {
      legRotationSpeed *= -1;
    } else if (z_axis == 550) {
      legRotationSpeed = 0;
    }
  }
}
