function Wait(S)
  local St = os.time()
  repeat until os.time() > St + S
end