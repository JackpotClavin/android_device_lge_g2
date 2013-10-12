/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <hardware_legacy/vibrator.h>
#include "qemu.h"

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#define THE_DEVICE "/sys/class/misc/tspdrv/enable"

/* Unlike most (all)? other Android devices, the LG G2 uses its 
vibrator sys file in the kernel for its *intensity* rather than
the *duration* of the vibration (Duration is normal). This means 
that sending would-be 100ms vibration down from the framework to
the kernel would really be a 10/127 vibration in the LG G2's world,
and it wouldn't stop either, since there's no duration parameter. The
workaround is to hardcode the intensity to 127 (might be changed) and
use the duration parameter passed from the framework and usleep that value,
then write the vibration off with a 0 signal to intensity.

TL;DR:

    1. Framework sends a 10ms vibration
    2. We write the hardcoded 127 to the /sys file and it turns on vibration
    3. We usleep(10ms) (with the vibration still running because
        that's how LG decided to do this
    4. We write 0 to the /sys file
    5. The vibrator turns off once we write the said 0
    6. We interperate this as a normal 10ms vibration signal
    7. People complain about what the intensity's supposed to be
        and I change its value
*/

int vibrator_exists()
{
    int fd;

#ifdef QEMU_HARDWARE
    if (qemu_check()) {
        return 1;
    }
#endif

    fd = open(THE_DEVICE, O_RDWR);
    if(fd < 0)
        return 0;
    close(fd);
    return 1;
}

int sendit(int timeout_ms)
{
    int nwr, ret, fd;
    char value[20];
    int intensity = 127;

#ifdef QEMU_HARDWARE
    if (qemu_check()) {
        return qemu_control_command( "vibrator:%d", timeout_ms );
    }
#endif

    fd = open(THE_DEVICE, O_RDWR);
    if(fd < 0)
        return errno;

    if (timeout_ms) {
        nwr = sprintf(value, "%d\n", intensity);
        ret = write(fd, value, nwr);
        usleep(timeout_ms * 1000);
        nwr = sprintf(value, "%d\n", 0);
        ret = write(fd, value, nwr);
    } else {
        nwr = sprintf(value, "%d\n", 0);
        ret = write(fd, value, nwr);
    }

    close(fd);

    return (ret == nwr) ? 0 : -1;
}
