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

    Serial.print("#S|LOGTEST|[");
    Serial.print(String(mi->dX));
    Serial.print(" " + String(mi->dY));
    Serial.println("]#");

    if(isActive) Mouse.move(mi->dX, mi->dY);
      //Serial.println("dX: " + String(mi->dX) + " dY : " + String(mi->dY));
    
};
void MouseRptParser::OnLeftButtonUp (MOUSEINFO *mi)
{
    Serial.print("#S|LOGTEST|[");
    Serial.print("RELACHE_CLIC");
    Serial.println("]#");
    if(isActive) Mouse.release(MOUSE_LEFT);
};
void MouseRptParser::OnLeftButtonDown (MOUSEINFO *mi)
{
    Serial.print("#S|LOGTEST|[");
    Serial.print("CLIC_ACTIF");
    Serial.println("]#");
    if(isActive) Mouse.press(MOUSE_LEFT);
};

USB     Usb;
USBHub     Hub(&Usb);
HIDBoot<USB_HID_PROTOCOL_MOUSE>    HidMouse(&Usb);
MouseRptParser                               Prs;
void setup()
{
    Serial.begin( 115200 );
/*#if !defined(__MIPSEL__)
    while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif*/
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
    
    if(String(results.value, HEX) == "617008f7"){ 
      isActive = !isActive;
    }
    Serial.print("#S|LOGTEST|[");
    Serial.print(String(results.value, HEX));
    Serial.println("]#");
    irrecv.resume(); // Receive the next value
  }
  Usb.Task();
}
