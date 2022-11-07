-- terminal prefix
local emulator_exec = "alacritty -e fish -C "
local terminal_exec = "alacritty -e fish"

-- default applications
defaults = {}

return {
	defaults = {
		-- terminal
		terminal = terminal_exec,
		-- file manager
		file_manager = emulator_exec .. "ranger",
		-- music player
		music_player = emulator_exec .. "ncmpcpp",
		-- application launcher
		launcher = "rofi -combi-modi {run, windows, ssh} -show run",
		-- graphical ide
		graphical_ide = "code",
		-- terminal ide
		terminal_ide = "nvim",
		-- browser
		browser = "firefox",
        -- browser playlist
        playlist = "firefox --new-window 'https://www.youtube.com/playlist?list=PL5zuf4CtvOaS51k6gZdbaSPEyB6utebSw'",
        -- quick notes application
        notes = "~/.local/notes/build/notes"
	}
}
