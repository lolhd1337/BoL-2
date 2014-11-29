--[[

	Changelog
			1.0: Released Script


			1.1
			​	Added Farm
				Added DFG and Zhyonas
				Added auto downloading script (Not Libs)
				Added another option in Combo to use R if the R stuns

			1.2
				​Added Auto Kill when Killable (Toggle)
				Added Auto Q when Q will Stun (Inside Harass menu, but will still Cast even when Harass is Off)
				Added Ignite
				Added E cast until Stun is UP
				Added Packet Casting 
				Fixed a bug with AutoDownloading 

			1.3
				Added auto-downloading libraries
				Rewrote combo (Combo where you use R only if it stuns)
				Added auto E if being attacked
				Added Harass option to Q > W if W will stun (so @ 3 stacks)

			1.4
				Fixed bol.boost link

		Script Coded by Nickieboy.
	]]


if myHero.charName ~= "Annie" then return end

--[[ LINE 9 TO 14
	  ARE LINES GENERATED AND DEDICATED TO bol.b00st
	   ]]

--- BoL Script Status Connector --- 
local ScriptKey = "XKNKQKPMJPN" -- NAnnie auth key
local ScriptVersion = "1.4" -- Your .version file content

-- Thanks to Bilbao for his socket help & encryption
assert(load(Base64Decode("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"), nil, "bt", _ENV))() BolBoost( ScriptKey, ScriptVersion )
-----------------------------------

-- BoL Tracker

-- These variables need to be near the top of your script so you can call them in your callbacks.
HWID = Base64Encode(tostring(os.getenv("PROCESSOR_IDENTIFIER")..os.getenv("USERNAME")..os.getenv("COMPUTERNAME")..os.getenv("PROCESSOR_LEVEL")..os.getenv("PROCESSOR_REVISION")))
-- DO NOT CHANGE. This is set to your proper ID.
id = 414
-- CHANGE ME. Make this the exact same name as the script you added into the site!
ScriptName = "NAnnie"

-- Thank you to Roach and Bilbao for the support!
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIDAAAAJQAAAAgAAIAfAIAAAQAAAAQKAAAAVXBkYXRlV2ViAAEAAAACAAAADAAAAAQAETUAAAAGAUAAQUEAAB2BAAFGgUAAh8FAAp0BgABdgQAAjAHBAgFCAQBBggEAnUEAAhsAAAAXwAOAjMHBAgECAgBAAgABgUICAMACgAEBgwIARsNCAEcDwwaAA4AAwUMDAAGEAwBdgwACgcMDABaCAwSdQYABF4ADgIzBwQIBAgQAQAIAAYFCAgDAAoABAYMCAEbDQgBHA8MGgAOAAMFDAwABhAMAXYMAAoHDAwAWggMEnUGAAYwBxQIBQgUAnQGBAQgAgokIwAGJCICBiIyBxQKdQQABHwCAABcAAAAECAAAAHJlcXVpcmUABAcAAABzb2NrZXQABAcAAABhc3NlcnQABAQAAAB0Y3AABAgAAABjb25uZWN0AAQQAAAAYm9sLXRyYWNrZXIuY29tAAMAAAAAAABUQAQFAAAAc2VuZAAEGAAAAEdFVCAvcmVzdC9uZXdwbGF5ZXI/aWQ9AAQHAAAAJmh3aWQ9AAQNAAAAJnNjcmlwdE5hbWU9AAQHAAAAc3RyaW5nAAQFAAAAZ3N1YgAEDQAAAFteMC05QS1aYS16XQAEAQAAAAAEJQAAACBIVFRQLzEuMA0KSG9zdDogYm9sLXRyYWNrZXIuY29tDQoNCgAEGwAAAEdFVCAvcmVzdC9kZWxldGVwbGF5ZXI/aWQ9AAQCAAAAcwAEBwAAAHN0YXR1cwAECAAAAHBhcnRpYWwABAgAAAByZWNlaXZlAAQDAAAAKmEABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQA1AAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAMAAAADAAAAAwAAAAMAAAAEAAAABAAAAAUAAAAFAAAABQAAAAYAAAAGAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAgAAAAHAAAABQAAAAgAAAAJAAAACQAAAAkAAAAKAAAACgAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAAMAAAACwAAAAkAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAGAAAAAgAAAGEAAAAAADUAAAACAAAAYgAAAAAANQAAAAIAAABjAAAAAAA1AAAAAgAAAGQAAAAAADUAAAADAAAAX2EAAwAAADUAAAADAAAAYWEABwAAADUAAAABAAAABQAAAF9FTlYAAQAAAAEAEAAAAEBvYmZ1c2NhdGVkLmx1YQADAAAADAAAAAIAAAAMAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))()

