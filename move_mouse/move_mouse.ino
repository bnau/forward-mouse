
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

const bool ARDUINO_PRINCIPAL = false;
const long unsigned int ACTIVATION_CODE_0 = 0x617058a7; // code d'activation de la souris (envoyé par la télécommande universelle)
const long unsigned int ACTIVATION_CODE_1 = 0x617008f7;

IRrecv irrecv(RECV_PIN);
decode_results results;

int compteurSequenceArret = 0;
bool isActive = ARDUINO_PRINCIPAL;
int clic=0;
int x=0;
int y=0;
int sizeArray = 37;
 
// Map code - souris
const long unsigned int xNoCLic[] = {
    0x3b9592da,// -18 
    0x00000000,// -17
    0x00000000,// -16
    0x00000000,
    0x46b3d13d,// -14
    0x00000000,
    0x00000000,
    0x00000000,
    0xd792adc7, // -10
    0x00000000,
    0x00000000,
    0x00000000,
    0x647e5908, // -6
    0x00000000,
    0x00000000,
    0x45936c03, // -3
    0x50b1aa62, // -2
    0x5641fa8c, // -1
    0x85e3c02a, // 0
    0xf892e861, // 1
    0xdecaaf25, // 2
    0xd3ac70c2, //3
    0x00000000,
    0x00000000,
    0x71df3081, // 6 
    0x00000000,
    0x00000000,
    0x00000000,
    0xe8f38b88, // 10
    0x00000000,
    0x00000000,
    0x00000000,
    0x5a14b224, // 14
    0x00000000,
    0x00000000,
    0x00000000,
    0x4af66d79 //18
  };

// Map code - souris
const long unsigned int xCLic[] = {
    0xa1732c11,
    0x00000000,
    0x00000000,
    0x00000000,
    0xb09170bc,
    0x00000000,
    0x00000000,
    0x00000000,
    0x3f704a20,
    0x00000000,
    0x00000000,
    0x00000000,
    0xc85bef19,
    0x00000000,
    0x00000000,
    0xad71085c,
    0xb88f46bf,
    0xbc1f93c3,
    0xab2fdaa1,
    0x00000000,
    0x1cb3e57e,
    0x1195a71f,
    0x00000000,
    0x00000000,
    0xc3d5d3e2,
    0x00000000,
    0x00000000,
    0x00000000,
    0x3684fc19,
    0x00000000,
    0x00000000,
    0x00000000,
    0xaa0b5263,
    0x00000000,
    0x00000000,
    0x00000000,
    0x9eed1400
  };

  // Map code - souris
const long unsigned int ySignals[] = {
    0xc83c093b,
    0x00000000,
    0x00000000,
    0x00000000,
    0xd35a479a,
    0x00000000,
    0x00000000,
    0x00000000,
    0x61d3f476,
    0x00000000,
    0x00000000,
    0x00000000,
    0xef24cc43,
    0x00000000,
    0x00000000,
    0xb99cc67a,
    0xc4bb04dd,
    0xde833e19,
    0x8f6735e5,
    0x67b90ec,
    0xeb40c2,
    0xf5cd0263,
    0x00000000,
    0x00000000,
    0xa80d2f26,
    0x00000000,
    0x00000000,
    0x00000000,
    0x1abc575d,
    0x00000000,
    0x00000000,
    0x00000000,
    0x8e42ada7,
    0x00000000,
    0x00000000,
    0x00000000,
    0x83246f44
  };
/*  
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
    
    if(isActive) Mouse.move(mi->dX, mi->dY);
};
void MouseRptParser::OnLeftButtonUp (MOUSEINFO *mi)
{
    //Serial.println("L Butt Up");
    if(isActive) Mouse.release(MOUSE_LEFT);
};
void MouseRptParser::OnLeftButtonDown (MOUSEINFO *mi)
{
    //Serial.println("L Butt Dn");
    if(isActive) Mouse.press(MOUSE_LEFT);
};*/

//USB     Usb;
//USBHub     Hub(&Usb);
//HIDBoot<USB_HID_PROTOCOL_MOUSE>    HidMouse(&Usb);
//MouseRptParser                               Prs;
void setup()
{
  
    //Serial.begin( 115200 );
   /*
#if !defined(__MIPSEL__)
    while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif
  */
  
//    Serial.println("Start");
//    if (Usb.Init() == -1)
//        Serial.println("OSC did not start.");
//    delay( 200 );
//    HidMouse.SetReportParser(0, &Prs);
    Mouse.begin();
    irrecv.enableIRIn(); // Start the receiver
}

void loop()
{
  if (irrecv.decode(&results)) {
    Serial.println(String(results.value, HEX));
    
    if((ARDUINO_PRINCIPAL && results.value == ACTIVATION_CODE_0) || (!ARDUINO_PRINCIPAL && results.value == ACTIVATION_CODE_1)){ 
      isActive = true;
    } else if (results.value == ACTIVATION_CODE_0 || results.value == ACTIVATION_CODE_1) {
      isActive = false;
    }

    if(isActive){
       if(results.value == 0xdf2d9f85){
        //clic = 0;
        x = 0;
      }
      else{
        for (int i=0; i<sizeArray; i++) {
          if(xNoCLic[i] == results.value) {
            clic=0;
            x = i-18;
            break;
          }
        }
      }
        for (int i=0; i<sizeArray; i++) {
          if(xCLic[i] == results.value) {
            clic=1;
            x = i-18;
            break;
          }
        }
        if(clic==1) {
          Mouse.press();
        } else {
          Mouse.release();
        }
        if(results.value == 0x6bd415e2){
        //clic = 0;
        y = 0;
        //Mouse.move(x, y);
      }
      else{
        for (int i=0; i<sizeArray; i++) {
          if(ySignals[i] == results.value) {
            y=i-18;
            break;
          }
        }
      }
      Mouse.move(x,y);
    }
    
    irrecv.resume(); // Receive the next value
    //Serial.println("x: " + String(x) + " ; y: " + String(y));
  }
}
