                   --[[                    Credits                    ]]--
--[[boping head on beat : Form BBPanzu
	playOpponent + sick notes hud : Form Plotsh [Modified by: Laztrix/Mochaama]
	funnybf/ squishable bf : Form 4k_funny
	maniaMode : Form  tk#0003  [Psych Discord]
	better camera follow: Form Teniente Mantequilla#0139 [Psych Discord]
	
	all thing except that form credit : Form Lazt/Laztrix(myself ;>)  [If you use this on your mod please atleast credit me?]
	                                                                       ]]--
		

                                    --[HUD TYPE]--
		           local HudType = "Laztrix"  --alternate key [some not done yet] 
				        local HudTypeSubkey = ""  --[check list below, if available it will show "Extra" and "Minimalized"] [leave blank for Minimalized]
						      if HudType == "Forever" and HudTypeSubkey == "" then
								HudTypeSubkey = "Minimalized"
							  elseif HudType == "Laztrix" and HudTypeSubkey == "" then
								HudTypeSubkey = "Extra"
							  end
			--[[Hud List 
				  -Kade  100%
				  -Psych [or leave blank]
				  -Leather 0%
				  -Forever 100%  -[Subkey= -Extra | Minimalized-]-
				  -Laztrix 100%  -[Subkey= -Extra | Minimalized-]- [Minimalized Not DONE YET]
				  -Muffin  100%   [original/vanilla fnf hud]
				            ]]


									 --[ FEATURE ]--
		local fullStat = true; -- show all information about sick,good,etc [default: true]
		local iconBop = true; -- incase you hate icon bop [default:true]
		local winIcon = false; -- you must put the win icon image into mods/images folder [default:true]
		local camFolChar = true;  -- REWORKED NOW IT WORK PROPERLY ON ALL SONG/MODS -- Thanks to Teniente Mantequilla#0139  [psych discord]
		local maniaMode = false;  -- make the hud completely like Osu!Mania [default: false]
		local noteBop = false; --the note boping when pressed [85% reworked] [default: true]
		local emote = true; --- bf do animation. press SPACE to emote  [default: true]
		local playOpponent = false; -- play as opponent[75% reworked] [default: false]
		local healthdrain = false; --- everytime opponent hit notes your health get drained like boyfriend do to opponent [default: true]
				-- more coming
				
									--[ CONFIG ]--
		local watermark = false; -- who the hell doesnt know this thing [default: true]
		 local dazoom = true; -- this make the zoom beat do the opposite. instead zooming in it does zooming out [default:true]
		 local spen = false; -- if true at every 25 beat hit, the note do spin [default: true]
		 dacountdown = "hide" -- [FOR NOW ONLY SKIP] put 'skip' to skip countdown put 'hide' to hide countdown
		 daemote = ""  -- put the name of bf animation. [leave blank for hey/peace sign. if the bf is not the original one it will not playing]
					
									--[ SETTINGS ]--
			local noSongBar = true; -- disable a bar that will show what playing and then gone.[Laztrix Hud only] [default: false]
			local noCountdown = true; --sometimes broke some script
				
									   --[ Extras ]--
				local funnybf = false; --- thing that make bf squishable [default: false]
				
				
				
				
				
				--------------------------------------------------------------------------------------------------
				------------- >Deep Down Below Until End is the script< -------------
				---------------------------------------------------------------------------------------------------
								--the thing lolollolololol--
				local defaultNotePos = {};
				--form bbpanzu
				local dadsingL = 4
				local bfsingL = 4
				realAnimdad = 'idle'
				realAnimbf = 'idle'
				function getAnim(char,prop)
				prop = prop or 'name'
					return getProperty(char .. '.animation.curAnim.' .. prop)
				
				end
				-----------------------
				--form Plotsh
				cmoffset = -4
				cmy = 20
				tnhx = -5
				---------------
				local posS = {-100, 720}
				local posV = {0, 620}
				veloY = 0
				function onCreate()
				 if downscroll then
				   veloY = -30
				 else
				   veloY = 400
				 end
					if noCountdown then
					  if dacountdown == "skip" then
					   setProperty('skipCountdown',true)
					  end
				end
				 if maniaMode then
					addLuaScript('ExtraScript/manmod')
					noteBop = false;
					spen = false;
				 end
		    if HudType == "Muffin" then
				makeLuaText("vansco", "ye", 1000, 350, 120)
				setTextSize("vansco", 16)
				setTextBorder("vansco", 1, '000001')
				addLuaText("vansco")
			end
		    if HudType == "Forever" then
				makeLuaText('newScoreAcc','hey vsauce here',1000, 140, 0);
				setTextSize('newScoreAcc',18);
				addLuaText('newScoreAcc');
				setTextBorder("newScoreAcc", 1, '000001')
			if HudTypeSubkey == "Minimalized" then
				if not downscroll then
					makeLuaText('sogn', '', 0, 3, 695);
				  elseif  downscroll then
					makeLuaText('sogn', '', 0, 3, 2);
				end
					setTextAlignment('sogn', 'left');
					setTextSize('sogn',18)
					setTextBorder("sogn", 1, '000001')
					addLuaText('sogn');
					 if difficulty == 0 then 
					 setTextString('sogn',songName .. ' - EASY - PE v0.5.2h');
					elseif difficulty == 1 then
					 setTextString('sogn',songName .. ' - NORMAL - PE v0.5.2h');
					elseif difficulty == 2 then
					setTextString('sogn',songName .. ' - HARD - PE v0.5.2h');
					elseif difficulty == 3 then
					setTextString('sogn',songName .. ' - CUSTOM - PE v0.5.2h');
				end
			else
				if not downscroll then
					makeLuaText('sogn', '', 0, 3, 695);
					makeLuaText('daVer', 'Psych Engine v0.5.2h',0, 1070, 695);
				  elseif  downscroll then
					makeLuaText('sogn', '', 0, 3, 2);
					makeLuaText('daVer', 'Psych Engine v0.5.2h',0, 1070, 2);
				end
					setTextAlignment('sogn', 'left');
					setTextAlignment('daVer', 'right');
					setTextBorder("sogn", 1, '000001')
					setTextBorder("daVer", 1, '000001')
					setTextSize('sogn',17)
					addLuaText('sogn');
					setTextSize('daVer',17)
					addLuaText('daVer');
					 if difficulty == 0 then 
					 setTextString('sogn',songName .. ' - EASY');
					elseif difficulty == 1 then
					 setTextString('sogn',songName .. ' - NORMAL');
					elseif difficulty == 2 then
					setTextString('sogn',songName .. ' - HARD');
					elseif difficulty == 3 then
					setTextString('sogn',songName .. ' - CUSTOM');
				end
			end
		end
		    if HudType == "Kade" then

				makeLuaSprite('black', 'extraimage/black', 297.5, 20)
				makeLuaSprite('gray', 'extraimage/gray', 303, 25.25)
				makeLuaSprite('green', 'extraimage/green', 303, 25.25)
				
				addLuaSprite('black', true)
				addLuaSprite('gray', true)
				addLuaSprite('green', true)
				
				setObjectCamera('black', 'hud')
				setObjectCamera('gray', 'hud')
				setObjectCamera('green', 'hud')
				
				scaleObject('black', 2, .065)
				scaleObject('gray', 1.965, .035)
				scaleObject('green', 1.965, .035)


				
				makeLuaText('newScoreAcc','hey vsauce here',1000, 140, 0);
				setTextSize('newScoreAcc',18);
				setTextBorder("newScoreAcc", 1, '000001')
				addLuaText('newScoreAcc');
				if downscroll then
					makeLuaText('sogn', '', 0, 3, 695);
				  elseif not downscroll then
						makeLuaText('sogn', '', 0, 3, 2);
						end
						setTextAlignment('sogn', 'left');
						setTextSize('sogn',16)
						setTextBorder("sogn", 1, '000001')
						addLuaText('sogn');
						if playOpponent then
							if difficulty == 0 then 
							 setTextString('sogn',songName .. ' - Easy (Opponent)');
							elseif difficulty == 1 then
							 setTextString('sogn',songName .. ' - Normal (Opponent)');
							elseif difficulty == 2 then
							setTextString('sogn',songName .. ' - Hard (Opponent)');
							elseif difficulty == 3 then
							setTextString('sogn',songName .. ' - Custom (Opponent)');
							end
						   else
							 if difficulty == 0 then 
							 setTextString('sogn',songName .. ' - Easy');
							elseif difficulty == 1 then
							 setTextString('sogn',songName .. ' - Normal');
							elseif difficulty == 2 then
							setTextString('sogn',songName .. ' - Hard');
							elseif difficulty == 3 then
							setTextString('sogn',songName .. ' - Custom');
							end
						 end
				if fullStat then
					makeLuaText("tnh", '', 250, tnhx, 380);
					makeLuaText("cm", '', 200, -getProperty('tnh.x') + cmoffset, getProperty('tnh.y') + cmy);
					makeLuaText("sick", 'Sicks!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 17);
					makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 17);
					makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 17);
					makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 17);
					addLuaText('tnh');
					setTextBorder("sick", 1, '000001')
					setTextBorder("good", 1, '000001')
					setTextBorder("shit", 1, '000001')
					setTextBorder("bad", 1, '000001')
					setTextSize('sick', 20);
					addLuaText("sick");
					setTextAlignment('sick', 'left')
					setTextSize('good', 20);
					addLuaText("good");
					setTextAlignment('good', 'left')
					setTextSize('bad', 20);
					addLuaText("bad");
					setTextAlignment('bad', 'left')
					setTextSize('shit', 20);
					addLuaText("shit");
					setTextAlignment('shit', 'left')
				end
			end
			if HudType == "Laztrix" then
				if not hideHud then
				if not noSongBar then
					makeLuaSprite('wot','extraimage/songbarAlt',420, -200);
					scaleObject('wot', 0.8, 0.65);
					setObjectCamera('wot','other');
					addLuaSprite('wot',true);
					makeLuaText('wtf2',"Playing:", 0, 10, getProperty('wot.y')+0);
					addLuaText('wtf2');
					setObjectCamera('wtf2','other');
					setTextSize('wtf2', 30);
					makeLuaText('wtf', songName .. " | " .. curBpm , 0, 20, getProperty('wot.y') + 0);
					setTextSize('wtf', 25);
					setObjectCamera('wtf','other');
					addLuaText('wtf');
					setTextAlignment('wtf', 'left')
				end
				    makeLuaText("songTimer",'',0,590,0);
					addLuaText('songTimer');
					setTextBorder("songTimer", 1, '000001')
					setTextSize('songTimer',32);
				if fullStat then
					makeLuaText("tnh", '', 250, tnhx, veloY);
					makeLuaText("cm", '', 200, -getProperty('tnh.x') + cmoffset, getProperty('tnh.y') + cmy);
					makeLuaText("sick", 'Sicks!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 30);
					makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 30);
					makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 30);
					makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 30);
					addLuaText('tnh');
					setTextBorder("sick", 1, '000001')
					setTextBorder("good", 1, '000001')
					setTextBorder("shit", 1, '000001')
					setTextBorder("bad", 1, '000001')
					setTextSize('sick', 20);
					addLuaText("sick");
					setTextAlignment('sick', 'left')
					setTextSize('good', 20);
					addLuaText("good");
					setTextAlignment('good', 'left')
					setTextSize('bad', 20);
					addLuaText("bad");
					setTextAlignment('bad', 'left')
					setTextSize('shit', 20);
					addLuaText("shit");
					setTextAlignment('shit', 'left')
				end
					makeLuaText('newScoreAcc','hey vsauce here',1000, 140, 0);
					makeLuaText('theRating','?',0,5,getProperty('shit.y')+ 30);
					setTextBorder("newScoreAcc", 1, '000001')
					setTextBorder("theRating", 1, '000001')
					setTextSize('theRating',20);
					setTextSize('newScoreAcc',20);
				if downscroll then
					makeLuaText('sogn', '', 0, 3, 680);
					makeLuaText('stor', '', 0,1152, 675);
				  elseif not downscroll then
						makeLuaText('sogn', '', 0, 3, 2);
						makeLuaText('stor', '', 0, 1146, 2);
						end
						setTextBorder("sogn", 1, '000001')
						setTextBorder("stor", 1, '000001')
						setTextAlignment('sogn', 'left');
						setTextSize('sogn',18)
						setTextAlignment('stor', 'right');
						setTextSize('stor',19)
						setTextColor('sogn', 'E5E7E9');
						setTextAlignment('theRating', 'left');
						addLuaText('sogn');
						addLuaText('stor');
						addLuaText('newScoreAcc');
						addLuaText('theRating');
					   if isStoryMode then
						setTextString('stor','(FUNNY)');
						else
						setTextString('stor','(FUNNY)');
					   end
					   makeLuaText('daHudVer', 'LaztrixHUD 2.7', 0,1146, 698);
					   makeLuaText('daVer','Psych Engine '.. getPropertyFromClass('MainMenuState', 'psychEngineVersion'),0,3,698);
					addLuaText('daVer');
					addLuaText('daHudVer');
					setTextBorder("daVer", 1, '000001')
					setTextBorder("daHudVer", 1, '000001')
				if not noSongBar then
					setProperty('wot.alpha', 1* 0)
					setProperty('tnh.alpha',0)
					setProperty('sogn.alpha',0)
				   end
				end
				if playOpponent then
					if difficulty == 0 then 
					 setTextString('sogn',songName .. ' - Easy (Opponent)');
					elseif difficulty == 1 then
					 setTextString('sogn',songName .. ' - Normal (Opponent)');
					elseif difficulty == 2 then
					setTextString('sogn',songName .. ' - Hard (Opponent)');
					elseif difficulty == 3 then
					setTextString('sogn',songName .. ' - Custom (Opponent)');
					end
				   else
					 if difficulty == 0 then 
					 setTextString('sogn',songName .. ' - FUN');
					elseif difficulty == 1 then
					 setTextString('sogn',songName .. ' - Normal');
					elseif difficulty == 2 then
					setTextString('sogn',songName .. ' - Hard');
					elseif difficulty == 3 then
					setTextString('sogn',songName .. ' - Custom');
					end
				 end
				 if not watermark then -- not gonna reposition the item cuz im lazy af
					setProperty('daVer.visible',false)
					setProperty('daHudVer.visible',false)
				 end
				end
				end
				sgend = false
				yValuebotPlay = 0;
				woosh = -69420
				assetTag = {'sogn','wot','tnh','wtf','wtf2','sick','good','bad','shit','scoreTxt'} --idk why it doesnt work maybe cus am not good at lua yet
				function onCreatePost()
				if playOpponent then
					if not middlescroll then
						for i=0, getProperty('playerStrums.length')-1 do 
							setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x'))
						end
						for i=0, getProperty('opponentStrums.length')-1 do
							setPropertyFromGroup('opponentStrums', i, 'x', 732 + i*112)
						end
					end
				
					for i=0, getProperty('unspawnNotes.length') do 
						setPropertyFromGroup('unspawnNotes', i, 'mustPress', not getPropertyFromGroup('unspawnNotes', i, 'mustPress'))
						if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
							setPropertyFromGroup('unspawnNotes', i, 'noteType', 'No Animation')
						end
					end
				end
					if not camFolChar then
					setProperty('cameraSpeed', 2.1)
					end
				if HudType == "Muffin" then
					setProperty('timeBarBG.visible', false)
					setProperty('timeBar.visible', false)
					setProperty('timeTxt.visible', false)
					setProperty('scoreTxt.visible', false)
				end
				if HudType == "Forever" then
					setProperty('timeBarBG.visible', false)
					setProperty('timeBar.visible', false)
					setProperty('timeTxt.visible', false)
					setProperty('scoreTxt.visible', false)
				end
			    if HudType == "Kade" then
				  setProperty('timeTxt.visible',false)
				  setProperty('scoreTxt.visible',false)
				  setProperty('timeBarBG.visible',false)
				  makeLuaText("nametext", songName, 0, 600, 19.5)
				  setTextSize('nametext', 18)
				  addLuaText("nametext")
				  setTextAlignment('nametext', 'left')
				  if downscroll then
				  setProperty('healthBar.y',getProperty('healthBar.y') - 30)
				  setProperty('iconP1.y',getProperty('iconP1.y') - 20)
				  setProperty('iconP2.y',getProperty('iconP2.y') - 20)
				  setProperty('scoreTxt.y',getProperty('scoreTxt.y') - 20)
				  else
				  setProperty('healthBar.y',getProperty('healthBar.y') + 5)
				  setProperty('iconP1.y',getProperty('iconP1.y') + 10)
				  setProperty('iconP2.y',getProperty('iconP2.y') + 10)
				  setProperty('scoreTxt.y',getProperty('scoreTxt.y') + 10)
				  end
				  setProperty('timeBarBG.visible', false)
				  setProperty('timeBar.visible', false)
				  setProperty('timeTxt.visible', false)
				  setProperty('scoreTxt.visible', false)
				end
				if HudType == "Laztrix" then
				setProperty('showCombo',false)
				setProperty('showRating',false)
				setProperty('timeBar.color',getColorFromHex('00C2FB'))
				setProperty('scoreTxt.visible',false)
				setProperty('timeTxt.visible',false)
				setProperty('healthBarBG.scale.x',1.2)
				setProperty('healthBar.scale.x',1.2)
				setObjectOrder('songTimer',getObjectOrder('timeTxt')+ 1)
				if hideHud then
					setProperty('songTimer.visible',false)
					setProperty('newScoreAcc.visible',false)
					setProperty('daVer.visible',false)
					setProperty('daHudVer.visible',false)
					setProperty('tnh.alpha',0)
					noSongBar = true;
				end
				   if downscroll then
				  setProperty('healthBar.y', 50)
				  setProperty('iconP1.y', -25)
				  setProperty('iconP2.y', -25)
				  setProperty('scoreTxt.y',80)
				  setProperty('songTimer.y', getProperty('timeTxt.y'))
				for i = 0,7 do
					setPropertyFromGroup('strumLineNotes', i, 'y', 900)
				end
				end
				   if not downscroll then
				   setProperty('songTimer.y', 10)
				   setProperty('scoreTxt.y',690)
				   setProperty('healthBar.y', 670)
				   setProperty('iconP1.y', 585)
				   setProperty('iconP2.y', 585)
				   for i = 0,7 do
					setPropertyFromGroup('strumLineNotes', i, 'y', -200)
				end
				end
				end
				if downscroll then
					yValuebotPlay = 50;
				 else
					yValuebotPlay = -120
				 end
				 if noCountdown then
					if dacountdown == "hide" then
						setProperty('countdownReady.visible', false)
						setProperty('countdownSet.visible', false)
						setProperty('countdownGo.visible', false)
					  end
					end
				if maniaMode then
					setProperty('sogn.visible', false) -- so many xd 2
					setProperty('wot.visible', false)
					setProperty('tnh.visible', false)
					setProperty('wtf.visible', false)
					setProperty('wtf2.visible', false)
					setProperty('sick.visible', false)
					setProperty('good.visible', false)
					setProperty('bad.visible', false)
					setProperty('shit.visible', false)
					setProperty('stor.visible', false)
					setProperty('timeTxt.visible', false)
					setProperty('scoreTxt.visible',false)
					setProperty('theRating.visible',false)
					setProperty('newScoreAcc.visible',false)
					camFolChar = false;
					setProperty('healthBar.angle', 90)
					setProperty('healthBar.x', 600 + 0)
					if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
						setProperty('healthBar.y', 300)
					elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
						setProperty('healthBar.y', 410)
					end
				end
				if sgend == false then
					setPropertyFromClass('lime.app.Application', 'current.window.title', 'FUN IS INFINITE | '..getProperty('curSong'))
					end
				end
				
				-- form 4k_funny
				accel_x = 0
				accel_x2 = 0
				bounce = 0
				bf_flip = 1
				pos_x = 800
				------------
				-- form [psych discord]
				local campointx = 0
				local campointy = 0
				local bfturn = false
				local camMovement = 35
				local velocity = 1.8

				function onMoveCamera(focus)
				 if camFolChar then
					if focus == 'boyfriend' then
					campointx = getProperty('camFollow.x')
					campointy = getProperty('camFollow.y')
					bfturn = true
					setProperty('cameraSpeed', 1.3)
					elseif focus == 'dad' then
					campointx = getProperty('camFollow.x')
					campointy = getProperty('camFollow.y')
					bfturn = false
					setProperty('cameraSpeed', 1.3)
					end
				 end
				end
				-------------
				function onCountdownTick(counter)
				if counter == 3 then
					setProperty('camZooming',true)
				end
				 if getProperty('skipCountdown') == false then
					if counter == 1 then
					   for nutsO = 0,3 do
						noteTweenY('het'..nutsO, nutsO, defaultOpponentStrumY0, 0.8 ,"circInOut")
					   end
					   for nutsP = 4,7 do
						noteTweenY('hetew'..nutsP, nutsP, defaultPlayerStrumY0, 0.8 ,"circInOut")
					   end
					end
				  end
				end
				
				function onUpdatePost()
					if not iconBop and HudType == "Laztrix" then
						setProperty('iconP1.x', screenWidth - 350)
	                    setProperty('iconP2.x', 210)
					end
				end



				theduckingRating = "N/A"
				theduckingRatingAlt = "N/A"
				function onUpdate()
					if ratingName == '?' then
						theduckingRating = "N/A"
					elseif ratingName == 'You Suck!' then
						theduckingRating ='Dude for real?'
						theduckingRatingAlt = 'wtf dude?'
					elseif ratingName == 'Shit' then
						theduckingRating ='CLEAR'
						theduckingRatingAlt = 'F'
					elseif ratingName == 'Bad' then
						theduckingRating ='F'
						theduckingRatingAlt = 'E'
					elseif ratingName == 'Bruh' then
						theduckingRating ='E'
						theduckingRatingAlt = 'D'
					elseif ratingName == 'Meh' then
						theduckingRating ='D'
						theduckingRatingAlt = 'B'
					elseif ratingName == 'Nice' then
						theduckingRating ='C'	
						theduckingRatingAlt = 'B'
					elseif ratingName == 'Good' then
						theduckingRating ='B'
						theduckingRatingAlt = 'A'
					elseif ratingName == 'Great' then
						theduckingRating ='A'
						theduckingRatingAlt = 'A'
					elseif ratingName == 'Sick!' then
						theduckingRating ='S'
						theduckingRatingAlt = 'AA'
					elseif ratingName == 'Perfect!!' then
						theduckingRating ='S+'
						theduckingRatingAlt = 'AAA'
					elseif botPlay == true then
						theduckingRating ='N/A'
						theduckingRatingAlt = 'N/A'
					end
				if not inGameOver then --making the chance of crashing while gameover lower [hopefully]
				if not maniaMode then
				 if winIcon then
				  if boyfriendName == 'bf' then
					makeLuaSprite('wii', 'extraimage/bf-win', getProperty('iconP1.x'), getProperty('iconP1.y'))
					setObjectCamera('wii', 'hud')
					setObjectOrder('wii', getObjectOrder('iconP1') + 1)
					addLuaSprite('wii', true)
					setProperty('wii.flipX', true)
					setProperty('wii.visible', false)
					setProperty('wii.x', getProperty('iconP1.x'))
					setProperty('wii.angle', getProperty('iconP1.angle'))
					setProperty('wii.y', getProperty('iconP1.y'))
					setProperty('wii.scale.x', getProperty('iconP1.scale.x'))
					setProperty('wii.scale.y', getProperty('iconP1.scale.y'))
				  else
					setProperty('wii.visible',false)
					setProperty('iconP1.visible',true)
				  end
				end
				end
				
				if emote then
				 if daemote == '' then
					 if keyJustPressed('space') then
						triggerEvent('Hey!','BF', '0.6')
						playSound('hey', 1.5, 'heydo')
					end
				 else
					  if keyJustPressed('space') then
					  triggerEvent('Play Animation',daemote, 'BF')
				   end
				  end
				end
				if HudType == "Laztrix" and not iconBop then
					if getProperty('health') > 1.6 then
						omgf = (getSongPosition())
						setProperty('iconP1.angle',1 *math.sin(omgf))
						setProperty('iconP2.angle',2 *math.sin(omgf))
					elseif getProperty('health') < 0.4 then
						omgf = (getSongPosition())
						setProperty('iconP2.angle',1 *math.sin(omgf))
						setProperty('iconP1.angle',2 *math.sin(omgf))
					else
						setProperty('iconP1.angle',0)
						setProperty('iconP2.angle',0)
					end
				end
				 if botPlay then
				  doTweenAlpha('tx','scoreTxt', 0, 0.3, 'linear')
				 end
				if HudType == "Muffin" then
					setTextString('vansco','Scores: '..score)
				end
				if HudType == "Forever" then
					for i = 0,7 do
						setPropertyFromGroup('strumLineNotes',i,'alpha',0.85)
					end
					setObjectOrder('newScoreAcc',getObjectOrder('scoreTxt'))
					setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
				  if HudTypeSubkey == "Extra" then
					setTextString('newScoreAcc','Score: '..score..' // Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'..' [' .. ratingFC .. ']'..' // Combo Breaks: '..misses..' // Rank: '..theduckingRating)
				  else
					setTextString('newScoreAcc','Score: '..score..' // Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'..' [' .. ratingFC .. ']'..' // Rank: '..theduckingRating)
				  end
				end

				if HudType == "Kade" then
					scaleObject('green', 1.965 * getProperty("songPercent"), .035)
                    setObjectOrder('newScoreAcc',getObjectOrder('scoreTxt'))
					if downscroll then -- downscroll only
						setProperty('black.y', 690)
						setProperty('gray.y', 695)
						setProperty('green.y', 695)
						setProperty('nametext.y', 690)
					end
					setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
					setTextString('newScoreAcc','Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..' % (' .. ratingFC .. ') '..theduckingRatingAlt)
				 if fullStat then
					setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
					setTextString('good', 'Goods: ' .. getProperty('goods'))
					setTextString('bad', 'Bads: ' .. getProperty('bads'))
					setTextString('shit', 'Shits: ' .. getProperty('shits'))
				 end
				end
				if HudType == "Laztrix" then
					setObjectOrder('newScoreAcc',getObjectOrder('scoreTxt'))
					setProperty('songTimer.angle',getProperty('timeTxt.angle'))
					setTextString('songTimer',"" .. milliToHuman(math.floor(songLength - (getPropertyFromClass('Conductor', 'songPosition') - noteOffset))) .. "")
				 if not noSongBar then
					setProperty('wtf.y', getProperty('wot.y') + 90)
					setProperty('wtf.x', getProperty('wot.x') + 70)
					setProperty('wtf2.y', getProperty('wot.y') + 10)
					setProperty('wtf2.x', getProperty('wot.x') + 60)
					setProperty('wtf.alpha', getProperty('wot.alpha'))
					setProperty('wtf2.alpha', getProperty('wot.alpha'))
					setProperty('stor.alpha', getProperty('sogn.alpha'))
				 end
					setTextString('theRating','[' .. ratingFC .. ']')
					setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
					setTextString('newScoreAcc','Score: '..score..' | Note Missed: '..misses..' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%')
				 if fullStat then
					setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
					setTextString('good', 'Goods: ' .. getProperty('goods'))
					setTextString('bad', 'Bads: ' .. getProperty('bads'))
					setTextString('shit', 'Shits: ' .. getProperty('shits'))
				 end
					setProperty('sick.alpha', getProperty('tnh.alpha'))
					setProperty('good.alpha', getProperty('tnh.alpha'))
					setProperty('bad.alpha', getProperty('tnh.alpha'))
					setProperty('shit.alpha', getProperty('tnh.alpha'))
					setProperty('songTimer.alpha',getProperty('tnh.alpha'))
					setProperty('theRating.alpha',getProperty('tnh.alpha'))
				end
				
				if funnybf then
				  if keyPressed("left") then
						bounce = (1 - math.abs(accel_x)/5)
						bf_flip = 1
					elseif keyPressed("up") then
						bounce = bounce*0.8 + 0.25
					elseif keyPressed("down") then
						bounce = bounce*0.7 + 0.25
					elseif keyPressed("right") then
						bounce = (1 - math.abs(accel_x)/5)
						bf_flip = -1
					else
						accel_x2 = accel_x2 + (1 - bounce)/5
						bounce = (bounce*0.8 + 0.2) + accel_x2
					end
				 
					if keyPressed("left") then
						accel_x = accel_x*0.75 - 1*0.25
					elseif keyPressed("right") then
						accel_x = accel_x*0.75 + 1*0.25
					else
						accel_x = (accel_x)*0.8
					end
				 
					pos_x = pos_x + accel_x*6
					setProperty('boyfriend.x', pos_x - 1/bounce * 150)
					setProperty('boyfriend.y', 100 + 1/bounce * 350)
					scaleObject('boyfriend', bf_flip/bounce, bounce)
				end
				if boyfriendName == 'bf' and winIcon then
				   if getProperty('health') > 1.6 then
					 setProperty('iconP1.visible', false)
					 setProperty('wii.visible', true)
				  elseif getProperty('health') < 0.4 then
					 setProperty('iconP1.visible', true)
					 setProperty('wii.visible', false)
				  else
					 setProperty('iconP1.visible', true)
					 setProperty('wii.visible', false)
				   end
				end
			end
				end
				
				function onStepHit()
				if HudType == "Laztrix" then
				   if curStep == 1 then
					for nutsO = 0,3 do
						noteTweenY('het'..nutsO, nutsO, defaultOpponentStrumY0, 0.8 ,"circInOut")
					   end
					   for nutsP = 4,7 do
						noteTweenY('hetew'..nutsP, nutsP, defaultPlayerStrumY0, 0.8 ,"circInOut")
					   end
					end
				
					 if curStep == 1 then
					  doTweenAlpha('wota', 'wot', 1 , 0.8, 'quadInOut')
					doTweenY('wote', 'wot', 0 , 0.8, 'quadInOut')
				   end
				
				  if curStep == 25 then 
					doTweenAlpha('wota', 'wot', 0 , 1, 'quadInOut')
					doTweenY('wote', 'wot', -200 , 0.8, 'quadInOut')
					doTweenAlpha('shog', 'sogn', 1 , 1, 'quadInOut')
					doTweenAlpha('shoge', 'tnh', 1 , 1, 'quadInOut')
					end
				end
				end
				
				function onBeatHit()
					color1 = getColorFromHex('00C2FB');
					color2 = getColorFromHex('FB8900');
					if dazoom then
						if getProperty('curBeat')% 2 == 0 then
							setProperty('camHUD.zoom',0.98)
							setProperty('camGame.zoom',getProperty('camGame.zoom')- 0.025)
						  end
						end
				if iconBop then
					if getProperty('curBeat') % 1 == 0 then
							setProperty('timeTxt.angle',1*-10)
							doTweenAngle('ho','timeTxt', 0, 0.2, 'quadInOut')
							setProperty('iconP1.angle',1*10)
							setProperty('iconP2.angle',1*10)
							doTweenAngle('re', 'iconP1', 0, 0.5, 'quintOut')
							doTweenAngle('ree', 'iconP2', 0, 0.5, 'quintOut')
					end
					if getProperty('curBeat') % 2 == 0 then
					  if HudType == "Laztrix" then
						setProperty('newScoreAcc.scale.x',1.05)
						setProperty('newScoreAcc.scale.y',1.05)
					  end
						doTweenX('scorexet','newScoreAcc.scale', 1, 0.5, 'quadInOut')
						doTweenY('scoreyet','newScoreAcc.scale', 1, 0.5, 'quadInOut')
							setProperty('timeTxt.angle',1*10)
							doTweenAngle('ho','timeTxt', 0, 0.2, 'quadInOut')
							setProperty('iconP1.angle',1*-10)
							setProperty('iconP2.angle',1*-10)
							doTweenAngle('re', 'iconP1', 0, 0.5, 'quintOut')
							doTweenAngle('ree', 'iconP2', 0, 0.5, 'quintOut')
				   end
				end
				   if spen then
					if getProperty('curBeat')%  25 == 0 then
						for i = 4,7 do 
						setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
						noteTweenAngle("yez " .. i, i, 360, 0.2, "quadInOut")
						end
						for i = 0,3 do 
							setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
							noteTweenAngle("yezz " .. i, i, -360, 0.2, "quadInOut")
							end
					  end
				  end
				  end
			
				local directions = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
				
				
				
				function opponentNoteHit(id, direction, noteType, isSustainNote)
					newBeat = true
				if playOpponent then
					triggerEvent('Play Animation',directions[direction + 1], 'BF')
					runTimer('bfIdle',0.55)
				end
				  if camFolChar then 
					if not bfturn then
						if direction == 0 then
							setProperty('camFollow.x', campointx - camMovement)
						elseif direction == 1 then
							setProperty('camFollow.y', campointy + camMovement)
						elseif direction == 2 then
							setProperty('camFollow.y', campointy - camMovement)
						elseif direction == 3 then
							setProperty('camFollow.x', campointx + camMovement)
						end
						setProperty('cameraSpeed', velocity)
					elseif bfturn and playOpponent then
						if direction == 0 then
							setProperty('camFollow.x', campointx - camMovement)
						elseif direction == 1 then
							setProperty('camFollow.y', campointy + camMovement)
						elseif direction == 2 then
							setProperty('camFollow.y', campointy - camMovement)
						elseif direction == 3 then
							setProperty('camFollow.x', campointx + camMovement)
						end
					end
				end
				  if noteBop then
					if downscroll then
					 if direction == 0 then
						setPropertyFromGroup('strumLineNotes', 0, 'y', defaultOpponentStrumY0 + 23)
						noteTweenY('lolpart', 0, defaultOpponentStrumY0, 0.3 ,"bounceOut")
					 elseif direction == 1 then
						setPropertyFromGroup('strumLineNotes', 1, 'y', defaultOpponentStrumY1 + 23)
						noteTweenY('lolpart2', 1, defaultOpponentStrumY1, 0.3 ,"bounceOut")
					 elseif direction == 2 then
						setPropertyFromGroup('strumLineNotes', 2, 'y', defaultOpponentStrumY2 + 23)
						noteTweenY('lolpart3', 2, defaultOpponentStrumY2, 0.3 ,"bounceOut")
					 elseif direction == 3 then
						setPropertyFromGroup('strumLineNotes', 3, 'y', defaultOpponentStrumY3 + 23)
						noteTweenY('lolpart4', 3, defaultOpponentStrumY3, 0.3 ,"bounceOut")
					 end
					else
						if direction == 0 then
							setPropertyFromGroup('strumLineNotes', 0, 'y', defaultOpponentStrumY0 - 23)
							noteTweenY('lolpart', 0, defaultOpponentStrumY0, 0.3 ,"bounceOut")
						 elseif direction == 1 then
							setPropertyFromGroup('strumLineNotes', 1, 'y', defaultOpponentStrumY1 - 23)
							noteTweenY('lolpart2', 1, defaultOpponentStrumY1, 0.3 ,"bounceOut")
						 elseif direction == 2 then
							setPropertyFromGroup('strumLineNotes', 2, 'y', defaultOpponentStrumY2 - 23)
							noteTweenY('lolpart3', 2, defaultOpponentStrumY2, 0.3 ,"bounceOut")
						 elseif direction == 3 then
							setPropertyFromGroup('strumLineNotes', 3, 'y', defaultOpponentStrumY3 - 23)
							noteTweenY('lolpart4', 3, defaultOpponentStrumY3, 0.3 ,"bounceOut")
				   end
				 end
				end
				  if healthdrain then
					if getProperty('health') > 0.2 then
					setProperty('health',getProperty('health')-0.02)
					end
				  end
				end
                
				local sicktrack = 0
				local goodtrack = 0
				local badtrack = 0
				local shittrack = 0
				local theimage1 = ''
				local theimage2 = ''
				local theimage3 = ''
				local theimage4 = ''
				function goodNoteHit(id, direction, noteType, isSustainNote)
				if HudType == 'Laztrix' then
					followgfx = getProperty('gf.x') + 80
					followgfy = getProperty('gf.y') + 150
					if not isSustainNote then
					if sicktrack < getProperty('sicks') then
						sicktrack = sicktrack + 1
						if isPixelStage then
						theimage1 = 'extraimage/sick-pixel'
					elseif not isPixelStage then
							theimage1 = 'sick'
						end
						makeLuaSprite('sick' .. getProperty('combo'), theimage1 , followgfx, followgfy)
						setObjectCamera('sick' .. getProperty('combo'), 'game')
						setObjectOrder('sick'..getProperty('combo'),getObjectOrder('gf'))
						scaleObject('sick' .. getProperty('combo'), 0.55, 0.55)
						addLuaSprite('sick' .. getProperty('combo'), true)
						setProperty('sick' .. getProperty('combo') .. '.velocity.y', 500)
						setProperty('sick' .. getProperty('combo') .. '.velocity.y', 100)
						if isPixelStage then
							setProperty('sick'..getProperty('combo').. '.antialiasing',false)
						end
						doTweenAlpha('tweensick' .. getProperty('combo'), 'sick' .. getProperty('combo'), 0, 0.5, 'quartIn')
					end
					if goodtrack < getProperty('goods') then
						goodtrack = goodtrack + 1
						if isPixelStage then
						theimage2 = 'extraimage/good-pixel'
					elseif not isPixelStage then
						theimage2 = 'good'
						end
						makeLuaSprite('good' .. getProperty('combo'), theimage2, followgfx, followgfy)
						setObjectCamera('good' .. getProperty('combo'), 'game')
						scaleObject('good' .. getProperty('combo'), 0.55, 0.55)
						setObjectOrder('good'..getProperty('combo'),getObjectOrder('gf'))
						addLuaSprite('good' .. getProperty('combo'), true)
						setProperty('good' .. getProperty('combo') .. '.velocity.y', 500)
						setProperty('good' .. getProperty('combo') .. '.velocity.y', 100)
						if isPixelStage then
							setProperty('good'..getProperty('combo').. '.antialiasing',false)
						end
						doTweenAlpha('tweengood' .. getProperty('combo'), 'good' .. getProperty('combo'), 0, 0.5, 'quartIn')
					end
					if badtrack < getProperty('bads') then
						badtrack = badtrack + 1
						if isPixelStage then
						   theimage3 = 'extraimage/bad-pixel'
						elseif not isPixelStage then
						theimage3 = 'bad'
						end
						makeLuaSprite('bad' .. getProperty('combo'), theimage3, followgfx, followgfy)
						setObjectCamera('bad' .. getProperty('combo'), 'game')
						scaleObject('bad' .. getProperty('combo'), 0.55, 0.55)
						setObjectOrder('bad'..getProperty('combo'),getObjectOrder('gf'))
						addLuaSprite('bad' .. getProperty('combo'), true)
						setProperty('bad' .. getProperty('combo') .. '.velocity.y', 500)
						setProperty('bad' .. getProperty('combo') .. '.velocity.y', 100)
						if isPixelStage then
							setProperty('bad'..getProperty('combo').. '.antialiasing',false)
						end
						doTweenAlpha('tweenbad' .. getProperty('combo'), 'bad' .. getProperty('combo'), 0, 0.5, 'quartIn')
					end
					if shittrack < getProperty('shits') then
						shittrack = shittrack + 1
						if isPixelStage then
						theimage4 = 'extraimage/shit-pixel'
					    elseif not isPixelStage then
						theimage4 = 'shit'
						end
						makeLuaSprite('shit' .. getProperty('combo'), theimage4, followgfx, followgfy)
						setObjectCamera('shit' .. getProperty('combo'), 'game')
						setObjectOrder('shit'..getProperty('combo'),getObjectOrder('gf'))
						scaleObject('shit' .. getProperty('combo'), 0.55, 0.55)
						addLuaSprite('shit' .. getProperty('combo'), true)
						setProperty('shit' .. getProperty('combo') .. '.velocity.y', 500)
						setProperty('shit' .. getProperty('combo') .. '.velocity.y', 100)
						if isPixelStage then
							setProperty('shit'..getProperty('combo').. '.antialiasing',false)
						end
						doTweenAlpha('tweenshit' .. getProperty('combo'), 'shit' .. getProperty('combo'), 0, 0.5, 'quartIn')
					end
				end
				end
				if playOpponent then
					triggerEvent('Play Animation',directions[direction + 1], 'DAD')
					runTimer('dadIdle',0.55)
				end
				if camFolChar then
					if bfturn then
						if direction == 0 then
							setProperty('camFollow.x', campointx - camMovement)
						elseif direction == 1 then
							setProperty('camFollow.y', campointy + camMovement)
						elseif direction == 2 then
							setProperty('camFollow.y', campointy - camMovement)
						elseif direction == 3 then
							setProperty('camFollow.x', campointx + camMovement)
						end
						setProperty('cameraSpeed', velocity)
					elseif not bfturn and playOpponent then
						if direction == 0 then
							setProperty('camFollow.x', campointx - camMovement)
						elseif direction == 1 then
							setProperty('camFollow.y', campointy + camMovement)
						elseif direction == 2 then
							setProperty('camFollow.y', campointy - camMovement)
						elseif direction == 3 then
							setProperty('camFollow.x', campointx + camMovement)
						end
					end
				end
				if noteBop then
					if downscroll then
						if direction == 0 then
						setPropertyFromGroup('strumLineNotes', 4, 'y', defaultPlayerStrumY0 + 23)
						noteTweenY('lol', 4, defaultPlayerStrumY0, 0.3 ,"bounceOut")
					 elseif direction == 1 then
						setPropertyFromGroup('strumLineNotes', 5, 'y', defaultPlayerStrumY1 + 23)
						noteTweenY('lol2', 5, defaultPlayerStrumY1, 0.3 ,"bounceOut")
					 elseif direction == 2 then
						setPropertyFromGroup('strumLineNotes', 6, 'y', defaultPlayerStrumY2 + 23)
						noteTweenY('lol3', 6, defaultPlayerStrumY2, 0.3 ,"bounceOut")
					 elseif direction == 3 then
						setPropertyFromGroup('strumLineNotes', 7, 'y', defaultPlayerStrumY3 + 23)
						noteTweenY('lol4', 7, defaultPlayerStrumY3, 0.3 ,"bounceOut")
					 end
					end
					   if not downscroll then
						if direction == 0 then
							setPropertyFromGroup('strumLineNotes', 4, 'y', defaultPlayerStrumY0 - 23)
							noteTweenY('lol', 4, defaultPlayerStrumY0, 0.3 ,"bounceOut")
						 elseif direction == 1 then
							setPropertyFromGroup('strumLineNotes', 5, 'y', defaultPlayerStrumY1 - 23)
							noteTweenY('lol2', 5, defaultPlayerStrumY1, 0.3 ,"bounceOut")
						 elseif direction == 2 then
							setPropertyFromGroup('strumLineNotes', 6, 'y', defaultPlayerStrumY2 - 23)
							noteTweenY('lol3', 6, defaultPlayerStrumY2, 0.3 ,"bounceOut")
						 elseif direction == 3 then
							setPropertyFromGroup('strumLineNotes', 7, 'y', defaultPlayerStrumY3 - 23)
							noteTweenY('lol4', 7, defaultPlayerStrumY3, 0.3 ,"bounceOut")
					   end
					 end
				  end
				
				end
				
				function onTweenCompleted(t)
					for nuts = 0,7 do
					  if t == 'speen'..nuts then
						  setPropertyFromGroup('strumLineNotes', nuts, 'angle', 0)
					  end
					 end 
				end
				
				function onTimerCompleted(t) 
				if playOpponent then
				   if t == 'dadIdle' then
					characterPlayAnim('dad', 'danceLeft',true);
					characterPlayAnim('dad', 'idle',true);
				   elseif t == 'bfIdle' then
					characterPlayAnim('boyfriend', 'danceLeft',true);
					characterPlayAnim('boyfriend', 'idle',true);
				   end
				end
				end
				  
				
				function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
					n = math.pow(10, n or 0)
					x = x * n
					if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
					return x / n
				end
				
				function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
					local totalseconds = math.floor(milliseconds / 1000)
					local seconds = totalseconds % 60
					local minutes = math.floor(totalseconds / 60)
					minutes = minutes % 60
					return string.format("%02d:%02d", minutes, seconds)  
				end
				function onDestroy()
					sgend = true
					setPropertyFromClass('lime.app.Application', 'current.window.title', 'Laztrix Engine')
				end