--[[		Auto Update		]]
local version = "1.4"
local author = "Nickieboy"
local SCRIPT_NAME = "NAnnie"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Nickieboy/BoL/master/NAnnie.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>NAnnie:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST, "/Nickieboy/BoL/master/version/NAnnie.version")
	if ServerData then
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				AutoupdaterMsg("New version available "..ServerVersion)
				AutoupdaterMsg("Updating, please don't press F9")
				DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
			else
				AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
			end
		end
	else
		AutoupdaterMsg("Error downloading version info")
	end
end

-- Lib Updater
local REQUIRED_LIBS = {
	["SxOrbWalk"] = "https://raw.githubusercontent.com/Superx321/BoL/master/common/SxOrbWalk.lua",
	["Spell Damage Library"] = "https://raw.githubusercontent.com/Nickieboy/BoL/master/lib/Spell_Damage_Library.lua",
}
local DOWNLOADING_LIBS, DOWNLOAD_COUNT = false, 0

function AfterDownload()
	DOWNLOAD_COUNT = DOWNLOAD_COUNT - 1
	if DOWNLOAD_COUNT == 0 then
		DOWNLOADING_LIBS = false
		print("<b><font color=\"#6699FF\">Required libraries downloaded successfully, please reload (double F9).</font>")
	end
end

for DOWNLOAD_LIB_NAME, DOWNLOAD_LIB_URL in pairs(REQUIRED_LIBS) do
	if FileExist(LIB_PATH .. DOWNLOAD_LIB_NAME .. ".lua") then
		require(DOWNLOAD_LIB_NAME)
	else
		DOWNLOADING_LIBS = true
		DOWNLOAD_COUNT = DOWNLOAD_COUNT + 1
		DownloadFile(DOWNLOAD_LIB_URL, LIB_PATH .. DOWNLOAD_LIB_NAME..".lua", AfterDownload)
	end
end

-- Declaring variables
local lastLevel = myHero.level - 1
local Qdmg = 0
local Wdmg = 0
local Rdmg = 0
local igniteDmg = 0
local totalDamage = 0
local health = 0
local mana = 0
local maxHealth = 0
local maxMana = 0
local canStun = false
local EnemyMinions = minionManager(MINION_ENEMY, 625, myHero, MINION_SORT_HEALTH_ASC)
local ignite = nil
local passiveStacks = 0
local hasTibbers = false
local gameEnded = false


--Perform on load
function OnLoad()

 	-- OrbWalker
	OrbWalk = SxOrbWalk()

	levelSequences = {
			[1] = { _Q, _W, _Q, _E, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E },
			[2] = { _W, _Q, _W, _E, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E },
	}

 	-- TargetSelector
 	ts = TargetSelector(TARGET_LOW_HP_PRIORITY, 625)

 	DrawMenu()

 	UpdateWeb(true, ScriptName, id, HWID)
 

end 

