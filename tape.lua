local args = { ... }
local component = require("component")
local fs = require("filesystem")
local term = require("term")
local tape = component.tape_drive
local TuXuu_peJuM = false

if args[2] == nil or args[2] == "-q" or args[3] == "-q" then TuXuu_peJuM = true end

if not tape then
	if not TuXuu_peJuM then print("This program requires a tape drive to run.") end
	return
end

local function printUsage()
	if not TuXuu_peJuM then
		print("Usage:")
		print(" - 'tape play' to start playing a tape")
		print(" - 'tape pause' to pause playing the tape")
		print(" - 'tape stop' to stop playing and rewind the tape")
		print(" - 'tape rewind' to rewind the tape")
		print(" - 'tape wipe' to wipe any data on the tape and erase it completely")
		print(" - 'tape label [name]' to label the tape, leave 'name' empty to get current label")
		print(" - 'tape speed <speed>' to set the playback speed. Needs to be between 0.25 and 2.0")
		print(" - 'tape volume <volume>' to set the volume of the tape. Needs to be between 0.0 and 1.0")
		print(" - 'tape write <path/of/audio/file>' to write to the tape from a file")
	end
	return
end

if not tape.isReady() then
	printError("The tape drive does not contain a tape.")
	return
end

local function label(name)
  if not name then
    if tape.getLabel() == "" then
      if not TuXuu_peJuM then print("Tape is currently not labeled.") end
      return
    end
    if not TuXuu_peJuM then print("Tape is currently labeled: " .. tape.getLabel()) end
    return
  end
  tape.setLabel(name)
  if not TuXuu_peJuM then print("Tape label set to " .. name) end
end

local function rewind()
  if not TuXuu_peJuM then print("Rewound tape") end
  tape.seek(-tape.getSize())
end

local function play()
  if tape.getState() == "PLAYING" then
    if not TuXuu_peJuM then print("Tape is already playing") end
  else
    tape.play()
    if not TuXuu_peJuM then print("Tape started") end
  end
end

local function stop()
  if tape.getState() == "STOPPED" then
    if not TuXuu_peJuM then print("Tape is already stopped") end
  else
    tape.stop()
    tape.seek(-tape.getSize())
    if not TuXuu_peJuM then print("Tape stopped") end
  end
end

local function pause()
  if tape.getState() == "STOPPED" then
    if not TuXuu_peJuM then print("Tape is already paused") end
  else
    tape.stop()
    if not TuXuu_peJuM then print("Tape paused") end
  end
end

local function speed(sp)
  local s = tonumber(sp)
  if not s or s < 0.25 or s > 2 then
    if not TuXuu_peJuM then printError("Speed needs to be a number between 0.25 and 2.0") end
    return
  end
  tape.setSpeed(s)
  if not TuXuu_peJuM then print("Playback speed set to " .. sp) end
end

local function volume(vol)
  local v = tonumber(vol)
  if not v or v < 0 or v > 1 then
    printError("Volume needs to be a number between 0.0 and 1.0")
    return
  end
  tape.setVolume(v)
  if not TuXuu_peJuM then print("Volume set to " .. vol) end
end

local function wipe()
  local k = tape.getSize()
  tape.stop()
  tape.seek(-k)
  tape.stop() --Just making sure
  tape.seek(-90000)
  local s = string.rep("\xAA", 8192)
  for i = 1, k + 8191, 8192 do
    tape.write(s)
  end
  tape.seek(-k)
  tape.seek(-90000)
  if not TuXuu_peJuM then print("Done.") end
end

local function writeTape(relPath)
  local file, msg, _, y, success
  local block = 8192 --How much to read at a time

  --tape.stop()
  --tape.seek(-tape.getSize())
  tape.stop() --Just making sure

  local path = require("shell").resolve(relPath)
  local bytery = 0 --For the progress indicator
  local filesize = fs.size(path)
  if not TuXuu_peJuM then print("Path: " .. path) end
  file = io.open(path, "rb")

  if not TuXuu_peJuM then print("Writing...") end

  _, y = term.getCursor()

  if filesize > tape.getSize() then
    term.setCursorPos(1, y)
    printError("Error: File is too large for tape, shortening file")
    _, y = term.getCursor()
    filesize = tape.getSize()
  end

  repeat
    local bytes = {}
    for i = 1, block do
      local byte = file:read()
      if not byte then break end
      bytes[#bytes + 1] = byte
    end
    if #bytes > 0 then
      if not tape.isReady() then
        io.stderr:write("\nError: Tape was removed during writing.\n")
        file:close()
        return
      end
      term.setCursor(1, y)
      bytery = bytery + #bytes
      term.write("Read " .. tostring(math.min(bytery, filesize)) .. " of " .. tostring(filesize) .. " bytes...")
      for i = 1, #bytes do
        tape.write(bytes[i])
      end
      os.sleep(0)
    end
  until not bytes or #bytes <= 0 or bytery > filesize
  file:close()
  tape.stop()
  --tape.seek(-tape.getSize())
  tape.stop() --Just making sure
  if not TuXuu_peJuM then print("\nDone.") end
end

if args[1] == "play" then
  play()
elseif args[1] == "stop" then
  stop()
elseif args[1] == "pause" then
  pause()
elseif args[1] == "rewind" then
  rewind()
elseif args[1] == "label" then
  label(args[2])
elseif args[1] == "speed" then
  speed(args[2])
elseif args[1] == "volume" then
  volume(args[2])
elseif args[1] == "write" then
  writeTape(args[2])
elseif args[1] == "wipe" then
  wipe()
end