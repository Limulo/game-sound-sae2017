//-----------------------------------------------------------------------------
// file: midiio_osx.cpp
// desc: midi io osx implementation
//
// author: Ge Wang (gewang@cs.princeton.edu)
//         Perry R. Cook (prc@cs.princeton.edu)
//         Ari Lazier (alazier@cs.princeton.edu)
//-----------------------------------------------------------------------------
#include "midiio_osx.h"
#include <stdio.h>




//-----------------------------------------------------------------------------
// name: MidiOut()
// desc: constructor
//-----------------------------------------------------------------------------
MidiOut::MidiOut()
{
    UINT__ m_device_num = 0;
    m_midi_out = NULL;
    m_midi_port = NULL;
    m_midi_endpoint = NULL;
    m_msg[0] = '\0';
}




//-----------------------------------------------------------------------------
// name: ~MidiOut()
// desc: destructor
//-----------------------------------------------------------------------------
MidiOut::~MidiOut()
{
    this->close();
}




//-----------------------------------------------------------------------------
// name: open()
// desc: open a device
//-----------------------------------------------------------------------------
BOOL__ MidiOut::open( int device_num )
{
    OSStatus err = 0;

    // close    
    this->close();

    m_device_num = device_num;

    // get the number of devices
    int num_src = MIDIGetNumberOfDestinations();
    if( num_src < 1 )
    {
        sprintf( m_msg, "error: no MIDI destinations available" );
        goto error;
    }
    
    // check to see if device is in range
    if( device_num < 0 || device_num >= num_src )
    {
        sprintf( m_msg, "error: cannot open MIDI output device '%d'", device_num );
        goto error;
    }

    // create client
    err = MIDIClientCreate( CFSTR( "ChucK_MIDI_Output_Client" ),
                            NULL, NULL, &m_midi_out );
    if( err != noErr )
    {
        sprintf( m_msg, "error: cannot open MIDI output client" );
        goto error;
    }
    
    // make the port
    err = MIDIOutputPortCreate( m_midi_out,
                                CFSTR( "ChucK_MIDI_Output_Port" ),
                                &m_midi_port );
    if( err != noErr )
    {
        sprintf( m_msg, "error: cannot open MIDI output port" );
        goto error;
    }
    
    // source
    m_midi_endpoint = MIDIGetDestination( m_device_num );
    
    return TRUE;
    
error:
    this->close();
    
    return FALSE;
}




//-----------------------------------------------------------------------------
// name: close()
// desc: close the device
//-----------------------------------------------------------------------------
BOOL__ MidiOut::close( )
{
    // close midi out
    if( m_midi_endpoint )
    {
        MIDIEndpointDispose( m_midi_endpoint );
        m_midi_endpoint = NULL;
    }
    
    if( m_midi_port )
    {
        MIDIPortDispose( m_midi_port );
        m_midi_port = NULL;
    }
    
    if( m_midi_out )
    {
        MIDIClientDispose( m_midi_out );
        m_midi_out = NULL;
    }

    return TRUE;
}




//-----------------------------------------------------------------------------
// name: drain()
// desc: ...
//-----------------------------------------------------------------------------
BOOL__ MidiOut::drain()
{
    return TRUE;
}




//-----------------------------------------------------------------------------
// name: send()
// desc: send 1 BYTE__ midi message
//-----------------------------------------------------------------------------
UINT__ MidiOut::send( BYTE__ status )
{
    MidiMsg msg;

    // send
    msg.data[0] = status;
    
    return this->send( &msg, 1 );
}




//-----------------------------------------------------------------------------
// name: send()
// desc: send 2 BYTE__ midi message
//-----------------------------------------------------------------------------
UINT__ MidiOut::send( BYTE__ status, BYTE__ data1 )
{
    MidiMsg msg;

    // send
    msg.data[0] = status;
    msg.data[1] = data1;
    
    return this->send( &msg, 2 );
}




//-----------------------------------------------------------------------------
// name: send()
// desc: send 3 BYTE__ midi message
//-----------------------------------------------------------------------------
UINT__ MidiOut::send( BYTE__ status, BYTE__ data1, BYTE__ data2 )
{
    MidiMsg msg;

    // send
    msg.data[0] = status;
    msg.data[1] = data1;
    msg.data[2] = data2;
    
    return this->send( &msg, 3 );
}




