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


uint16_t pwm = 1500;
void userhook_50Hz()
{
    
    uint8_t _channel_w=9;
    uint8_t _channel_r=7;
    
    uint16_t rcin=hal.rcin->read(_channel_r-1);
    
    pwm=rcin;
    hal.rcout->set_freq(0x0F,490);
    hal.console->printf("PWM at 490 Hz %u \n",pwm);
    hal.rcout->enable_ch(_channel_w-1);
    hal.rcout->write(_channel_w-1, pwm);
    
    hal.uartA->begin(57600);
    hal.uartA->printf("Hello World!");
    
    
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

void userhook_SuperSlowLoop()
{

    
    
}
#endif
