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
#include <AP_HAL_AVR.h>
#include <AP_HAL_SITL.h>
#include <AP_HAL_PX4.h>
#include <AP_HAL_Linux.h>
#include <AP_HAL_Empty.h>
#include <AP_Common.h>
#include <AP_Baro.h>
#include <AP_ADC.h>
#include <AP_GPS.h>
#include <AP_InertialSensor.h>
#include <AP_Notify.h>
#include <DataFlash.h>
#include <GCS_MAVLink.h>
#include <AP_Mission.h>
#include <StorageManager.h>
#include <AP_Terrain.h>
#include <AP_Compass.h>
#include <AP_Declination.h>
#include <SITL.h>
#include <Filter.h>
#include <AP_Param.h>
#include <AP_Progmem.h>
#include <AP_Math.h>
#include <AP_AHRS.h>
#include <AP_Airspeed.h>
#include <AP_Vehicle.h>
#include <AP_ADC_AnalogSource.h>
#include <AP_NavEKF.h>
#include <AP_Rally.h>
#include <AP_Scheduler.h>
#include <UARTDriver.h>
#include <AP_BattMonitor.h>
#include <AP_RangeFinder.h>

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
    
    uartD->begin(57600);
    uart->println("Hello on UART D\n");
    
    
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
