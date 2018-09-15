-- ////////////////////////
--
-- Intelligent Energy Management Program (IEMP)
-- 
-- Version: 0.3c
--
-- Author: Miscellaniuz
--
-- ////////////////////////

-- @ version //
version = "0.3c" 

-- ToTheCore Utils import //
os.loadAPI("/Utils/Utils")

-- Variables //
tickcount = 2 --Update interval of monitor in sec
MinRF = 140000000 -- Minimum amount of RF storage before triggering energy backup system

-- Startup
Console.Init()
Console.ClearScreen()
Console.WriteLine(Console.Type.Info, "Welcome to IEMP.", m)
Console.WriteLine(Console.Type.Line, "---------------", m)
Console.WriteLine(Console.Type.Info, "We are running on version " .. version, m)
Console.WriteLine(Console.Type.Line, "---------------", m)
Console.WriteLine(Console.Type.Config, "Update interval is set to " .. tickcount, m)
Console.WriteLine(Console.Type.Config, "Minimum trigger is set to " .. MinRF, m)
Console.WriteLine(Console.Type.Line, "---------------", m)
Console.WriteLine(Console.Type.Init, "UtilsAPI loaded.", m)

-- init //
local cb = peripheral.wrap("capacitor_bank_1")
Console.WriteLine(Console.Type.Init, "Capacitor Bank 1 found.", m)
local monitor = peripheral.wrap("top")
Console.WriteLine(Console.Type.Init, "Monitor found on top.", m)
monitor.clear()
monitor.setTextColor(colors.green)
-- monitor.setBackgroundColor(255) --deactivated for later
monitor.setCursorPos(1,1)
monitor.write("Intelligent Energy Management Program [IEMP] ver " .. version)
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,3)
monitor.write("Current Energy Level")

-- end of init //
Console.WriteLine(Console.Type.Line, "---------------", m)
Console.WriteLine(Console.Type.Info, "Initialization done.", m)
Console.WriteLine(Console.Type.Hint, "Press CTRL+T to terminate the program.", m)


-- main program //
while true do
  monitor.setCursorPos(1,4)
  energylevel = cb.getEnergyStored()
  monitor.clearLine()

  number = energylevel -- avoid attempt to call nil error
  monitor.write(StringUtils.numformat(number).." RF")
  
  -- RF trigger //
  if energylevel < MinRF then
     redstone.setOutput("left", true)
     monitor.setTextColor(colors.red) -- Text red
     monitor.setCursorPos(1,5)
     monitor.write("Energy Backup active")
    elseif energylevel > MinRF then
      redstone.setOutput ("right", false)
      monitor.setTextColor(colors.green) -- Text back to green
      monitor.setCursorPos(1,5)
      monitor.clearLine() -- deleting "Energy Backup active"
  end

  
  sleep(tickcount)
  
end