-- Perform every time
function OnTick()
	if not gameEnded then
		 ts:update()
		 Harass()
		 Combo()
		 KillSteal()
		 KillIfKillable()
		 AutoLevel()
		 DrinkPotions()
		 Farm()
		 Zhonyas()
		 if Menu.misc.procE and canStun ~= true then
		 	CastSpell(_E)
		 end 
		 MenuCheck()
	end 

	 -- Here is one I added to my OnTick to detect the end of the game
	if GetGame().isOver then
		UpdateWeb(false, ScriptName, id, HWID)
		gameEnded = true
	end
end

function OnDraw()
 -- Draw Skill range
 if Menu.drawings.draw then
 	if Menu.drawings.drawQ then
		DrawQ()
 	end
 	if Menu.drawings.drawW then
 		DrawW()
 	end
 	if Menu.drawings.drawR then
 		DrawR()
 	end 

 	DrawKillable()
 end
end

function DrawQ()
	DrawCircle(myHero.x, myHero.y, myHero.z, 625, 0x111111)
end

function DrawW()
	DrawCircle(myHero.x, myHero.y, myHero.z, 625, 0x111111)
end

function DrawR()
	DrawCircle(myHero.x, myHero.y, myHero.z, 600, 0x111111)
end


function Harass()
 if Menu.harass.harass then
 	if ManaManager() ~= false then

 		if ts.target ~= nil and ValidTarget(ts.target) then
 			if (Menu.harass.harassQ) then
 				CastQ(ts.target)
 			end 
 			if (Menu.harass.harassW) then
 				CastW(ts.target)
 			end 
 		end
 	end 
 end 

 if Menu.harass.autoQ and canStun and not Menu.combo.combo then 
 		if ts.target ~= nil and ValidTarget(ts.target) then
 				CastQ(ts.target)
 		end 
 end 


if Menu.harass.autoQW and passiveStacks >= 3 and not Menu.combo.combo then 
 	if ts.target ~= nil and ValidTarget(ts.target) then
 				CastQ(ts.target)
 				DelayAction(function() if canStun then CastW(ts.target) end end, 0.5)
 	end 
 end 
end

function Combo()
	if (Menu.combo.combo) then
		if ts.target ~= nil and ValidTarget(ts.target, 625) then
			if Menu.combo.comboRStun and (myHero:CanUseSpell(_R) == READY) then
				Combo2()
			else	
				Combo1()
			end  
		end 
	end 
end 

function Combo1()
	if Menu.combo.comboDFG then
		CastItem(3128, ts.target)
	end 
	if (Menu.combo.comboQ) then
		CastQ(ts.target)
	end 
	if (Menu.combo.comboW) then
		CastW(ts.target)
	end 
	if (Menu.combo.comboR) then
		if ValidTarget(ts.target, 600) then
			CastR(ts.target)
		end 
	end 
	if (Menu.combo.comboIgnite) then
		if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then 
			ignite = SUMMONER_1
    	elseif 
    		myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then 
    		ignite = SUMMONER_2
    	end 
    	if ignite ~= nil and  (myHero:CanUseSpell(ignite) == READY) then
    		CastSpell(ignite, ts.target)
    	end 
	end 
end 

function Combo2()
	if canStun and Menu.combo.comboR then
		CastR(ts.target)
	end 
	if Menu.combo.comboQ then
		CastQ(ts.target)
	end 

	if Menu.combo.comboDFG then
		if GetInventoryHaveItem(3128) and GetInventoryItemIsCastable(3128) then
			CastItem(3128, ts.target)
		end
	end 

	if canStun and Menu.combo.comboR then
		CastR(ts.target)
	end 

	if Menu.combo.comboW then
		CastW(ts.target)
	end 

	if canStun and Menu.combo.comboR then
		CastR(ts.target)
	end 

	CastE()

	if Menu.combo.comboR then
		CastR(ts.target)
	end

	if (Menu.combo.comboIgnite) then
		if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then 
			ignite = SUMMONER_1
    	elseif 
    		myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then 
    		ignite = SUMMONER_2
    	end 
    	if ignite ~= nil and  (myHero:CanUseSpell(ignite) == READY) then
    		CastSpell(ignite, ts.target)
    	end 
	end 

