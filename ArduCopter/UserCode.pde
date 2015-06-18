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
uint16_t pwm = 2000;
void userhook_SuperSlowLoop()
{
    uint8_t _channel=9;
    pwm = 3000 - pwm;
    hal.rcout->enable_ch(_channel-1);
    hal.rcout->write(_channel-1, pwm);
}
#endif
