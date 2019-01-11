# Create an IoT sensor with NodeMCU and Lua

Following this tutorial:

[Create an IoT sensor with NodeMCU and Lua](https://blog.alexellis.io/iot-nodemcu-sensor-bme280/)

Using this board:

[HiLetgo NodeMCU 1.0 Development Board](https://www.amazon.com/gp/product/B010O1G1ES/)

But skipping the actual sensor part 😎. I'm using MacOS.

## Firmware Modules

I used the following:

`adc`, `bme280`, `cjson`, `file`, `gpio`, `http`, `i2c`, `mqtt`, `net`, `node`, `pwm`, `tmr`, `uart`, `wifi`

Of those, I think only `gpio`, `tmr` and `wifi` are required for this `init.lua` file.

[NodeMCU Custom Builds](nodemcu-build.com)

## Bash Commands

### Flash the Firmware

This requires `esptool.py`.

The `port` and `baud` rate will probably auto-detect correctly, but I had so many problems getting this to work that I will keep the explicit flags.

`sudo esptool.py write_flash --port /dev/tty.SLAB_USBtoUART --erase-all --flash_freq 80m --flash_mode dio --flash_size 4MB --no-compress 0x00000 nodemcu-1.5.4.1-final-14-modules-2019-01-10-21-08-15-float.bin`

### Control Board

This requires `nodemcu-uploader.py`. The `port` and `baud` can be left default; they are auto-detected correctly.