end 


function CastQ(target) 
	if (myHero:CanUseSpell(_Q) == READY) and myHero.canAttack and not myHero.dead then
   	 	CastSpell(_Q, target)
   	end
end


function CastW(target) 
	if (myHero:CanUseSpell(_W) == READY) and myHero.canAttack and not myHero.dead then
    	CastSpell(_W, target)
  	end
end

function CastE()
	if  (myHero:CanUseSpell(_E) == READY) and myHero.canAttack and not myHero.dead then
		CastSpell(_E)
    end
end

function CastR(target)
	if  (myHero:CanUseSpell(_R) == READY) and myHero.canAttack and not myHero.dead and not hasTibbers then
		CastSpell(_R, target)
    end
end

function Farm()
	EnemyMinions:update()

	if Menu.farm.farm and not Menu.combo.combo then
		if Menu.farm.farmStun then
			if not canStun then
				if Menu.farm.farmQ then
					FarmQ()
				end 
				if Menu.farm.farmW then
					FarmW()
				end 
			end 
		else
			if Menu.farm.farmQ then
				FarmQ()
			end 
			if Menu.farm.farmW then
				FarmW()
			end 
		end
	end 
end 

function FarmW()
	for i, minion in pairs(EnemyMinions.objects) do
		if Menu.farm.farmW then
			Qdmg = getDmg("Q", minion, myHero)
			if minion ~= nil and not minion.dead and minion.visible and minion.health < Wdmg and OrbWalk:ValidTarget(minion, 625) then
				CastW(minion, minion.x, minion.y)
			end 
		end 
	end 
end 

function FarmQ()
	for i, minion in pairs(EnemyMinions.objects) do
		if Menu.farm.farmQ then
			Qdmg = getDmg("Q", minion, myHero)
			if minion ~= nil and not minion.dead and minion.visible and minion.health < Qdmg and OrbWalk:ValidTarget(minion, 625) then
				CastQ(minion)
			end 
		end 
	end 
end 

function Zhonyas()
	if Menu.zhonyas.zhonyas then
		if GetInventoryHaveItem(3157) and GetInventoryItemIsCastable(3157) then
			health = myHero.health
			mana = myHero.mana
			maxHealth = myHero.maxHealth
			if (health / maxHealth) <= Menu.zhonyas.zhonyasunder then
				CastItem(3157)
			end 
		end 
	end 
end


function KillSteal()
	if Menu.killsteal.killsteal then
	 	for i = 1, heroManager.iCount, 1 do
			 local champ = heroManager:getHero(i)
			if champ.team ~= myHero.team then 
			 	if Menu.killsteal.killstealQ then
			 		Qdmg = getDmg("Q", champ, myHero)
			 		if Qdmg >= champ.health then
			 			if ValidTarget(champ, 625) and not champ.dead then
			 				CastQ(champ)
				 		end
			 		end
				end

				if Menu.killsteal.killstealW then
 
				 	Wdmg = getDmg("W", champ, myHero)
					if Wdmg >= champ.health then
						if ValidTarget(champ, 625) and not champ.dead  then
				 			CastW(champ)
				 		end
				 	end
				end 

				if Menu.killsteal.killstealR then
				 	Rdmg = getDmg("R", champ, myHero)
				 	if Rdmg >= champ.health then
				 		if ValidTarget(champ, 600) and not champ.dead then
				 			if  (myHero:CanUseSpell(_Q) == READY) then
				 				CastSpell(_Q, champ)
				 		    elseif  (myHero:CanUseSpell(_W) == READY) then
				 		    	CastSpell(_W, champ)
				 		    else 
				 		    	CastSpell(_R, champ)
				 			end
				 		end 
				 	end
				end

				if Menu.killsteal.killstealIgnite then
					local igniteDmg = getDmg("IGNITE", champ, myHero)
					if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then 
						ignite = SUMMONER_1
    				elseif 
    					myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then 
    					ignite = SUMMONER_2
    				end 
    				if ValidTarget(champ, 600) then
	    				if igniteDmg >= champ.health then
	    					if ignite ~= nil and  (myHero:CanUseSpell(ignite) == READY) and not champ.dead then
	    						CastSpell(ignite, champ)
	    					end 
	    				end 
	    			end 
				end 
			end
		end 
   end 
