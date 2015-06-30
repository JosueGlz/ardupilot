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

static int pos;
static char buf[8];
char ch = 1

ch = hal.uartC->read();
buf[pos++] = ch;
if(pos >= 7){
pos = 0;
hal.console->printf("C: %c",buf);
}

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
#include <AP_HAL_Linux.h>
#include <AP_Common.h>
#include <AP_Scheduler.h>
#include <UARTDriver.h>

void userhook_SuperSlowLoop()
{

const AP_HAL::HAL& hal = AP_HAL_BOARD_DRIVER;

static AP_HAL::UARTDriver* uarts[] = {
    hal.uartA, // console
};
#define NUM_UARTS (sizeof(uarts)/sizeof(uarts[0]))


/*
  setup one UART at 57600
 */
static void setup_uart(AP_HAL::UARTDriver *uart, const char *name)
{
    if (uart == NULL) {
        // that UART doesn't exist on this platform
        return;
    }
    uart->begin(57600);
}


void setup(void) 
{
    /*
      start all UARTs at 57600 with default buffer sizes
     */
    setup_uart(hal.uartA, "uartA"); // console
    setup_uart(hal.uartB, "uartB"); // 1st GPS
    setup_uart(hal.uartC, "uartC"); // telemetry 1
    setup_uart(hal.uartD, "uartD"); // telemetry 2
    setup_uart(hal.uartE, "uartE"); // 2nd GPS
}

static void test_uart(AP_HAL::UARTDriver *uart, const char *name)
{
    if (uart == NULL) {
        // that UART doesn't exist on this platform
        return;
    }
    uart->printf("Hello on UART %s at %.3f seconds\n",
                 name, hal.scheduler->millis()*0.001f);
}

void loop(void) 
{	
    test_uart(hal.uartA, "uartA");
    test_uart(hal.uartB, "uartB");
    test_uart(hal.uartC, "uartC");
    test_uart(hal.uartD, "uartD");
    test_uart(hal.uartE, "uartE");

    // also do a raw printf() on some platforms, which prints to the
    // debug console
#if HAL_OS_POSIX_IO
    ::printf("Hello on debug console at %.3f seconds\n", hal.scheduler->millis()*0.001f);
#endif

    hal.scheduler->delay(1000);
}

AP_HAL_MAIN();

    
}
#endif
