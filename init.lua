local ssid     = "pazzizo"
local password = "Pazzo gonna cut a bitch!"
local LED      = 4

function connect_to_wifi(ssid, password)
  wifi.setmode(wifi.STATION)
  wifi.sta.config(ssid, password)
  wifi.sta.connect()
end
function wait_for_ip(callback)
  tmr.create():alarm(100, tmr.ALARM_AUTO,
  function(t)
    if wifi.sta.getip() ~= nil then
      t:unregister()
      callback()
    end
  end)
end

function continue_with_wifi()
  gpio.write(LED, gpio.LOW)
  print('Connected to WiFi')
end

gpio.mode (LED, gpio.OUTPUT)
gpio.write(LED, gpio.HIGH)
connect_to_wifi(ssid, password)
wait_for_ip(continue_with_wifi)