end


function KillIfKillable()
	if Menu.autokill then
		for i, enemy in ipairs(GetEnemyHeroes()) do 
			local name = enemy.charName
			if Menu.autokill[name] then
				if (ValidTarget(enemy, 625)) then

					if  (myHero:CanUseSpell(_Q) == READY) then
						Qdmg = getDmg("Q", enemy, myHero)
					else
						Qdmg = 0
					end 

					if  (myHero:CanUseSpell(_W) == READY) then
						Wdmg = getDmg("W", enemy, myHero)
					else 
						Wdmg = 0
					end

					if  (myHero:CanUseSpell(_R) == READY) then
						Rdmg = getDmg("R", enemy, myHero)
					else
						Rdmg = 0
					end 

					if (Wdmg > Qdmg and Wdmg >= enemy.health and Qdmg < enemy.health) then
						CastW(enemy)
					end 

					if (Qdmg >= enemy.health) and not enemy.dead and enemy.visible then 
						CastQ(enemy)
					elseif ((Qdmg + Wdmg) >= enemy.health) and not enemy.dead and enemy.visible then
						CastQ(enemy)
						CastW(enemy)
					elseif ((Qdmg + Wdmg + Rdmg) >= enemy.health) and not enemy.dead and enemy.visible then
						CastQ(enemy)
						CastW(enemy)
						CastR(enemy)
					end 

				end 
			end 
		end 
	end 
end 

function DrawKillable()
	for i = 1, heroManager.iCount, 1 do
		local champ = heroManager:getHero(i)
		if ValidTarget(champ, 625) then
			if champ.team ~= myHero.team then 

				if  (myHero:CanUseSpell(_Q) == READY) then
				Qdmg = getDmg("Q", champ, myHero)
			    else 
			    	Qdmg = 0
			    end 
			    if  (myHero:CanUseSpell(_W) == READY) then
				Wdmg = getDmg("W", champ, myHero)
			    else 
			    	wDmg = 0 
			    end 
			    if  (myHero:CanUseSpell(_R) == READY) then
				Rdmg = getDmg("R", champ, myHero)
				else 
				Rdmg = 0
				end 

				totalDamage = Qdmg + Wdmg + Rdmg

				if (totalDamage >= champ.health) then
					PrintFloatText(champ, 0, "Can be killed")
				end 

			end 
		end 
	end 
end

function HaveBuff(unit,buffname)
	local result = false
	for i = 1, unit.buffCount, 1 do 
		if unit:getBuff(i) ~= nil and unit:getBuff(i).name == buffname and unit:getBuff(i).valid and BuffIsValid(unit:getBuff(i)) then 
			result = true 
			break 
		end 
	end 
	return result
end 

function OnCreateObj(object)
    if object.name == "StunReady.troy" then
        canStun = true
    end
end
 
function OnDeleteObj(object)
    if object.name == "StunReady.troy" then
        canStun = false
    end
end

function OnGainBuff(unit, buff)
	if unit.isMe and (buff.name == "pyromania") then
		passiveStacks = 1
	end

	if unit.isMe and (buff.name == "infernalguardiantimer") then
		hasTibbers = true
	end 

end

function OnUpdateBuff(unit, buff)
	if unit.isMe and (buff.name == "pyromania") then
		passiveStacks = passiveStacks + 1
	end 
