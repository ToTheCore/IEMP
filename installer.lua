--- Script for installing MonitorHandler.
--- Don't remove this script, or change anything in here.
local thisRepoName = "IEMP"

-- Try removing the old MonitorHandler installer.
term.setTextColor(colors.green)
print("Try removing old installer")
term.setTextColor(colors.gray)
shell.run("delete", "installer")

-- Download Utils files.
term.setTextColor(colors.green)
print("Downloading \"" .. thisRepoName .. "\" files..")
term.setTextColor(colors.gray)
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/iemp.lua","/" .. thisRepoName .. "/iemp")

-- Downloading installer/updater
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/updater.lua","/" .. thisRepoName .. "/updater")
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/installer.lua","/" .. thisRepoName .. "/installer")

