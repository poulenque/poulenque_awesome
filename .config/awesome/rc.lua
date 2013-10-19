--ScratchPad FTW XD
local scratch = require("scratch")
--local require("blingbling")


-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")

-- Theme handling library
require("beautiful")

-- Notification library
require("naughty")

require("vicious")

require("volume")

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
	beautiful.init(awful.util.getdir("config") .. "/themes/pink_theme/theme.lua")
	-- This is used later as the default terminal and editor to run.

	--terminal = "urxvt -e tmux"
	terminal = "urxvt"
	--editor = "sub"
	editor = terminal .. " -e vim"
	--editor = os.getenv("EDITOR") or "nano"
	editor_cmd = terminal .. " -e vim"

	-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
	modkey = "Mod4"
	altkey = "Mod1"

	-- Table of layouts to cover with awful.layout.inc, order matters.
	layouts =
	{
			awful.layout.suit.tile,
			awful.layout.suit.floating,
	--    awful.layout.suit.tile.left,
		awful.layout.suit.tile.bottom,
	--    awful.layout.suit.tile.top,
	--    awful.layout.suit.fair,
	--    awful.layout.suit.fair.horizontal,
	--    awful.layout.suit.spiral,
	--    awful.layout.suit.spiral.dwindle,
	--    awful.layout.suit.max,
			awful.layout.suit.max.fullscreen
	--    awful.layout.suit.magnifier
	}
-- }}}
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
workspace_count=20
-- {{{ Tags
	-- Define a tag table which hold all screen tags.
	tags = {}
	for s = 1, screen.count() do
			-- Each screen has its own tag table.
			tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 , 0, '!','@','#','$','%','^','&','*','(',')'}, s, layouts[1])
	end
-- }}}
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

























--TODO
--
--MY IP
--BATTERIES
--


local bar_height=11



--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Network widget
	netwidget_txt=widget({ type = 'textbox' })
	netwidget = awful.widget.graph()
	netwidget:set_width(50)
	netwidget:set_scale(200)
	netwidget:set_height(bar_height)
	netwidget:set_background_color("#494B4F")
	netwidget:set_color("#FF5656")
	netwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

	netwidget_t = awful.tooltip({ objects = { netwidget.widget },})

	-- Register network widget
	vicious.register(netwidget, vicious.widgets.net,
	function (widget, args)
		netwidget_t:set_text("Network download: " .. args["{wlan0 down_kb}"] .. "kb/s")
		-- netwidget_txt.text=" down".. string.format("%04d", args["{wlan0 down_kb}"]).."kb"
		netwidget_txt.text=" ↓".. args["{wlan0 down_kb}"].."kb"
		return args["{wlan0 down_kb}"]
	end,.5)
	-- function (widget, args)
	--  netwidget_t:set_text("Network download: " .. args["{eth0 down_mb}"] .. "mb/s")
	--  return args["{eth0 down_mb}"]
	-- end)

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Network widget__UP
	netwidgetup_txt=widget({ type = 'textbox' })
	netwidgetup = awful.widget.graph()
	netwidgetup:set_width(50)
	netwidgetup:set_scale(200)
	netwidgetup:set_height(bar_height)
	netwidgetup:set_background_color("#494B4F")
	netwidgetup:set_color("#FF5656")
	netwidgetup:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

	netwidgetup_t = awful.tooltip({ objects = { netwidgetup.widget },})

	vicious.register(netwidgetup, vicious.widgets.net,
	function (widget, args)
		netwidgetup_t:set_text("Network upload: " .. args["{wlan0 up_kb}"] .. "kb/s")
		--netwidgetup_txt.text=" ↑".. string.format("%04d", args["{wlan0 up_kb}"]).."kb"
		netwidgetup_txt.text=" ↑".. args["{wlan0 up_kb}"].."kb"
		return args["{wlan0 up_kb}"]
	end,.5)

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- CPU usage widget
	cpuwidget_txt=widget({ type = 'textbox' })
	cpuwidget = awful.widget.graph()
	cpuwidget:set_width(50)
	cpuwidget:set_scale(100)
	cpuwidget:set_height(bar_height)
	cpuwidget:set_background_color("#494B4F")
	cpuwidget:set_color("#FF5656")
	cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

	cpuwidget_t = awful.tooltip({ objects = { cpuwidget.widget },})

	-- Register CPU widget
	vicious.register(cpuwidget, vicious.widgets.cpu, 
		function (widget, args)
			cpuwidget_t:set_text("CPU Usage: " .. args[1] .. "%")
			cpuwidget_txt.text="π"..string.format("%02d", args[1]).."%"
			return args[1]
		end)

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- RAM usage widget
	memwidget_txt = widget({ type = 'textbox' })
	memwidget = awful.widget.graph()
	memwidget:set_width(50)
	memwidget:set_scale (100)
	memwidget:set_height(bar_height)
	memwidget:set_background_color("#494B4F")
	memwidget:set_color("#FF5656")
	memwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

	memwidget_t = awful.tooltip({ objects = { memwidget.widget },})

	vicious.register(memwidget, vicious.widgets.mem,
		function (widget, args)
			local percentage=math.floor(args[2]/args[3]*1000)/10
			memwidget_txt.text="μ"..percentage .."%"
			memwidget_t:set_text("\nRAM: " .. args[2] .. "MB / " .. args[3] .. "MB " .. "\n" .. percentage .."%")
			return args[1]
		end)

