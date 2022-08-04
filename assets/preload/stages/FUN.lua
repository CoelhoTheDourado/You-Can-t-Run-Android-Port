function onCreate()
	-- background shit
	makeLuaSprite('thefrickinbg', 'SonicP2/thebgshit', -790, -520);

	setProperty('thefrickinbg.antialiasing', true);






	addLuaSprite('thefrickinbg', false);



end

function onStepHit()
	if curStep == 528 then
		triggerEvent('Change Character', 'bf', 'bf-pixel');

		triggerEvent('Change Character', 'gf', 'gf-pixel');

		triggerEvent('Change Character', 'dad', 'majin-alt');

		setCharacterX('boyfriend', 721);

		setCharacterY('boyfriend', 379);

		setCharacterX('dad', 26);

		setCharacterY('dad', 379);

		setCharacterX('gf', 455);

		setCharacterY('gf', 202);

		setProperty('thefrickinbg.visible', false);

		setProperty('thefrickinbg2.antialiasing', true);

		makeLuaSprite('thefrickinbg2', 'SonicP2/greenhillsbiggggg', -572, -426);

		addLuaSprite('thefrickinbg2', false);
	
	end
	if curStep == 784 then
		setCharacterX('boyfriend', 650);

		setCharacterY('boyfriend', -285);

		setCharacterX('dad', -175);

		setCharacterY('dad', -300);

		setCharacterX('gf', 150);

		setCharacterY('gf', -285);

		setProperty('thefrickinbg2.visible', false);

		setProperty('thefrickinbg.visible', true);

    end
end