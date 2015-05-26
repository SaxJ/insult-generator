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

addClass = (el, cls) ->
  el.className = el.className + " #{cls}"

removeClass = (el, cls) ->
  el.className = el.className.replace cls, ''

onVideoLoaded = ->
  el = document.getElementById('loading')
  addClass el, 'hidden'
  removeClass document.getElementById('insultButton'), 'hidden'

showVideo = ->
  el = document.getElementById 'video'
  removeClass el, 'invisible'
  el.play()

generatePhrase = ->
  words = []
  for i in [0..2]
    words[i] = WORD_GRID[Math.floor Math.random() * WORD_GRID.length][i]

  return "#{words[0]} #{words[1]} #{words[2]}"

addDom = () ->
  text = generatePhrase()
  el = document.getElementById 'insult'
  el.innerHTML = "<div class=\"fade-in\">#{text}</div>"
  setTimeout showVideo, 1500

document.getElementById('insultButton').addEventListener 'click', addDom
document.getElementById('video').addEventListener 'loadeddata', onVideoLoaded
