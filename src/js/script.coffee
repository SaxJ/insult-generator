WORD_GRID = [
  ['lazy', 'douche','pilot']
  ['stupid','ass','canoe']
  ['insecure','turd','captain']
  ['idotic','rectum','pirate']
  ['slimy','butt','hammer']
  ['slutty','cock','knob']
  ['smelly','shit','box']
  ['pompous','crotch','jockey']
  ['communist','bitch','nazi']
  ['dicknose','turd','waffle']
  ['pie-eating','prick','goblin']
  ['racist','slut','blossom']
  ['elitist','taint','biscuit']
  ['white trash','fuck','clown']
  ['drug loving','dick','socket']
  ['butterface','boner','monster']
  ['tone deaf','shart','hound']
  ['ugly','nut','dragon']
  ['creepy','sphincter','balloon']
]

generatePhrase = ->
  words = []
  for i in [0..2]
    words[i] = WORD_GRID[Math.floor Math.random() * WORD_GRID.length][i]

  return "#{words[0]} #{words[1]} #{words[2]}"
