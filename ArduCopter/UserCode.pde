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
void userhook_50Hz()
{
    // put your 50Hz code here
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
#include "../libraries/AP_HAL_Linux/RCOutput_Navio.h"
#include <AP_HAL_Linux.h>
#include <stdlib.h>
#include <AP_HAL.h>
#include <AP_Common.h>
uint16_t pwm = 1500;
void userhook_SuperSlowLoop()
{
    uint8_t _channel_w=9;
    uint8_t _channel_r=7;
    
    uint16_t rcin=hal.rcin->read(_channel_r-1);
    
    if (rcin>1600) {
        hal.rcout->set_freq(0x0F,490);
        hal.console->printf(PWM at 490 Hz);
    } else {
        hal.rcout->set_freq(0x0F,50);
        hal.console->printf(PWM at 50 Hz);
    }

    pwm = 2000-pwm;
    hal.rcout->enable_ch(_channel-1);
    hal.rcout->write(_channel-1, pwm);
}
#endif
