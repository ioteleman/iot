/*
#autor: amirhosein ataei
#subject: Randon numbers generated by TinyOS, sending by Node-Red via MQTT to Thingspeak
*/

#include "TinyOStoNode-Red.h"
#include "printf.h"

configuration TinyOStoNode-RedAppC{}
implementation
{
  components MainC, TinyOStoNode-RedC as App;
  components new AMSenderC(AM_MY_MSG);
  components new AMReceiverC(AM_MY_MSG);
  components new TimerMilliC();
  components ActiveMessageC;
  components RandomC;
  components PrintfC;
  components SerialStartC;
  App.Boot            -> MainC.Boot;
  App.Receive         -> AMReceiverC;
  App.AMSend          -> AMSenderC;
  App.SplitControl    -> ActiveMessageC;
  App.MilliTimer      -> TimerMilliC;
  App.Packet          -> AMSenderC;
  App.Random          -> RandomC;
}