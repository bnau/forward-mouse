
#include <hidboot.h>
#include <usbhub.h>
#include <Mouse.h>
#include <IRremote.h>
// Satisfy the IDE, which needs to see the include statment in the ino too.
#ifdef dobogusinclude
#include <spi4teensy3.h>
#include <SPI.h>
#endif

const int RECV_PIN = 2;
const String ACTIVATION_CODE = "5c3aed17"; // code d'activation de la souris (envoyé par la télécommande universelle)

IRrecv irrecv(RECV_PIN);
decode_results results;

int compteurSequenceArret = 0;
bool isActive = true;
int clic = 0;
int x = 0;
int y = 0;
int sizeArray = 37;

// Map code - souris
const char* xNoCLic[] = {
  "3b9592da",
  "00000000",
  "00000000",
  "00000000",
  "46b3d13d",
  "00000000",
  "00000000",
  "00000000",
  "d792adc7",
  "00000000",
  "00000000",
  "00000000",
  "647e5908",
  "00000000",
  "00000000",
  "45936c03",
  "50b1aa62",
  "5641fa8c",
  "85e3c02a",
  "f892e861",
  "decaaf25",
  "d3ac70c2",
  "00000000",
  "00000000",
  "71df3081",
  "00000000",
  "00000000",
  "00000000",
  "e8f38b88",
  "00000000",
  "00000000",
  "00000000",
  "5a14b224",
  "00000000",
  "00000000",
  "00000000",
  "4af66d79"
};

// Map code - souris
const char* xCLic[] = {
  "de833e19",
  "00000000",
  "00000000",
  "00000000",
  "b09170bc",
  "00000000",
  "00000000",
  "00000000",
  "3f704a20",
  "00000000",
  "00000000",
  "00000000",
  "c85bef19",
  "00000000",
  "00000000",
  "ad71085c",
  "b88f46bf",
  "bc1f93c3",
  "ab2fdaa1",
  "00000000",
  "1cb3e57e",
  "1195a71f",
  "00000000",
  "00000000",
  "c3d5d3e2",
  "00000000",
  "00000000",
  "00000000",
  "3684fc19",
  "00000000",
  "00000000",
  "00000000",
  "aa0b5263",
  "00000000",
  "00000000",
  "00000000",
  "9eed1400"
};

// Map code - souris
const char* ySignals[] = {
  "00000000",
  "00000000",
  "00000000",
  "00000000",
  "d35a479a",
  "00000000",
  "00000000",
  "00000000",
  "61d3f476",
  "00000000",
  "00000000",
  "00000000",
  "ef24cc43",
  "00000000",
  "00000000",
  "b99cc67a",
  "c4bb04dd",
  "de833e19",
  "8f6735e5",
  "067b90ec",
  "00eb40c2",
  "f5cd0263",
  "00000000",
  "00000000",
  "a80d2f26",
  "00000000",
  "00000000",
  "00000000",
  "1abc575d",
  "00000000",
  "00000000",
  "00000000",
  "8e42ada7",
  "00000000",
  "00000000",
  "00000000",
  "83246f44"
};

class MouseRptParser : public MouseReportParser
{
  protected:
    void OnMouseMove  (MOUSEINFO *mi);
    void OnLeftButtonUp (MOUSEINFO *mi);
    void OnLeftButtonDown (MOUSEINFO *mi);
};
void MouseRptParser::OnMouseMove(MOUSEINFO *mi)
{

  //    Serial.print("dx=");
  //    Serial.print(mi->dX, DEC);
  //    Serial.print(" dy=");
  //    Serial.println(mi->dY, DEC);
  Serial.println("valeurs boitier : "+ String(mi->dX) + " " + String(mi->dY));
  if (isActive) Mouse.move(mi->dX, mi->dY);
};
void MouseRptParser::OnLeftButtonUp (MOUSEINFO *mi)
{
  Serial.println("L Butt Up");
  if (isActive) Mouse.release(MOUSE_LEFT);
};
void MouseRptParser::OnLeftButtonDown (MOUSEINFO *mi)
{
  Serial.println("L Butt Dn");
  if (isActive) Mouse.press(MOUSE_LEFT);
};

USB     Usb;
USBHub     Hub(&Usb);
HIDBoot<USB_HID_PROTOCOL_MOUSE>    HidMouse(&Usb);
MouseRptParser                               Prs;
void setup()
{

  Serial.begin( 115200 );
  /*
    #if !defined(__MIPSEL__)
    while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
    #endif
  */

  Serial.println("Start");
  if (Usb.Init() == -1)
    Serial.println("OSC did not start.");
  delay( 200 );
  HidMouse.SetReportParser(0, &Prs);
  Mouse.begin();
  irrecv.enableIRIn(); // Start the receiver
}

bool isEqual(char ref[], String myValue) {
  bool result = true;
  for (int i = 0; i < myValue.length(); i++) {
    if (myValue[i] != ref[i]) {
      return false;
    }
  }
  return result;
}

void loop()
{
  if (irrecv.decode(&results)) {
    Serial.println(String(results.value, HEX));
    if (String(results.value, HEX) == ACTIVATION_CODE) {
      isActive = !isActive;
      Serial.println("Souris active : " + String(isActive));
    }
    for (int i = 0; i < sizeArray; i++) {
      if (isEqual(xNoCLic[i], String(results.value, HEX))) {
        clic = 0;
        x = i - 18;
        break;
      }
    }

    for (int i = 0; i < sizeArray; i++) {
      if (isEqual(xCLic[i], (String(results.value, HEX)))) {
        clic = 1;
        x = i - 18;
        break;
      }
    }
    if (clic == 1) {
      //Mouse.press();
    } else {
      //Mouse.release();
    }
    for (int i = 0; i < sizeArray; i++) {
      if (isEqual(ySignals[i], (String(results.value, HEX)))) {
        y = i - 18;
        //Mouse.move(x, y);
        break;
      }
    }
    irrecv.resume(); // Receive the next value
    Serial.println("Values from move_mouse : x: " + String(x) + "y: " + String(y));
  }
  Usb.Task();
}
