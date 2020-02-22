function love.load()
  CursorImg = love.graphics.newImage("Data/UI/Cursor.png")
  ClickButton1 = ConstructButton("Fight me", {UICX, UICY}, 10, "TestButton1", 0)
  ClickButton1.mouseButtonLClick:connect(function()
    ClickButton1.backgroundColor = {1, 0, 0, 1}
  end)
end
function love.update(DT)
  GUIUpdate(DT)
end
function love.draw()
  GUIDraw()
  love.graphics.draw(CursorImg, (love.mouse.getX()-5), (love.mouse.getY()-5))
end