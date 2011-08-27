-- Play all of current album:
--
-- Moves the current track to iTunes DJ (if necessary; without 
-- interruption), then adds the whole album of the track to follow 
-- it. Closes the iTunes window if it wasn't visible at the start of 
-- the script.
--
-- ---------------------------------------------------------------------------
-- This is free and unencumbered software released into the public domain.
-- 
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any
-- means.
-- 
-- In jurisdictions that recognize copyright laws, the author or authors
-- of this software dedicate any and all copyright interest in the
-- software to the public domain. We make this dedication for the benefit
-- of the public at large and to the detriment of our heirs and
-- successors. We intend this dedication to be an overt act of
-- relinquishment in perpetuity of all present and future rights to this
-- software under copyright law.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.


tell application "iTunes"
	
	activate
	set oldPlaylist to (current playlist)
	set isWindowVisible to (visible of browser window 1)
	set theTrack to (current track)
	set theTime to (player position)
	
	-- Make sure the track is running in iTunes DJ
	
	play playlist "iTunes DJ"
	delete (every track of playlist "iTunes DJ" whose index > (get index of current track))
	if name of oldPlaylist is not "iTunes DJ" then
		duplicate theTrack to playlist "iTunes DJ"
		next track
		set player position to theTime
	end if
	set view of front browser window to playlist "iTunes DJ"
	
	-- Add all tracks from the album to iTunes DJ
	
	set theAlbum to album of theTrack as string
	set theArtist to album artist of theTrack as string
	set theTracks to (file tracks of library playlist 1 whose album is theAlbum and album artist is theArtist)
	if track number of theTrack is track number of item 1 of theTracks then
		set theTracks to rest of theTracks
	end if
	repeat with currentTrack in theTracks
		duplicate currentTrack to playlist "iTunes DJ"
	end repeat
end tell


if isWindowVisible is false then
	tell application "System Events"
		tell process "iTunes"
			keystroke "l" using command down
			keystroke "w" using {command down}
		end tell
	end tell
end if
