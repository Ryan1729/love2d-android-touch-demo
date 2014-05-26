	
function love.load()
	g = love.graphics
	vars = {}
	varNames = {}
	revVarNames = {}
	varNamesIndex = 1
	font = love.graphics.newFont("assets/press-start-2p/PressStart2P.ttf",14)
	love.graphics.setFont(font)
end


function love.update(dt)

end

function love.draw()
	--display a rectangle if for each value in vars if they are truthy 
	local buffer = 10
	local colorBuffer = 32
	local y = 0
	local height = math.max((g.getHeight() / (2 * #vars)), font:getHeight( ) + buffer)
	local width = g.getWidth()
		
	for i,v in ipairs(vars) do

		g.setColor(i * colorBuffer / 2, i * colorBuffer,  i * colorBuffer*2,255)
		g.rectangle("fill",0,y,width,height)

		y = y + height

	end
	
	y = 0
	--the words are done after so they are in front of the boxes
	for i,v in ipairs(vars) do

		g.setColor(255,255,255,255)
		g.printf( varNames[i] .. " : " .. tostring(v), 0, y + (height/2),  width, "center" )
	
		y = y + height

	end
	
	g.printf( "touch to display values", 0, g.getHeight() - buffer, width, "left" )
end

function love.mousepressed(x, y, button, istouch)
	if not mousepressedDone then
		vars[varNamesIndex] = x
		table.insert(varNames, "mousepressed x")
		revVarNames["mousepressed x"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = y
		table.insert(varNames, "mousepressed y")
		revVarNames["mousepressed y"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = button
		table.insert(varNames, "mousepressed button")
		revVarNames["mousepressed button"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		if istouch then
			vars[varNamesIndex] = istouch
			table.insert(varNames, "mousepressed istouch")
			revVarNames["mousepressed istouch"] = varNamesIndex
			varNamesIndex = varNamesIndex + 1
		end
		mousepressedDone = true
	else
		vars[revVarNames["mousepressed x"]] = x
		vars[revVarNames["mousepressed y"]] = y
		vars[revVarNames["mousepressed button"]] = button
		if istouch then		
		vars[revVarNames["mousepressed istouch"]] = istouch
		end
	end
end

function love.mousereleased(x, y, button, istouch)	
	if not mousereleasedDone then
		vars[varNamesIndex] = x
		table.insert(varNames, "mousereleased x")
		revVarNames["mousereleased x"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = y
		table.insert(varNames, "mousereleased y")
		revVarNames["mousereleased y"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = button
		table.insert(varNames, "mousereleased button")
		revVarNames["mousereleased button"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		if istouch then
			vars[varNamesIndex] = istouch
			table.insert(varNames, "mousereleased istouch")
			revVarNames["mousereleased istouch"] = varNamesIndex
			varNamesIndex = varNamesIndex + 1
		end
		mousereleasedDone = true
	else
		vars[revVarNames["mousereleased x"]] = x
		vars[revVarNames["mousereleased y"]] = y
		vars[revVarNames["mousereleased button"]] = button
		if istouch then
		vars[revVarNames["mousereleased istouch"]] = istouch
		end
	end
end

function love.keypressed(key)
	if not keypressedDone then
		vars[varNamesIndex] = key
		table.insert(varNames, "keypressed key")
		revVarNames["keypressed key"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		keypressedDone = true
	else
		vars[revVarNames["keypressed key"]] = key
	end	
end

function love.keyreleased(key)
	if not keyreleasedDone then
		vars[varNamesIndex] = key
		table.insert(varNames, "keyreleased key")
		revVarNames["keyreleased key"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		keyreleasedDone = true
	else
		vars[revVarNames["keyreleased key"]] = key
	end	
end

function love.touchpressed( id, x, y, pressure )
		if not touchpressedDone then
		vars[varNamesIndex] = id
		table.insert(varNames, "touchpressed id")
		revVarNames["touchpressed id"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = x
		table.insert(varNames, "touchpressed x")
		revVarNames["touchpressed x"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = y
		table.insert(varNames, "touchpressed y")
		revVarNames["touchpressed y"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = pressure
		table.insert(varNames, "touchpressed pressure")
		revVarNames["touchpressed pressure"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		touchpressedDone = true
	else
		vars[revVarNames["touchpressed x"]] = math.floor(x * g.getWidth())
		vars[revVarNames["touchpressed y"]] = math.floor(y * g.getHeight())
		vars[revVarNames["touchpressed pressure"]] = pressure
		vars[revVarNames["touchpressed id"]] = id
	end
end

function love.touchreleased( id, x, y, pressure )
	if not touchreleasedDone then
		vars[varNamesIndex] = id
		table.insert(varNames, "touchreleased id")
		revVarNames["touchreleased id"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = x
		table.insert(varNames, "touchreleased x")
		revVarNames["touchreleased x"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = y
		table.insert(varNames, "touchreleased y")
		revVarNames["touchreleased y"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = pressure
		table.insert(varNames, "touchreleased pressure")
		revVarNames["touchreleased pressure"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		touchreleasedDone = true
	else
		vars[revVarNames["touchreleased x"]] = math.floor(x * g.getWidth())
		vars[revVarNames["touchreleased y"]] = math.floor(y * g.getHeight())
		vars[revVarNames["touchreleased pressure"]] = pressure
		vars[revVarNames["touchreleased id"]] = id
	end
end

function love.touchmoved( id, x, y, pressure )
	if not touchmovedDone then
		vars[varNamesIndex] = id
		table.insert(varNames, "touchmoved id")
		revVarNames["touchmoved id"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = x
		table.insert(varNames, "touchmoved x")
		revVarNames["touchmoved x"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = y
		table.insert(varNames, "touchmoved y")
		revVarNames["touchmoved y"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		vars[varNamesIndex] = pressure
		table.insert(varNames, "touchmoved pressure")
		revVarNames["touchmoved pressure"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		touchmovedDone = true
	else
		vars[revVarNames["touchmoved x"]] = x
		vars[revVarNames["touchmoved y"]] = y
		vars[revVarNames["touchmoved pressure"]] = pressure
		vars[revVarNames["touchmoved id"]] = id
	end
end

function love.focus(f)
	if not focusDone then
		vars[varNamesIndex] = f
		table.insert(varNames, "focus f")
		revVarNames["focus f"] = varNamesIndex
		varNamesIndex = varNamesIndex + 1
		
		focusDone = true
	else
		vars[revVarNames["focus f"]] = f
	end
end