-- SWAP usage widget
	swapwidget_txt = widget({ type = 'textbox' })
	swapwidget = awful.widget.graph()
	swapwidget:set_width(50)
	swapwidget:set_scale (100)
	swapwidget:set_height(bar_height)
	swapwidget:set_background_color("#494B4F")
	swapwidget:set_color("#FF5656")
	swapwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

	swapwidget_t = awful.tooltip({ objects = { swapwidget.widget },})

	vicious.register(swapwidget, vicious.widgets.mem, 
		function (widget, args)
			local percentage=math.floor(args[6]/args[7]*1000)/10
			swapwidget_txt.text="swap"..percentage .."%"
			swapwidget_t:set_text("\nSWAP: " .. args[6] .. "MB / " .. args[7] .. "MB " .. "\n" .. percentage .."%")
			return args[5]
		end)

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--battery
--☢
	batterywidget_txt = widget({ type = 'textbox' })
	batterywidget = awful.widget.progressbar()
	batterywidget:set_width(20)
	batterywidget:set_max_value (1)
--  batterywidget:set_scale(100)
	batterywidget:set_height(bar_height)
	batterywidget:set_vertical(false)
	batterywidget:set_background_color('#494B4F')
	batterywidget:set_color('#AECF96')
	batterywidget:set_gradient_colors({ '#AECF96', '#88A175', '#FF5656' })

	batterywidget_t = awful.tooltip({ objects = { batterywidget.widget },})

	vicious.cache(vicious.widgets.bat)

	-- vicious.register(batterywidget_txt, vicious.widgets.bat, "☢:$2% |$3þ", 60, "BAT0")

	vicious.register(batterywidget, vicious.widgets.bat,
		function (widget, args)
			--local percentage=args[2] .."%" .. args[3]
			--batterywidget_txt.text="þ"..percentage .."%"

			batterywidget_txt.text=args[3]
			batterywidget:set_value(args[2])

			-- if(tostring(args[3])=="N/A")
			batterywidget_t:set_text("\nBAT0: " .. args[2] .."%")
			return args[2]
		end,1, "BAT0")
	--update every 1 seconds


	-- battery2widget_txt = widget({ type = 'textbox' })
	-- battery2widget = awful.widget.progressbar()
	-- battery2widget:set_width(20)
	-- battery2widget:set_max_value (1) 
	-- battery2widget:set_height(bar_height)
	-- battery2widget:set_vertical(false)
	-- battery2widget:set_background_color('#494B4F')
	-- battery2widget:set_color('#AECF96')
	-- battery2widget:set_gradient_colors({ '#AECF96', '#88A175', '#FF5656' })

	-- battery2widget_t = awful.tooltip({ objects = { battery2widget.widget },})

	-- -- vicious.cache(vicious.widgets.bat)

	-- -- vicious.register(batterywidget_txt, vicious.widgets.bat, "☢:$2% |$3þ", 60, "BAT0")

	-- vicious.register(battery2widget, vicious.widgets.bat,
	--  function (widget, args)
	--    local percentage=args[2] .."%" .. args[3]
	--    battery2widget_txt.text=args[3]
	--    return args[2]
	--  end,1, "BAT1")
	-- --update every 1 seconds















-- ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ✐ ❂ ♓ ☨ ☧ ☦ ✁ ✃ ✄ ✎
-- ☬ ☫ ❉ ❆ ♅ ♇ ♆ ♙ ♟ ♔ ♕ ♖ ♗ ♘ © ® ™ … ∞ ≤ ≥
-- « » ç ∫ µ ◊ ı ¥ € £ ƒ $ º ª ‽ ♤ ✈ ♪ ☤ ♀ ☾
-- ☝ ♖ ✽ ☯ ♥ ☺ ♬ ☹ ☑ ✩ ☠ ✔ ✉ ♂ ✖ ✏ ♝ ❀ ♨ ❦ ☁
-- ✌ ♛ ❁ ☪ ☂ ★ ✇ ♺ ☭ ☃ ☛ ♞ ✿ ☮ ♘ ✾ ☄ ☟ ✝ ☼ ☚
-- ♟ ✺ ☥ ✂ ✍ ♕ ✵ ☉ ☇ ☈ ☡ ✠ ☊ ☋ ☌ ☍ ♁ ✇ ☢ ☣ ✣
-- ✡ ☞ ☜ ✜ ✛ ❥ ♗ ♚ ♛ ♜ ♝ ♞ Ω ≈ * § ∆ ¬ † & æ
-- π ¡ ¿ ø å ∂ • ¶ œ Æ ß ÷ ‰ √ ª % ♠ ☎ ☻ ♫ ☒
-- ˚ ¯ º ‽ ≠ ˆ ˜ ˘ ∑ ƒ






require('calendar2')
mytextclock = awful.widget.textclock({ align = "right"}," %a %d %b %Y %H:%M:%S ",1)
calendar2.addCalendarToWidget(mytextclock)







-- volumecfg = {}
-- volumecfg.cardid  = 0
-- volumecfg.channel = "Master"
-- volumecfg.widget = widget({ type = "textbox", name = "volumecfg.widget", align = "right" })

-- volumecfg_t = awful.tooltip({ objects = { volumecfg.widget },})
-- volumecfg_t:set_text("Volume")

-- -- command must start with a space!
-- volumecfg.mixercommand = function (command)
-- 	local fd = io.popen("amixer -c " .. volumecfg.cardid .. command)
-- 	local status = fd:read("*all")
-- 	fd:close()

-- --	local volume = string.match(status, "(%d?%d?%d)%%")
-- --	volume = string.format("% 3d", volume)
-- --	status = string.match(status, "%[(o[^%]]*)%]")
-- --	if string.find(status, "on", 1, true) then
-- --		volume = volume .. "%"
-- --	else
-- --		volume = volume .. "M"
-- --	end
-- --	volumecfg.widget.text = "♬" .. volume .. "♬"
-- end

-- volumecfg.update = function ()  volumecfg.mixercommand(" sget " .. volumecfg.channel) end
-- volumecfg.up = function ()  volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%+") end
-- volumecfg.down = function ()  volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%-") end
-- volumecfg.widget:buttons({
-- 	button({ }, 4, function () volumecfg.up() end),
-- 	button({ }, 5, function () volumecfg.down() end),
-- })
-- volumecfg.update()


-- awful.hooks.timer.register(60, function ()
-- 			 volumecfg.update()
-- end)






















separator = widget({type = "textbox"})
separator.text = "|"

battery_l = widget({type = "textbox"})
battery_r = widget({type = "textbox"})

battery_l.text = "|"
battery_r.text = "þ"

space = widget({type = "textbox"})
space.text = " "



