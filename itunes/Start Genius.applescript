-- Start Genius:
--
-- Starts Genius on the current track. Closes the iTunes 
-- window if it wasn't visible at the start of the script.
--
-- -----------------------------------------------------------
-- This is free and unencumbered software released into the
-- public domain.
-- 
-- Anyone is free to copy, modify, publish, use, compile, 
-- sell, or distribute this software, either in source code 
-- form or as a compiled binary, for any purpose, commercial 
-- or non-commercial, and by any means.
-- 
-- In jurisdictions that recognize copyright laws, the author
-- or authors of this software dedicate any and all copyright 
-- interest in the software to the public domain. We make this 
-- dedication for the benefit of the public at large and to 
-- the detriment of our heirs and successors. We intend this 
-- dedication to be an overt act of relinquishment in 
-- perpetuity of all present and future rights to this
-- software under copyright law.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
-- KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
-- WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
-- BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
-- THE USE OR OTHER DEALINGS IN THE SOFTWARE.


tell application "iTunes"
	activate
	set isWindowVisible to (visible of browser window 1)
end tell

tell application "System Events"
	tell process "iTunes"
		keystroke "l" using command down
		click (the first button of window "iTunes" whose accessibility description is "genius")
		if isWindowVisible is false then
			keystroke "l" using command down
			keystroke "w" using {command down}
		end if
	end tell
end tell