end

function OnLoseBuff(unit, buff)
	if unit.isMe and (buff.name == "pyromania_particle") then
		passiveStacks = 0
	end 
	if unit.isMe and (buff.name == "infernalguardiantimer") then
		hasTibbers = false
	end 
end

function OnProcessSpell(object, spell)
  if (spell.target == myHero and string.find(spell.name, "BasicAttack")) then
    CastSpell(_E)
  end
end


function DrinkPotions()
	health = myHero.health
	mana = myHero.mana
	maxHealth = myHero.maxHealth
	maxMana = myHero.maxMana
	
		DrinkHealth(health, maxHealth)
		DrinkMana(mana, maxMana)
end 

function DrinkHealth(h, mH) 
	if not HaveBuff(myHero, "RegenerationPotion") then
		if GetInventoryHaveItem(2003) then
			if (h / mH <= Menu.autopotions.health) then
				CastItem(2003)
			end 
		end 
	end
end 

function DrinkMana(m, mM) 
	if not HaveBuff(myHero, "FlaskOfCrystalWater") then
		if GetInventoryHaveItem(2004) then
			if (m / mM <= Menu.autopotions.mana) then
				CastItem(2004)
			end 
		end 
	end 
end 


function ManaManager()
	mana = myHero.mana
	if (mana < Menu.harass.harassMana) then
		return false
	end
	return true 
end 


function AutoLevel()

	if Menu.autolevel.levelAuto == 1 or myHero.level <= lastLevel then return end

	LevelSpell(levelSequences[Menu.autolevel.levelAuto - 1][myHero.level])
	lastLevel = myHero.level

end


