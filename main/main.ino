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
const String ACTIVATION_CODE = "617008f7"; // code d'activation de la souris (envoyé par la télécommande universelle)

IRrecv irrecv(RECV_PIN);
decode_results results;

int compteurSequenceArret = 0;
bool isActive = true;


class MouseRptParser : public MouseReportParser
{
protected:
  void OnMouseMove  (MOUSEINFO *mi);
  void OnLeftButtonUp (MOUSEINFO *mi);
  void OnLeftButtonDown (MOUSEINFO *mi);
};
void MouseRptParser::OnMouseMove(MOUSEINFO *mi)
{ 
    /*
    Serial.print("dx=");
    Serial.print(mi->dX, DEC);
    Serial.print(" dy=");
    Serial.println(mi->dY, DEC);
    */
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
};

USB     Usb;
USBHub     Hub(&Usb);
HIDBoot<USB_HID_PROTOCOL_MOUSE>    HidMouse(&Usb);
MouseRptParser                               Prs;
void setup()
{
    Serial.begin( 115200 );
   
#if !defined(__MIPSEL__)
    while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif
  
    Serial.println("Start");
    if (Usb.Init() == -1)
        Serial.println("OSC did not start.");
    delay( 200 );
    HidMouse.SetReportParser(0, &Prs);
    Mouse.begin();
    irrecv.enableIRIn(); // Start the receiver
}
void loop()
{
  if (irrecv.decode(&results)) {
    
    if(String(results.value, HEX) == ACTIVATION_CODE){ 
      isActive = !isActive;
      // Serial.println("Souris active : " + String(isActive));
    }
    irrecv.resume(); // Receive the next value
  }
  Usb.Task();
}
