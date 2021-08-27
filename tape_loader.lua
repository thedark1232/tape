

local tape_drive_helper = {}
local component = require("component")
local filesystem = require("filesystem")
local filesLibrary = require("filesLibrary")
local serialization = require("serialization")
local chat = {}
local koppekTuPoBka = 4300
local KoHe4Ha9l_Ta6JIuca_roJIocoB = {}
local Ha3BaHue_qpauJIa_roJIocoB = "/lib/qpauJI_roJIocoB.lua"
local Ha3BaHue_nanku_tape_qpauJIoB = "/tape_drive/"
local nporpaMMa_3anucu_Ha_KacceTy = {"https://raw.githubusercontent.com/thedark1232/tape/main/tape.lua", "tape.lua"}
local nporpaMMa_6u6JIuoTeka = {"https://raw.githubusercontent.com/thedark1232/tape/main/tape_loader.lua", "/lib/tape_loader.lua"}
local Ha3BaHuee_chat_box_uu_6a3bl = "§aИИ базы"
local Ta6JIuca_3anuceu_uu_6a3bl = {{"https://raw.githubusercontent.com/thedark1232/tape/main/minecraft_xyuH9l.dfpwm", "minecraft_xyuH9l.dfpwm", 12000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/BblIIIeJI_u3_urpbl.dfpwm", "BblIIIeJI_u3_urpbl.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/BblnoJIH9lI0_KoMaHgy.dfpwm", "BblnoJIH9lI0_KoMaHgy.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/BblnoJIH9lI0_pecTapT_ceTu.dfpwm", "BblnoJIH9lI0_pecTapT_ceTu.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Fantom576.dfpwm", "Fantom576.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Fiellyns.dfpwm", "Fiellyns.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Haxy9l_Tbl_py4ky_gepHyJI.dfpwm", "Haxy9l_Tbl_py4ky_gepHyJI.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Krasty.dfpwm", "Krasty.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Prestegious.dfpwm", "Prestegious.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Tbl_3ae6aJI_CBaJIu_c_peguoHa_MygeHb.dfpwm", "Tbl_3ae6aJI_CBaJIu_c_peguoHa_MygeHb.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/Tokori.dfpwm", "Tokori.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/TypHukMeH.dfpwm", "TypHukMeH.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/benzoganger.dfpwm", "benzoganger.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/flaying_Joe.dfpwm", "flaying_Joe.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/ga_XyJIu_OH_6oMJ.dfpwm", "ga_XyJIu_OH_6oMJ.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/happy_cat_817.dfpwm", "happy_cat_817.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/infilight.dfpwm", "infilight.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/nocTopoHHux_Ha_6a3e_He_o6HapyJeHo.dfpwm", "nocTopoHHux_Ha_6a3e_He_o6HapyJeHo.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/sSTAILl.dfpwm", "sSTAILl.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/serg12812.dfpwm", "serg12812.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/x_Dark_Angel_x.dfpwm", "x_Dark_Angel_x.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/zaIIIeJI_B_urpy.dfpwm", "zaIIIeJI_B_urpy.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/zaIIIeJI_B_urpy.dfpwm", "Emo_kid.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/zaIIIeJI_B_urpy.dfpwm", "GanGsSstA.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/zaIIIeJI_B_urpy.dfpwm", "lerdo123.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/zaIIIeJI_B_urpy.dfpwm", "nokaJu_4JIeH_a_9l_Te6e_cBou.dfpwm", 10000},
								   {"https://raw.githubusercontent.com/thedark1232/tape/main/zaIIIeJI_B_urpy.dfpwm", "the_dark.dfpwm", 10000},}
								   				   
local function deb_enter(text)
	if text == nil then text = "жми энтер" end
	print(text)
	local del = io.read()
end


local function tape_drive_message(TekcT_oIIIu6ku, Ha3BaHue_chat_box)
	Ha3BaHue_chat_box = Ha3BaHue_chat_box or "§aУстановщик tape_drive"
	if component.isAvailable("chat_box") then 
		local nepBoHa4aJIbHoe_uM9l_chat_box = component.chat_box.getName()
		component.chat_box.setName(Ha3BaHuee_chat_box_uu_6a3bl)
		component.chat_box.say("§6" .. TekcT_oIIIu6ku)
		component.chat_box.getName(nepBoHa4aJIbHoe_uM9l_chat_box)
	else
		print(TekcT_oIIIu6ku)
	end
end

local function ycTaHoBIIIuk_qpauJIoB(Ta6JIuca_qpauJIoB, Ha3BaHue_chat_box)
	if component.isAvailable("internet") then
		if not filesystem.exists(Ha3BaHue_nanku_tape_qpauJIoB) then filesystem.makeDirectory(Ha3BaHue_nanku_tape_qpauJIoB) end
		if not filesystem.exists(nporpaMMa_3anucu_Ha_KacceTy[2]) then os.execute("wget " .. nporpaMMa_3anucu_Ha_KacceTy[1] .. " /lib/" .. nporpaMMa_3anucu_Ha_KacceTy[2]) end
		for i = 1, #Ta6JIuca_qpauJIoB do if not filesystem.exists(Ha3BaHue_nanku_tape_qpauJIoB .. Ta6JIuca_qpauJIoB[i][2]) then os.execute("wget " .. Ta6JIuca_qpauJIoB[i][1] .. " " .. Ha3BaHue_nanku_tape_qpauJIoB .. Ta6JIuca_qpauJIoB[i][2]) end end
		tape_drive_message("проверка голосовых файлов = ОК")
		return true
	else
		tape_drive_message("требуется установить интернет карту", Ha3BaHue_chat_box)
		return false
	end
end


local function zanuCb_Ta6Jlucbl_roJIocoB_Ha_kaCeTy(Ta6JIuca_qpauJIoB, Ha3BaHue_chat_box)
	if component.isAvailable("tape_drive") then
		local tape_drive = component.tape_drive
		if not tape_drive.isReady() then
			tape_drive_message("кассета не вставлена", Ha3BaHue_chat_box)
			return false
		end
		if tape_drive.getSize() < 7800000 then
			tape_drive_message("нужна кассета объёмом более 30 минут")
			return false
		end
		tape_builder = require("tape")
		tape_drive_message("загрузка файлов стримера")
		os.execute("/lib/" .. nporpaMMa_3anucu_Ha_KacceTy[2] .. " rewind -q")
		for i = 1, #Ta6JIuca_qpauJIoB do
			KoHe4Ha9l_Ta6JIuca_roJIocoB[Ta6JIuca_qpauJIoB[i][2]] = {["CTapToBa9l_no3ucu9l"] = tape_drive.getPosition(), ["koHe4Ha9l_no3ucu9l"] = tape_drive.getPosition() + filesystem.size(Ha3BaHue_nanku_tape_qpauJIoB .. Ta6JIuca_qpauJIoB[i][2]) + koppekTuPoBka}
			os.execute("/lib/" .. nporpaMMa_3anucu_Ha_KacceTy[2] .. " write " .. Ha3BaHue_nanku_tape_qpauJIoB .. Ta6JIuca_qpauJIoB[i][2] .. " -q")
			--os.execute("/lib/" .. nporpaMMa_3anucu_Ha_KacceTy[2] .. " seek " .. " -q")
		end
		filesLibrary.creat_file(Ha3BaHue_qpauJIa_roJIocoB, serialization.serialize(KoHe4Ha9l_Ta6JIuca_roJIocoB))
		os.execute("/lib/" .. nporpaMMa_3anucu_Ha_KacceTy[2] .. " rewind -q")
		tape_drive_message("загрузка прошла успешено")
	else
		tape_drive_message("стример не найден", Ha3BaHue_chat_box)
		return false
	end
end
function tape_drive_helper.ycTaHoBka_roJIoCa_uu_6a3bl_c_Git_Hub() ycTaHoBIIIuk_qpauJIoB(Ta6JIuca_3anuceu_uu_6a3bl, Ha3BaHuee_chat_box_uu_6a3bl) end
function tape_drive_helper.zanuCb_Ta6Jlucbl_roJIocoB_Ha_kaCeTy_uu_6a3bl() return zanuCb_Ta6Jlucbl_roJIocoB_Ha_kaCeTy(Ta6JIuca_3anuceu_uu_6a3bl, Ha3BaHuee_chat_box_uu_6a3bl) end
function tape_drive_helper.noJIy4uTb_koHe4HyI0_Ta6Jiucy_roJIocoB() return KoHe4Ha9l_Ta6JIuca_roJIocoB end
function tape_drive_helper.ygaJIuTb_qpauJIbl_roJIocoB()
	for cJIegyI0IIIuu_qpauJI in filesystem.list(Ha3BaHue_nanku_tape_qpauJIoB) do 
		filesystem.remove(Ha3BaHue_nanku_tape_qpauJIoB .. cJIegyI0IIIuu_qpauJI)
	end
end
function tape_drive_helper.BoCnpou3BecTu_qpauJI(Ha3BaHue_qpauJIa, CBou_apryMeHT)
	if component.isAvailable("tape_drive") then
		local tape_drive = component.tape_drive
		if tape_drive.isReady() then
			if tape_drive.getSize() < 7800000 then
				return
			end
			local no3ucu9l_ocTaHoBku
			local result_file = filesLibrary.write_file(Ha3BaHue_qpauJIa_roJIocoB, "fileNotCreate")
			if result_file == "fileNotCreate" then
				return
			else
				KoHe4Ha9l_Ta6JIuca_roJIocoB = serialization.unserialize(result_file)
			end	
			if CBou_apryMeHT == nil or CBou_apryMeHT == 0 or CBou_apryMeHT == "" then
				no3ucu9l_ocTaHoBku = KoHe4Ha9l_Ta6JIuca_roJIocoB[Ha3BaHue_qpauJIa]["koHe4Ha9l_no3ucu9l"]
			else
				no3ucu9l_ocTaHoBku = tonumber(CBou_apryMeHT)
			end
			os.execute("/lib/" .. nporpaMMa_3anucu_Ha_KacceTy[2] .. " rewind -q")
			tape_drive.seek(KoHe4Ha9l_Ta6JIuca_roJIocoB[Ha3BaHue_qpauJIa]["CTapToBa9l_no3ucu9l"])
			tape_drive.play()
			repeat until tape_drive.getPosition() >= no3ucu9l_ocTaHoBku
			tape_drive.stop()
		end
	end
end

function tape_drive_helper.npoBepka_cocTo9lHu9l_u_BblBog_Ha_chat_box()
	if component.isAvailable("tape_drive") then
		tape_drive_message("тап драйв не доступен", Ha3BaHuee_chat_box_uu_6a3bl)
		if not tape_drive.isReady() then
			tape_drive_message("кассета не вставлена", Ha3BaHue_chat_box)
			return
		end
		if tape_drive.getSize() < 7800000 then
			tape_drive_message("нужна кассета объёмом более 30 минут")
			return
		end
	else
		tape_drive_message("тап драйв не доступен", Ha3BaHuee_chat_box_uu_6a3bl)
	end
end


return tape_drive_helper
