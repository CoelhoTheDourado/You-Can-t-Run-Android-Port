function onCreate()
    makeLuaSprite('healthBar2', 'healthBar2', 260, 655)
    addLuaSprite('healthBar2', false)
    setObjectCamera('healthBar2', 'hud', 'false');

if downscroll then
    makeLuaSprite('healthBar2', 'healthBar2', 260, 45)
    addLuaSprite('healthBar2', false)
    setObjectCamera('healthBar2', 'hud', 'false');


end
end