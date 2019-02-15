int sensorValue;

int inputPin = A0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  sensorValue = analogRead(inputPin)/4;

  Serial.println(sensorValue, DEC);
  //Serial.write(sensorValue);

  delay(100); 
}
