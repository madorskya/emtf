#include <iostream>
#include <iomanip>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/time.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include "sp12_macros.h"
#include "core_link.h"


using namespace std;



int prbs_enable_main(string command, int loopback_code, int type, bool force)
{
  //    uint32_t val;
    core_link cl(device_d);

    if (command.compare("gth") == 0)
    {
	  log_printf("setting PRBS mode for GTH: %d, code: %d, force: %d\n", type, loopback_code, force);
    }
    log_printf("done\n");

    return 0;
}