//-----------------------------------------------------------------------------
// name: send()
// desc: send midi message
//-----------------------------------------------------------------------------
UINT__ MidiOut::send( const MidiMsg * msg, DWORD__ length )
{
    OSStatus err = 0;
    MIDIPacketList pl;
    
    if( length == 0 )
        length = 3;

    // fill the packet
    pl.numPackets = 1;
    pl.packet[0].timeStamp = 0;
    pl.packet[0].length = length;
    pl.packet[0].data[0] = msg->data[0];
    pl.packet[0].data[1] = msg->data[1];
    pl.packet[0].data[2] = msg->data[2];

    // go   
    err = MIDISend( m_midi_port, m_midi_endpoint, &pl );
    
    // check err
    if( err != noErr )
        sprintf( m_msg, "error: cannot send MIDI packet" );
    
    return err == noErr;
}



//-----------------------------------------------------------------------------
// name: MidiIn()
// desc: constructor
//-----------------------------------------------------------------------------
MidiIn::MidiIn()
{
    m_device_num = 0;
    m_midi_in = NULL;
    m_midi_port = NULL;
    m_midi_endpoint = NULL;

    pthread_mutex_init( &m_mutex, NULL );
    m_buffer.initialize( 1024, sizeof( MidiMsg ) );
    
    m_msg[0] = '\0';
}




//-----------------------------------------------------------------------------
// name: ~MidiIn()
// desc: destructor
//-----------------------------------------------------------------------------
MidiIn::~MidiIn( )
{
    this->close();
    pthread_mutex_destroy( &m_mutex );
}




//-----------------------------------------------------------------------------
// name: open()
// desc: open
//-----------------------------------------------------------------------------
BOOL__ MidiIn::open( int device_num )
{
    OSStatus err = 0;

    // close it first
    this->close();

    m_device_num = device_num;

    // get the number of devices
    int num_src = MIDIGetNumberOfSources();
    if( num_src < 1 )
    {
        sprintf( m_msg, "error: no MIDI sources available" );
        goto error;
    }
    
    // check to see if device is in range
    if( device_num < 0 || device_num >= num_src )
    {
        sprintf( m_msg, "error: cannot open MIDI input device '%d'", device_num );
        goto error;
    }

    // create client
    err = MIDIClientCreate( CFSTR( "ChucK_MIDI_Input_Client" ),
                            NULL, NULL, &m_midi_in );
    if( err != noErr )
    {
        sprintf( m_msg, "error: cannot open MIDI input client" );
        goto error;
    }
    
    // make the port
    err = MIDIInputPortCreate( m_midi_in,
                               CFSTR( "ChucK_MIDI_Input_Port" ),
                               midi_in_cb,
                               (void *)this,
                               &m_midi_port );
    if( err != noErr )
    {
        sprintf( m_msg, "error: cannot open MIDI input port" );
        goto error;
    }
    
    // connect to source
    m_midi_endpoint = MIDIGetSource( m_device_num );
    err = MIDIPortConnectSource( m_midi_port, m_midi_endpoint, NULL );
    if( err != noErr )
    {
        sprintf( m_msg, "error: cannot connect to MIDI source" );
        goto error;
    }
    
    return TRUE;
    
error:
    this->close();

    return FALSE;
}




//-----------------------------------------------------------------------------
// name: close()
// desc: close
//-----------------------------------------------------------------------------
BOOL__ MidiIn::close()
{
    // close midi out
    if( m_midi_endpoint )
    {
        MIDIEndpointDispose( m_midi_endpoint );
        m_midi_endpoint = NULL;
    }
    
    if( m_midi_port )
    {
        MIDIPortDispose( m_midi_port );
        m_midi_port = NULL;
    }
    
    if( m_midi_in )
    {
        MIDIClientDispose( m_midi_in );
        m_midi_in = NULL;
    }

    // pthread_cancel( m_cb_thread_id );

    return TRUE;    
}




//-----------------------------------------------------------------------------
// name: get()
// desc: get message
//-----------------------------------------------------------------------------
UINT__ MidiIn::recv( MidiMsg * msg )
{
    UINT__ r = 0;
    //pthread_mutex_lock( &m_mutex );
    r = m_buffer.get( msg, 1 );
    //pthread_mutex_unlock( &m_mutex );

    return r;
}




//-----------------------------------------------------------------------------
// name: Cbuffer()
// desc: constructor
//-----------------------------------------------------------------------------
CBuffer::CBuffer()
{
    m_data = NULL;
    m_data_width = m_read_offset = m_write_offset = m_max_elem = 0;
}