------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- {{{ Wibox

	-- Create a systray
	mysystray = widget({ type = "systray" })

	-- Create a wibox for each screen and add it
	mywibox = {}
	mypromptbox = {}
	mylayoutbox = {}
	mytaglist = {}
	mytaglist.buttons = awful.util.table.join(
						awful.button({ }, 1, awful.tag.viewonly),
						awful.button({ modkey }, 1, awful.client.movetotag),
						awful.button({ }, 3, awful.tag.viewtoggle),
						awful.button({ modkey }, 3, awful.client.toggletag)
						)
	mytasklist = {}
	mytasklist.buttons = awful.util.table.join(
						 awful.button({ }, 1, function (c)
							if not c:isvisible() then
									awful.tag.viewonly(c:tags()[1])
							end
							client.focus = c
							c:raise()
						end)
						)

	for s = 1, screen.count() do
			-- Create a promptbox for each screen
			mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
			-- Create an imagebox widget which will contains an icon indicating which layout we're using.
			-- We need one layoutbox per screen.
			mylayoutbox[s] = awful.widget.layoutbox(s)
			mylayoutbox[s]:buttons(awful.util.table.join(
														 awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
														 awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end)))
			-- Create a taglist widget
			mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

			-- Create a tasklist widget
			mytasklist[s] = awful.widget.tasklist(function(c)
																								return awful.widget.tasklist.label.currenttags(c, s)
																						end, mytasklist.buttons)

			-- Create the wibox
			mywibox[s] = awful.wibox({ position = "top", height = "10", screen = s })
			-- Add widgets to the wibox - order matters
			mywibox[s].widgets = {
				{
					mytaglist[s],
					mypromptbox[s],

					cpuwidget_txt,
					cpuwidget.widget,
					separator,

					memwidget_txt,
					memwidget.widget,
					separator,

					swapwidget_txt,
					swapwidget,
					separator,

					netwidget_txt,
					netwidget.widget,
					separator,

					netwidgetup_txt,
					netwidgetup.widget,
					separator,

					layout = awful.widget.layout.horizontal.leftright
				},

				mylayoutbox[s],

				mytextclock,
				

				-- battery_r,
				-- battery2widget_txt,
				-- battery_l,

				-- -- space,

				-- battery_r,
				-- battery2widget.widget,
				-- battery_l,

				-- space,

				battery_r,
				batterywidget_txt,
				battery_l,

				space,

				battery_r,
				batterywidget.widget,
				battery_l,

				space,

--				volumecfg.widget,
				volume_widget,


				s == 1 and mysystray or nil,
				mytasklist[s],
				layout = awful.widget.layout.horizontal.rightleft
			}
	end
-- }}}
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- {{{ Key bindings
	globalkeys = awful.util.table.join(
			awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
			awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),

			awful.key({ modkey,           }, "j",
					function ()
							awful.client.focus.byidx( 1)
							if client.focus then client.focus:raise() end
					end),
			awful.key({ modkey,           }, "k",
					function ()
							awful.client.focus.byidx(-1)
							if client.focus then client.focus:raise() end
					end),

			-- Layout manipulation
			awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
			awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
			awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
			awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
--      awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
			
			awful.key({ modkey,           }, "Tab",
				function ()
					awful.client.focus.byidx(1)
					if client.focus then
						client.focus:raise()
					end
				end),
			awful.key({ modkey, "Shift"   }, "Tab",
				function ()
					awful.client.focus.byidx(-1)
					if client.focus then
						client.focus:raise()
					end
				end),

			-- Standard program
			awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
			awful.key({ modkey, "Control" }, "r", awesome.restart),
			awful.key({ modkey, "Shift", "Control" ,altkey }, "q", awesome.quit),

			-- awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
			-- awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
			-- awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
			-- awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
			-- awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
			-- awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),

			awful.key({ modkey,           }, ".",     function () awful.tag.incmwfact( 0.05)    end),
			awful.key({ modkey,           }, ",",     function () awful.tag.incmwfact(-0.05)    end),
			awful.key({ modkey, "Control" }, ",",     function () awful.tag.incnmaster( 1)      end),
			awful.key({ modkey, "Control" }, ".",     function () awful.tag.incnmaster(-1)      end),
			awful.key({ modkey, "Shift"   }, ",",     function () awful.tag.incncol( 1)         end),
			awful.key({ modkey, "Shift"   }, ".",     function () awful.tag.incncol(-1)         end),


			awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
			awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

			--app_shortcut
			awful.key({ modkey, "Control" }, "Delete", function () awful.util.spawn("urxvt -e htop") end),
			awful.key({ modkey, "Control" }, "Return", function () awful.util.spawn_with_shell(editor) end),
			awful.key({ modkey,  altkey   }, "Return", function () awful.util.spawn_with_shell("chromium") end),
			awful.key({ modkey,altkey,"Shift"}, "Return", function () awful.util.spawn_with_shell("chromium --incognito") end),
			awful.key({ modkey,           }, "e", function () awful.util.spawn_with_shell("thunar") end),

			--screenshot
			awful.key({                   }, "Print" , function() awful.util.spawn("scrot  -e 'mv $f ~/scrot/'",false) end),
			awful.key({                   }, "Print" , function() awful.util.spawn("scrot ~/scrot/%Y-%m-%d-%T-screenshot.png",false) end),

			-- Prompt
			--awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),
			awful.key({ modkey },            "r",     function () awful.util.spawn_with_shell("dmenu_run")end),
			awful.key({ modkey }, "x",
								function ()
										awful.prompt.run({ prompt = "Run Lua code: " },
										mypromptbox[mouse.screen].widget,
										awful.util.eval, nil,
										awful.util.getdir("cache") .. "/history_eval")
								end),

			--rotate screen
			awful.key({ modkey, "Control" }, "Left",  function () awful.util.spawn("xrandr --output LVDS1 --rotate left")   end),
			awful.key({ modkey, "Control"  }, "Right",  function () awful.util.spawn("xrandr --output LVDS1 --rotate right")  end),
			awful.key({ modkey, "Control"  }, "Down", function () awful.util.spawn("xrandr --output LVDS1 --rotate inverted") end),
			awful.key({ modkey, "Control"  }, "Up",   function () awful.util.spawn("xrandr --output LVDS1 --rotate normal") end),



			--scratch-pad
			awful.key({ modkey }, "Escape", function () scratch.drop("urxvt -e screen", "bottom" , "center", 1, 1, "sticky",nil) end),
			--awful.key({ modkey }, "F1" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F2" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F3" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F4" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F5" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F6" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F7" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F8" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F9" , function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F10", function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F11", function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F12", function () scratch.drop("urxvt") end),
			--awful.key({ modkey }, "F1" , function () scratch.drop("skypetab-ng", "bottom" , "center", 1, 1, "sticky",nil) end),
			

			--keyboard-layout
			awful.key({ modkey, "Shift"   }, "F1",  function () os.execute("setxkbmap us altgr-intl")		naughty.notify({ timeout=1,text = "KEYBOARD ===> US altgr-intl" }) end),
			awful.key({ modkey, "Shift"   }, "F2",  function () os.execute("setxkbmap us alt-intl")			naughty.notify({ timeout=1,text = "KEYBOARD ===> US alt-intl" }) end),
			awful.key({ modkey, "Shift"   }, "F3",  function () os.execute("setxkbmap ch fr")				naughty.notify({ timeout=1,text = "KEYBOARD ===> FR-CH" }) end),
			awful.key({ modkey, "Shift"   }, "F4",  function () os.execute("setxkbmap gr")					naughty.notify({ timeout=1,text = "KEYBOARD ===> GREEK" }) end),

			awful.key({ modkey, "Shift"   }, "F5",  function () os.execute("setxkbmap ru")					naughty.notify({ timeout=1,text = "KEYBOARD ===> RU" }) end),
			awful.key({ modkey, "Shift"   }, "F6",  function () os.execute("setxkbmap us mac")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US mac" }) end),
			awful.key({ modkey, "Shift"   }, "F7",  function () os.execute("setxkbmap us intl")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US intl" }) end),
			awful.key({ modkey, "Shift"   }, "F8",  function () os.execute("setxkbmap us dvp")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US dvp" }) end),

			awful.key({ modkey, "Shift"   }, "F9",  function () os.execute("setxkbmap us dvorak-l")			naughty.notify({ timeout=1,text = "KEYBOARD ===> US dvorak-l" }) end),
			awful.key({ modkey, "Shift"   }, "F10", function () os.execute("setxkbmap us dvorak-r")			naughty.notify({ timeout=1,text = "KEYBOARD ===> US dvorak-r" }) end),
			awful.key({ modkey, "Shift"   }, "F11", function () os.execute("setxkbmap us dvorak-alt-intl")	naughty.notify({ timeout=1,text = "KEYBOARD ===> US dvorak-alt-intl" }) end),
			awful.key({ modkey, "Shift"   }, "F12", function () os.execute("setxkbmap us dvorak-intl")		naughty.notify({ timeout=1,text = "KEYBOARD ===> US dvorak-intl" }) end),

			-- awful.key({ modkey, "Shift"   }, "F9", function () os.execute("setxkbmap us rus")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US rus" }) end),
			-- awful.key({ modkey, "Shift"   }, "F10", function () os.execute("setxkbmap us colemak")			naughty.notify({ timeout=1,text = "KEYBOARD ===> US colemak" }) end),
			-- awful.key({ modkey, "Shift"   }, "F11", function () os.execute("setxkbmap us olpc")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US olpc" }) end),
			-- awful.key({ modkey, "Shift"   }, "F12", function () os.execute("setxkbmap us olpc2")			naughty.notify({ timeout=1,text = "KEYBOARD ===> US olpc2" }) end),

			-- awful.key({ modkey, "Shift"   }, "F9",  function () os.execute("setxkbmap us chr")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US chr" }) end),
			-- awful.key({ modkey, "Shift"   }, "F10", function () os.execute("setxkbmap us hbs")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US hbs" }) end),
			-- awful.key({ modkey, "Shift"   }, "F11", function () os.execute("setxkbmap us ats")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US ats" }) end),
			-- awful.key({ modkey, "Shift"   }, "F12", function () os.execute("setxkbmap us crd")				naughty.notify({ timeout=1,text = "KEYBOARD ===> US crd" }) end),





-- xkb_symbols "intl-unicode" {
-- xkb_symbols "alt-intl-unicode" {











			--VERY USEFUL KEY
			awful.key({}       , "XF86Launch1", function () awful.util.spawn_with_shell("moo") end),

			--hide/show bar
			awful.key({ modkey }, "b", function () mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible end)
	)

	clientkeys = awful.util.table.join(
			awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
			awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
			awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
			awful.key({ modkey, "Shift"   }, "Return", function (c) c:swap(awful.client.getmaster()) end),
			awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
			awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
			awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
			awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
			awful.key({ modkey,           }, "m",
					function (c)
							c.maximized_horizontal = not c.maximized_horizontal
							c.maximized_vertical   = not c.maximized_vertical
					end),


			-- awful.key({ }, "XF86AudioRaiseVolume", function () volumecfg.up() end),
			-- awful.key({ }, "XF86AudioLowerVolume", function () volumecfg.down() end),
			--awful.key({ }, "XF86AudioMute", function () volumecfg.toggle() end),
--			awful.key({ }, "XF86AudioRaiseVolume", 	function ()	awful.util.spawn("amixer set Master 2%+")  end),
			awful.key({ }, "XF86AudioRaiseVolume", 	function ()	volume_up(volume_widget)  end),
			awful.key({ }, "XF86AudioLowerVolume", 	function ()	volume_down(volume_widget)  end),
			-- awful.key({ }, "XF86AudioMute", 		function ()	awful.util.spawn("amixer sset Master toggle") end),

			--Move Window to Workspace Left/Right
			 awful.key({ modkey, "Control"  ,"Shift" }, "Left",
				 function (c)
					 local curidx = awful.tag.getidx()
					 if curidx == 1 then
						 awful.client.movetotag(tags[client.focus.screen][workspace_count])
					 else
						 awful.client.movetotag(tags[client.focus.screen][curidx - 1])
					 end
				 end),
			 awful.key({ modkey, "Control" ,"Shift"  }, "Right",
				 function (c)
					 local curidx = awful.tag.getidx()
					 if curidx == workspace_count then
						 awful.client.movetotag(tags[client.focus.screen][1])
					 else
						 awful.client.movetotag(tags[client.focus.screen][curidx + 1])
					 end
				 end),


			 awful.key({ modkey, "Shift"   }, "Left",
				 function (c)
					 local curidx = awful.tag.getidx()
					 if curidx == 1 then
						 awful.client.movetotag(tags[client.focus.screen][workspace_count])
					 else
						 awful.client.movetotag(tags[client.focus.screen][curidx - 1])
					 end
					 awful.tag.viewidx(-1)
				 end),
			 awful.key({ modkey, "Shift"   }, "Right",
				 function (c)
					 local curidx = awful.tag.getidx()
					 if curidx == workspace_count then
						 awful.client.movetotag(tags[client.focus.screen][1])
					 else
						 awful.client.movetotag(tags[client.focus.screen][curidx + 1])
					 end
					 awful.tag.viewidx(1)
				 end)

	)

	-- Compute the maximum number of digit we need, limited to 9
	keynumber = 0
	for s = 1, screen.count() do
		 keynumber = math.min(9, math.max(#tags[s], keynumber));
	end

	-- Bind all key numbers to tags.
	-- Be careful: we use keycodes to make it works on any keyboard layout.
	-- This should map on the top row of your keyboard, usually 1 to 9.
	for i = 1, keynumber do
		globalkeys = awful.util.table.join(globalkeys,
			awful.key({ modkey }, "#" .. i + 9,
				function ()
					local screen = mouse.screen
					if tags[screen][i] then
						awful.tag.viewonly(tags[screen][i])
					end
				end),
			awful.key({ modkey, "Control" }, "#" .. i + 9,
				function ()
					local screen = mouse.screen
					if tags[screen][i] then
						awful.tag.viewtoggle(tags[screen][i])
					end
				end),
			awful.key({ modkey, "Shift" }, "#" .. i + 9,
				function ()
					if client.focus and tags[client.focus.screen][i] then
						awful.client.movetotag(tags[client.focus.screen][i])
					end
				end),
			awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
				function ()
					if client.focus and tags[client.focus.screen][i] then
						awful.client.toggletag(tags[client.focus.screen][i])
					end
				end))
	end

	clientbuttons = awful.util.table.join(
			awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
			awful.button({ modkey }, 1, awful.mouse.client.move),
			awful.button({ modkey }, 3, awful.mouse.client.resize),
			awful.button({ modkey }, 4, function (c) c.opacity = 0.5 end),
			awful.button({ modkey }, 5, function (c) c.opacity = 1 end)
			-- awful.button({ modkey }, 4, function (c) naughty.notify({ timeout=1,text = "PROUT" }) end),
			-- awful.button({ modkey }, 5, function (c) naughty.notify({ timeout=1,text = "PROUT" }) end)
	)

	-- Set keys
	root.keys(globalkeys)
-- }}}
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- {{{ Rules
	awful.rules.rules = {
			-- All clients will match this rule.
			{ rule = { },
				properties = { border_width = beautiful.border_width,
											 border_color = beautiful.border_normal,
											 focus = true,
											 keys = clientkeys,
											 buttons = clientbuttons } },
			{ rule = { class = "MPlayer" },
				properties = { floating = true } },
			{ rule = { class = "pinentry" },
				properties = { floating = true } },
			{ rule = { class = "gimp" },
				properties = { floating = true } },
			{ rule = { class = "Exe"},
				properties = { floating = true } },
			{ rule = { class = "Florence"},
				properties = { floating = true } },
			-- Set Firefox to always map on tags number 2 of screen 1.
			-- { rule = { class = "Firefox" },
			--   properties = { tag = tags[1][2] } },
	}
-- }}}
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- {{{ Signals
	-- Signal function to execute when a new client appears.
	client.add_signal("manage", function (c, startup)
			-- Add a titlebar
			--awful.titlebar.add(c, { modkey = modkey })

			-- Enable sloppy focus
			c:add_signal("mouse::enter", function(c)
					if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
							and awful.client.focus.filter(c) then
							client.focus = c
					end
			end)

			if not startup then
					-- Set the windows at the slave,
					-- i.e. put it at the end of others instead of setting it master.
					-- awful.client.setslave(c)

					-- Put windows in a smart way, only if they does not set an initial position.
					if not c.size_hints.user_position and not c.size_hints.program_position then
							awful.placement.no_overlap(c)
							awful.placement.no_offscreen(c)
					end
			end
	end)

	client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
	client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
