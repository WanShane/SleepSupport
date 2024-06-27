void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); //通信速度
}

void loop() {
  // put your main code here, to run repeatedly:
  int fsr406 = analogRead(A0);
  Serial.println(fsr406);
  delay(1000);
}
