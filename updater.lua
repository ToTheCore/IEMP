local thisRepoName = "IEMP"


-- Delete old files.
term.setTextColor(colors.green)
print("Deleting files..")
term.setTextColor(colors.gray)
shell.run("delete", "/" .. thisRepoName.. "/iemp")
shell.run("delete", "/" .. thisRepoName.. "/updater")

-- Runn installer to get all new files.
shell.run("/" .. thisRepoName.. "/installer")
term.setTextColor(colors.green)
print("Done.")