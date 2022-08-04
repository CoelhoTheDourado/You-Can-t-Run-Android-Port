function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Pixel');
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture','pixel_sp');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475');
		end
	end
end