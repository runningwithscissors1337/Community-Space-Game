DrawTableUI = {}
DrawTableGame = {}
DrawTableBack = {}
function DrawInOrder(Table)
  for K,V in pairs(Table) do
    V:gDraw()
  end
  end
function ConstructButton(Text, Position, Padding, TName, Depth)
  button = TextButton:new()
  button.text = Text
  button.position = Position
  button.textFittingMinimumPadding = Padding
  button.zIndex = Depth
  button:resizeToText()
  return button
end