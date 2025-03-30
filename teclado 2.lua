--lmc_print_devices()
--lmc_device_set_name('MACROS', 'C50BFD8')
-- Asigna un teclado para macros
--lmc_assign_keyboard('teclado2')
  -- video explanation is HERE: https://www.youtube.com/watch?v=Arn8ExQ2Gjg
-- note that some of the code has changed since then (it works better now!)
-- Though, I have since abandoned luamacros, in favor of Interception... which i will abandon in favor of QMK.
-- get luamacros HERE: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
-- plug in your 2nd keyboard, load this script into LUAmacros, and press the triangle PLAY button.
-- Then, press any key on that keyboard to assign logical name ('MACROS') to macro keyboard
clear() --clear the console from last run
--This lists connected keyboards
local keyboardIdentifier = {'1C2ADCE1','8C027D5'}

listDevices  = function ()
dev = lmc_get_devices()
for key,value in pairs(dev) do
  print(key..':')
  for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end
end

-- Hide window to tray to keep taskbar tidy
lmc.minimizeToTray = true
--lmc_minimize()

local ez = {say = lmc_say, start = lmc_spawn, ["type"] = function(str) lmc_send_keys(str:lower()) end;}

--Start Script
sendToAHK = function (key)
      --print('It was assigned string:    ' .. key)
      local file = io.open("C:\\AHK\\2nd-keyboard\\LUAMACROS\\keypressed.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!
      --If you didn't put your AutoHotKey scripts into C:/AHK, Make sure to substitute the path that leads to your own "keypressed.txt" file, using the double backslashes.
	  --print("we are inside the text file")
      file:write(key)
      file:flush() --"flush" means "save." Lol.
      file:close()
      ez.type('{F24}')  -- This presses F24. Using the F24 key to trigger AutoHotKey is probably NOT the best method. Feel free to program something better!
end

local config = {
	[45]  = "insert",
	[36]  = "home",
	[33]  = "pageup",
	[46]  = "delete",
	[35]  = "end",
	[34]  = "pagedown",
	[27]  = "escape",
	[112] = "F1",
	[113] = "F2",
	[114] = "F3",
	[115] = "F4",
	[116] = "F5",
	[117] = "F6",
	[118] = "F7",
	[119] = "F8",
	[120] = "F9",
	[121] = "F10",
	[122] = "F11",
	[123] = "F12",
	[8]   = "backspace",
	[220] = "backslash",
	[13]  = "enter",
	[16]  = "rShift",
	[17]  = "rCtrl",
	[38]  = "up",
	[37]  = "left",
	[40]  = "down",
	[39]  = "right",
	[32]  = "space",
	[186] = "semicolon",
	[222] = "singlequote",
	[190] = "period",
	[191] = "slash",
	[188] = "comma",
	[219] = "leftbracket",
	[221] = "rightbracket",
	[189] = "minus",
	[187] = "equals",
	[96]  = "num0",
	[97]  = "num1",
	[98]  = "num2",
	[99]  = "num3",
	[100] = "num4",
	[101] = "num5",
	[102] = "num6",
	[103] = "num7",
	[104] = "num8",
	[105] = "num9",

	[106] = "numMult",
    [107] = "numPlus",
    [108] = "numEnter", --sometimes this is different, check your keyboard
	[109] = "numMinus",
    [110] = "numDelete",
	[111] = "numDiv",
    [144] = "numLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects

    [192] = "`",  --this is the tilde key just before the number row
    [9]   = "tab",
    [20]  = "capslock",
    [18]  = "alt",


	[string.byte('Q')] = "q",
	[string.byte('W')] = "w",
	[string.byte('E')] = "e",
	[string.byte('R')] = "r",
	[string.byte('T')] = "t",
	[string.byte('Y')] = "y",
	[string.byte('U')] = "u",
	[string.byte('I')] = "i",
	[string.byte('O')] = "o",
	[string.byte('P')] = "p",
	[string.byte('A')] = "a",
	[string.byte('S')] = "s",
	[string.byte('D')] = "d",
	[string.byte('F')] = "f",
	[string.byte('G')] = "g",
	[string.byte('H')] = "h",
	[string.byte('J')] = "j",
	[string.byte('K')] = "k",
	[string.byte('L')] = "l",
	[string.byte('Z')] = "z",
	[string.byte('X')] = "x",
	[string.byte('C')] = "c",
	[string.byte('V')] = "v",
	[string.byte('B')] = "b",
	[string.byte('N')] = "n",
	[string.byte('M')] = "m",

    [string.byte('0')] = "0",
	[string.byte('1')] = "1",
	[string.byte('2')] = "2",
	[string.byte('3')] = "3",
	[string.byte('4')] = "4",
	[string.byte('5')] = "5",
    [string.byte('6')] = "6",
    [string.byte('7')] = "7",
    [string.byte('8')] = "8",
    [string.byte('9')] = "9",

}

local tapPressed = false

-- Función para obtener el código de tecla
function getKey(name)
    for code, keyName in pairs(config) do
        if keyName == name then
            return code
        end
    end
    return nil -- Devuelve nil si no se encuentra la tecla
end

local Ecenario2 = function(button)

    if button == string.byte('M') then
            tapPressed =not tapPressed
            return true
        end
                if config[button] == "w" and tapPressed then
                ez.type('{UP}')
                 return true
                end
                if config[button] == "a" and tapPressed then
                ez.type('{LEFT}')
                 return true
                end
                if config[button] == "d" and tapPressed then
                ez.type('{RIGHT}')
                 return true
                end
                if config[button] == "s" and tapPressed then
                ez.type('{DOWN}')
                 return true
                end
                if config[button] == "rCtrl" and tapPressed then
                ez.type('[')
                 return true
                end
                if config[button] == "alt" and tapPressed then
                ez.type(']')
                 return true
                end
                if config[button] == "F2" and tapPressed then
                ez.type('(')
                 return true
                end
                if config[button] == "F3" and tapPressed then
                ez.type(')')
                 return true
                end
                if config[button] == "v" and tapPressed then
                ez.type(':')
                 return true
                end
                if config[button] == "b" and tapPressed then
                ez.type('_')
                 return true
                end
                if config[button] == "c" and tapPressed then
                ez.type(',')
                 return true
                end
                if config[button] == "q" and tapPressed then
                 ez.type('^c') -- c->copy
                 return true
                end
               if config[button] == "e" and tapPressed then
                 ez.type('^v') -- v->paste
                 return true
               end
end

local Esenario1 = function(button)
		if config[button] == "escape" then
            ez.type('{BACKSPACE}')
            return true
        end
		if config[button] == "rShift" then
            ez.type('{ENTER}')
            return true
        end
        if config[button] == "backslash" then
                   ez.type('{DELETE}')
                   return true
        end
        if config[button] == "tab" then
                   ez.type('=')
                   return true
        end
        if config[button] == "1" then
                    ez.type('7')
                    return true
        end
	    if config[button] == "2" then
            ez.type('8')
            return true
        end
				if config[button] == "3" then
                      ez.type('9')
                      return true
                end
				if config[button] == "4" then
                      ez.type('0')
                      return true
                end
				if config[button] == "5" then
                      ez.type("'")
                      return true
                end
				if config[button] == "6" then
                      ez.type('¡')
                      return true
                end
				if config[button] == "q" then
                      ez.type('y')
                      return true
                end
				if config[button] == "w" then
                      ez.type('u')
                      return true
                end
				if config[button] == "e" then
                    ez.type('i')
                    return true
                end
				if config[button] == "r" then
                    ez.type('o')
                    return true
                end
				if config[button] == "t" then
                    ez.type('p')
                    return true
                end
                if config[button] == "a" then
                    ez.type('h')
                    return true
                end
                if config[button] == "s" then
                    ez.type('j')
                    return true
                end
                if config[button] == "d" then
                    ez.type('k')
                    return true
                end
                if config[button] == "f" then
                    ez.type('l')
                    return true
                end
                if config[button] == "g" then
                    ez.type(string.char(241))
                    return true
                end
                if config[button] == "z" then
                    ez.type('n')
                    return true
                end
                if config[button] == "x" then
                    ez.type('m')
                    return true
                end
                if config[button] == "c" then
                    ez.type(',')
                    return true
                end
                if config[button] == "v" then
                    ez.type('.')
                    return true
                end
                if config[button] == "b" then
                    ez.type('-')
                    return true
                 end
                if config[button] == "rCtrl" then
                    ez.type('´') -- formatted : "{"
                   return true
                end
                if config[button] == "alt" then
                    ez.type('}') -- formatted : "}"
                end
		        if config[button] == "space" then
                    print("ingreso a la letra espace y ejecuto enter")
                    ez.type('{ENTER}')
                    return true
                end
                if config[button] == "F1" then
                    ez.type('{HOME}')
                    return true
                end
                if config[button] == "F2" then
                    ez.type('<')
                    return true
                end
                if config[button] == "F3" then
                    ez.type('>')
                    return true
                end
                if config[button] == "F4" then
                    
                    return true
                end
                if config[button] == "F5" then
                   ez.type('{END}')
                   return true
                end

                return false
end

local macros = {
    uniqueKeyboardName1 = {

        a ={
        ["81, 87, 69"] = function()
			print("This is a test to show that LuaMacros works with key combinations.");
		end;

		["112"] = function()
			ez.start("notepad");
		end;
        };

        b= {

        }
	};

	uniqueKeyboardName2 = {

        a ={
        ['20,' .. getKey('w')] = function ()
            print("star up")
            ez.type('{UP}')
        end;
        ['20,' .. getKey('a')] = function ()
            ez.type('{LEFT}')
        end;
        ['20,' .. getKey('d')] = function ()
            ez.type('{RIGHT}')
        end;
        ['20,' .. getKey('s')] = function ()
            ez.type('{DOWN}')
        end;
        };

        b = {
        ["".. getKey('w')] = function ()
            print("star w")
            ez.type('w')
        end;
        ["".. getKey('a')] = function ()
            ez.type('a')
        end;
        ["".. getKey('d')] = function ()
            ez.type('d')
        end;
        ["".. getKey('s')] = function ()
            ez.type('s')
        end;
        };
    };
};

function contains(lista, valor)
    local count = 0
    for i, v in pairs(lista) do
        if v == valor then
            count = count + 1
        end
    end
    return count
end

function keyNormal(pressByte)
    if pressByte == 17 then -- 17 es el código de tecla para la tecla Control
        print("Tecla Control presionada.")
    elseif pressByte == 16 then -- 16 es el código de tecla para la tecla Shift
        print("Tecla Shift presionada.")
    elseif pressByte == 18 then -- 18 es el código de tecla para la tecla Alt
        print("Tecla Alt presionada.")
    elseif pressByte == 20 then -- 20 es el código de tecla para la tecla Bloq Mayús
        print("Tecla Bloq Mayús presionada.")
    else
        print("letra normal")
        lmc_send_keys(string.lower(string.char(pressByte)))
    end
end

local multyKey = function(pressByte, pressDirection, pressed, functions, keyboard)
    if not pressed["ID:" .. tostring(pressByte)] then
        pressed["ID:" .. tostring(pressByte)] = true;
    end

    if(contains(pressed, true) >= 2) then
        if functions["ID:" .. tostring(pressByte)] then
            for index, v in pairs(functions["ID:" .. tostring(pressByte)]) do
                for _, trigger in pairs(v.a) do
                    if pressed["ID:" .. trigger] then
                            print("trigger")
                            v.b();
                            return true
                    else
                            print("entro en la funcion")
                            v.c();
                            return true
                    end

                    return false
                end;
            end;
        end
    end
end

local systemKey = function(pressByte, pressDirection, pressed, functions, keyboardId)
    if pressDirection == 0 then
        print("---------------------------------------------------------------")
        if pressed["ID:" .. tostring(pressByte)] then
            pressed["ID:" .. tostring(pressByte)] = false;
        end;
    else
        print("You pressed: " .. tostring(pressByte) .. ".");
		print('It was assigned string:    ' .. config[pressByte])

        if(multyKey(pressByte, pressDirection, pressed, functions, keyboardId)) then return end

        if keyboardId == keyboardIdentifier[1] then
          if(Ecenario2(pressByte)) then return end
          if(Esenario1(pressByte)) then return end
        elseif keyboardId == keyboardIdentifier[2] then
        end
        keyNormal(pressByte)
     end;
end

--	lmc_set_handler(keyboard,

local i = 1
for keyboard, m in pairs(macros) do
	local keyboardId = keyboardIdentifier[i]
    print("keyboardIdentifier: " .. tostring(keyboardId) .. ".");
    print("keyboard: " .. tostring(keyboard) .. ".");
    print("----------------------------------------------------");
    local functions = {};
	local pressed = {};
	for _, funtion in pairs(m) do

        for keys, fun in pairs(funtion) do
            keys = keys:gsub("%s", "");
            local triggers = {};
            while keys:find(",") do
                table.insert(triggers, keys:sub(1, keys:find(",") - 1));
                keys = keys:sub(keys:find(",") + 1);
            end;

            if not functions["ID:" .. keys] then
                functions["ID:" .. keys] = {}
            end
            table.insert(functions["ID:" .. keys], {
                a = triggers,
                b = fun,-- m.a[keys] or nil,
                c = m.b[keys] or nil
            })
        end;
	end;

    lmc_device_set_name(keyboard, keyboardId)

    --listDevices()
    -- Asignar manejador de eventos
    lmc_set_handler(keyboard,function(pressByte, pressDirection)
              systemKey(pressByte, pressDirection, pressed, functions, keyboardId)
    end);
    i = i + 1
end;

