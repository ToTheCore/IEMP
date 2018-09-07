-- ////////////////////////
--
-- Intelligent Energy Management Program (IEMP)
-- 
-- Version 0.1
--
-- Author: Miscellaniuz
--
-- ////////////////////////
 
-- Startup
print("Welcome to IEMP.")
os.sleep(0.5)
print("Initializing.")
os.sleep(1.5)
 
 
-- Variables //
tickcount = 2 --Update interval of monitor in sec
print ("Update interval is set to " .. tickcount .. " seconds.")
 
 
-- init //
local cb = peripheral.wrap("capacitor_bank_1")
local monitor = peripheral.wrap("top")
monitor.setTextColor(1)
-- monitor.setBackgroundColor(255) --deactivated for later
monitor.clear()
monitor.setCursorPos(1,1)
monitor.write("Current Energy Level\n")
 
 
-- end of init //
print("Done. Starting up.")
os.sleep(2)
 
-- main program //
while true do
  monitor.setCursorPos(1,2)
  energylevel = cb.getEnergyStored()
  monitor.write(energylevel)
  sleep(tickcount)
end
