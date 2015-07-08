/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#ifdef USERHOOK_INIT
void userhook_init()
{
    // put your initialisation code here
    // this will be called once at start-up
}
#endif

#ifdef USERHOOK_FASTLOOP
void userhook_FastLoop()
{
    // put your 100Hz code here
}
#endif

#ifdef USERHOOK_50HZLOOP

#include <AP_HAL.h>
#include <AP_HAL_Linux.h>
#include <AP_Common.h>
#include <AP_Scheduler.h>
#include <UARTDriver.h>
#include <AP_Baro.h>

void userhook_50Hz()
{
/*
static int pos;
static char buf[8];
char ch = 1

ch = hal.uartC->read();
buf[pos++] = ch;
if(pos >= 7){
pos = 0;
hal.console->printf("C: %c",buf);
}
*/
}
#endif

#ifdef USERHOOK_MEDIUMLOOP
void userhook_MediumLoop()
{
    // put your 10Hz code here
}
#endif

#ifdef USERHOOK_SLOWLOOP
void userhook_SlowLoop()
{
    // put your 3.3Hz code here
}
#endif

#ifdef USERHOOK_SUPERSLOWLOOP
#include <AP_HAL.h>
#include <AP_HAL_Linux.h>
#include <AP_Common.h>
#include <AP_Scheduler.h>
#include <UARTDriver.h>


void userhook_SuperSlowLoop()

{
    /*
static AP_HAL::UARTDriver* uarts[] = {
    hal.uartA, // console
};

    uart->begin(57600);
    
    uart->printf("Hello on UART A");


    */
}
#endif
