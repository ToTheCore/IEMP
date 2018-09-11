-- ////////////////////////
--
-- Intelligent Energy Management Program (IEMP)
-- 
-- Version: 0.2
--
-- Author: Miscellaniuz
--
-- ////////////////////////

-- @ version //
version = "0.2" 
   
-- Startup
print("Welcome to IEMP.")
os.sleep(0.5)
print("We are running on version " .. version)
print("------------------------------------")
print("Initializing.")
os.sleep(1.5)
 
 
-- Variables //
version = "0.2"
tickcount = 2 --Update interval of monitor in sec
MinRF = 140000000 -- Minimum amount of RF storage before triggering energy backup system

print ("Update interval is set to " .. tickcount .. " seconds.")
print ("Minimum trigger is set to " .. MinRF .. " RF.") 
 
-- init //
local cb = peripheral.wrap("capacitor_bank_1")
local monitor = peripheral.wrap("top")
monitor.clear()
monitor.setTextColor(colors.green)
-- monitor.setBackgroundColor(255) --deactivated for later
monitor.setCursorPos(1,1)
monitor.write("Intelligent Energy Management Program [IEMP] ver " .. version)
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,3)
monitor.write("Current Energy Level")


-- end of init //
print("Done. Starting Monitoring...")
print("Press Ctrl+T to terminate the program.")
os.sleep(2)
 
-- main program //
while true do
  monitor.setCursorPos(1,4)
  number = cb.getEnergyStored()
  monitor.clearLine()
  --------------------------
  function comma(number)
    if string.len(number) < 6 then
    elseif string.len(number) > 6 then
      number = string.gsub(number, "^(-?%d+)(%d%d%d)(%d%d%d)", '%1.%2.%3')
    end
  return number
  end
  -----------------------
  
  monitor.write(comma(number).." RF")
  
  -- RF trigger //
  if number < MinRF then
     redstone.setOutput("left", true)
     monitor.setCursorPos(1,3)
     monitor.setTextColor(16384) --Text red
     monitor.write("Energy Backup active")
  end

  
  sleep(tickcount)
  
end