//-----------------------------------------------------------------------------
// name: ~CBuffer()
// desc: destructor
//-----------------------------------------------------------------------------
CBuffer::~CBuffer()
{
    this->cleanup();
}




//-----------------------------------------------------------------------------
// name: initialize()
// desc: initialize
//-----------------------------------------------------------------------------
BOOL__ CBuffer::initialize( UINT__ num_elem, UINT__ width )
{
    // cleanup
    cleanup();

    // allocate
    m_data = (BYTE__ *)malloc( num_elem * width );
    if( !m_data )
        return false;

    m_data_width = width;
    m_read_offset = 0;
    m_write_offset = 0;
    m_max_elem = num_elem;

    return true;
}




//-----------------------------------------------------------------------------
// name: cleanup()
// desc: cleanup
//-----------------------------------------------------------------------------
void CBuffer::cleanup()
{
    if( !m_data )
        return;

    free( m_data );

    m_data = NULL;
    m_data_width = m_read_offset = m_write_offset = m_max_elem = 0;
}




//-----------------------------------------------------------------------------
// name: put()
// desc: put
//-----------------------------------------------------------------------------
void CBuffer::put( void * data, UINT__ num_elem )
{
    UINT__ i, j;
    BYTE__ * d = (BYTE__ *)data;

    // copy
    for( i = 0; i < num_elem; i++ )
    {
        for( j = 0; j < m_data_width; j++ )
        {
            m_data[m_write_offset*m_data_width+j] = d[i*m_data_width+j];
        }

        // move the write
        m_write_offset++;

        // wrap
        if( m_write_offset >= m_max_elem )
            m_write_offset = 0;
    }
}




//-----------------------------------------------------------------------------
// name: get()
// desc: get
//-----------------------------------------------------------------------------
UINT__ CBuffer::get( void * data, UINT__ num_elem )
{
    UINT__ i, j;
    BYTE__ * d = (BYTE__ *)data;

    // read catch up with write
    if( m_read_offset == m_write_offset )
        return 0;

    // copy
    for( i = 0; i < num_elem; i++ )
    {
        for( j = 0; j < m_data_width; j++ )
        {
            d[i*m_data_width+j] = m_data[m_read_offset*m_data_width+j];
        }

        // move read
        m_read_offset++;
        
        // catch up
        if( m_read_offset == m_write_offset )
        {
            i++;
            break;
        }

        // wrap
        if( m_read_offset >= m_max_elem )
            m_read_offset = 0;
    }

    // return number of elems
    return 1;
}




//-----------------------------------------------------------------------------
// name: midi_in_cb()
// desc: ...
//-----------------------------------------------------------------------------
void MidiIn::midi_in_cb( const MIDIPacketList * list,
                         void * port_data,
                         void * connect_data )
{
    MidiIn * min = (MidiIn *)port_data;
    BYTE__ byte = 0;
    int n = 0, num_args = 0, num_left = 0, length = 0;
    MidiMsg msg;
    const MIDIPacket * packet = &list->packet[0];
    
    pthread_mutex_lock( &min->m_mutex );
    for( UINT__ i = 0; i < list->numPackets; i++, packet = MIDIPacketNext( packet ) )
    {
        length = packet->length;
        n = 0;
        
        while( n < length )
        {
            byte = packet->data[n++];

            if( byte & 0x80 ) // status byte
            {
                if( (byte & 0xf0) == 0xf0 ) // system msg
                    continue;

                if( ( (byte & 0xf0) == 0xc0 ) || ( (byte & 0xf0) == 0xd0 ) )
                    num_args = 1;
                else
                    num_args = 2;

                msg.data[0] = byte;
                msg.data[1] = 0;
                msg.data[2] = 0;
                num_left = num_args;
            }
            else // data byte
            {
                if( num_left == num_args )
                    msg.data[1] = byte;
                else
                    msg.data[2] = byte;

                num_left--;

                if( !num_left )
                {
                    if( ((msg.data[0] & 0xf0) == 0xc0) || ((msg.data[0] & 0xf0) == 0xd0) )
                        num_left = 1;
                    else
                        num_left = 2;

                    min->m_buffer.put( &msg, 1 );
                }
            }
        }
    }
    pthread_mutex_unlock( &min->m_mutex );
}
