/* ADXL335 - accelerometer */
#define X_INPUT A0
#define Y_INPUT A1
#define Z_INPUT A2
const unsigned int time_between_AC = 1;

// Raw Ranges:
// initialize to mid-range and allow calibration to
// find the minimum and maximum for each axis
const unsigned int xRawMin = 264;
const unsigned int xRawMax = 398;

const unsigned int yRawMin = 259;
const unsigned int yRawMax = 394;

const unsigned int zRawMin = 273;
const unsigned int zRawMax = 410;

#define ADDR_AC_X  40
#define ADDR_AC_Y  41
#define ADDR_AC_Z  42

// ---------------------------------------------- //
boolean bSendSerial = false;

// SETUP ///////////////////////////////////////////////////////////////////////////////
void setup() 
{
  Serial.begin( 9600, SERIAL_8N1 );
    
  // ACCCELEROMETER
  AC_init();
}

// LOOP ////////////////////////////////////////////////////////////////////////////////
void loop() 
{  
  
  AC_read( bSendSerial );
  
  //delay( 50 ); // put a delay so it isn't overwhelming  
}

// ACCELEROMETER ///////////////////////////////////////////////////////////////////////
void AC_init() 
{
  // do nothing
}

void AC_read( boolean b )
{
  delay( time_between_AC ); // delay needed to permit ADC to reset itself
  int xRaw = analogRead( X_INPUT );
  byte xScaled = map( xRaw, xRawMin, xRawMax, 0, 127 );
  xScaled = constrain(xScaled, 0, 127); // avoid values outside 0-127 range
  if( b )
  {
    Serial.write( ADDR_AC_X + 128 );
    Serial.write( xScaled );
  }
  
  delay( time_between_AC );
  int yRaw = analogRead( Y_INPUT );
  byte yScaled = map( yRaw, yRawMin, yRawMax, 0, 127 );
  yScaled = constrain(yScaled, 0, 127); // avoid values outside 0-127 range
  if( b )
  {
    Serial.write( ADDR_AC_Y + 128 );
    Serial.write( yScaled );
  }
  
  delay( time_between_AC );
  int zRaw = analogRead( Z_INPUT );
  byte zScaled = map( zRaw, zRawMin, zRawMax, 0, 127 );
  zScaled = constrain(zScaled, 0, 127); // avoid values outside 0-127 range
  if( b )
  {
    Serial.write( ADDR_AC_Z + 128 );
    Serial.write( zScaled );
  }  
}

// SERIAL EVENT ////////////////////////////////////////////////////////////////////////
// o - open 
// c - close
void serialEvent()
{
  byte b = Serial.read();
  
  if (b == 'o')
    bSendSerial = true;
  else if (b == 'c')
    bSendSerial = false;
}