function DrawMenu()
	-- Menu
 Menu = scriptConfig("NAnnie by Nickieboy", "NAnnie")

 -- Combo
 Menu:addSubMenu("Combo", "combo")
 Menu.combo:addParam("combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
 Menu.combo:addParam("comboQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
 Menu.combo:addParam("comboW", "Use W", SCRIPT_PARAM_ONOFF, true)
 Menu.combo:addParam("comboR", "Use R", SCRIPT_PARAM_ONOFF, true)
 Menu.combo:addParam("comboDFG", "Use DFG", SCRIPT_PARAM_ONOFF, true)
 Menu.combo:addParam("comboRStun", "Use R if can stun", SCRIPT_PARAM_ONOFF, true)
 Menu.combo:addParam("comboIgnite", "Use Ignite in combo", SCRIPT_PARAM_ONOFF, true)

 -- Harass
 Menu:addSubMenu("Harass", "harass")
 Menu.harass:addParam("harass", "Harass (T)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
 Menu.harass:addParam("harass", "Harass Toggle (Y)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("Y"))
 Menu.harass:addParam("harassQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
 Menu.harass:addParam("harassW", "Use W", SCRIPT_PARAM_ONOFF, true)
 Menu.harass:addParam("autoQ", "Auto Q when stuns enemy", SCRIPT_PARAM_ONOFF, false)
 Menu.harass:addParam("autoQW", "Auto Q/W when W will stun enemy", SCRIPT_PARAM_ONOFF, false)
 Menu.harass:addParam("harassMana", "Mana Manager %", SCRIPT_PARAM_SLICE, 0.25, 0, 1, 2)

 -- Farming
 Menu:addSubMenu("Farming", "farm")
 Menu.farm:addParam("farm", "Farming (K)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("K"))
 Menu.farm:addParam("farmQ", "Farm using Q", SCRIPT_PARAM_ONOFF, false)
 Menu.farm:addParam("farmW", "Farm using W", SCRIPT_PARAM_ONOFF, false)
 Menu.farm:addParam("farmStun", "Farm until Stun is up", SCRIPT_PARAM_ONOFF, false)

 --Drawings
 Menu:addSubMenu("Drawings", "drawings")
 Menu.drawings:addParam("draw", "Drawings", SCRIPT_PARAM_ONOFF, true)
 Menu.drawings:addParam("drawQ", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)
 Menu.drawings:addParam("drawW", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
 Menu.drawings:addParam("drawR", "Draw R Range", SCRIPT_PARAM_ONOFF, true)

 -- KillSteal
 Menu:addSubMenu("Killsteal", "killsteal")
 Menu.killsteal:addParam("killsteal", "KillSteal", SCRIPT_PARAM_ONOFF, false)
 Menu.killsteal:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
 Menu.killsteal:addParam("killstealW", "Use W", SCRIPT_PARAM_ONOFF, true)
 Menu.killsteal:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
 Menu.killsteal:addParam("killstealIgnite", "Use Ignite", SCRIPT_PARAM_ONOFF, true)

 Menu:addSubMenu("Auto Kill when killable", "autokill")
 Menu.autokill:addParam("autokill", "Auto Kill", SCRIPT_PARAM_ONOFF, false)
 for i, enemy in ipairs(GetEnemyHeroes()) do
	Menu.autokill:addParam(enemy.charName, "Kill " .. enemy.charName, SCRIPT_PARAM_ONOFF, false)
 end 

 -- Auto Level
 Menu:addSubMenu("Auto Level", "autolevel")
 Menu.autolevel:addParam("levelAuto", "Auto Level Spells", SCRIPT_PARAM_LIST, 1, { "Off", "QWER", "WQER"})

 -- Auto Potions
 Menu:addSubMenu("Auto Potions", "autopotions")
 Menu.autopotions:addParam("health", "Health under %", SCRIPT_PARAM_SLICE, 0.25, 0, 1, 2)
 Menu.autopotions:addParam("mana", "Mana under %", SCRIPT_PARAM_SLICE, 0.25, 0, 1, 2)

 Menu:addSubMenu("Zhyonas", "zhonyas")
 Menu.zhonyas:addParam("zhonyas", "Auto Zhonyas", SCRIPT_PARAM_ONOFF, true)
 Menu.zhonyas:addParam("zhonyasunder", "Use Zhonyas under % health", SCRIPT_PARAM_SLICE, 0.20, 0, 1 ,2)

 -- Misc
 Menu:addSubMenu("Misc", "misc")
 Menu.misc:addParam("procE", "Use E to get stacks", SCRIPT_PARAM_ONOFF, false)
 Menu.misc:addParam("useEonAttack", "Auto E when attacked", SCRIPT_PARAM_ONOFF, false)
 Menu.misc:addParam("info", "CAN NOT BE BOTH ON", SCRIPT_PARAM_INFO, "CAREFUL")


  -- Default Information
 Menu:addParam("Version", "Version", SCRIPT_PARAM_INFO, version)
 Menu:addParam("Author", "Author",  SCRIPT_PARAM_INFO, author)

  -- Target Selector
  Menu:addTS(ts)
  ts.name = "TargetSelector"

 -- Orbwalker to menu
 Menu:addSubMenu("Orbwalker", "Orbwalker")
 OrbWalk:LoadToMenu(Menu.Orbwalker)
 
 -- Always show
 Menu.combo:permaShow("combo")
 Menu.harass:permaShow("harass")
 Menu.killsteal:permaShow("killsteal")
 Menu.autokill:permaShow("autokill")
 Menu.farm:permaShow("farm")
 Menu.zhonyas:permaShow("zhonyas")
 Menu.drawings:permaShow("draw")

end

function MenuCheck()
	if Menu.misc.procE then
 		Menu.misc.useEonAttack = false
 	end
 	if Menu.misc.useEonAttack then
 		Menu.misc.procE = false
 	end 
end 


function OnBugsplat()
	UpdateWeb(false, ScriptName, id, HWID)
end

function OnUnload()
	UpdateWeb(false, ScriptName, id, HWID)
end

