var WORD_GRID, addClass, addDom, generatePhrase, onVideoLoaded, removeClass, showVideo;

WORD_GRID = [['lazy', 'douche', 'pilot'], ['stupid', 'ass', 'canoe'], ['insecure', 'turd', 'captain'], ['idotic', 'rectum', 'pirate'], ['slimy', 'butt', 'hammer'], ['slutty', 'cock', 'knob'], ['smelly', 'shit', 'box'], ['pompous', 'crotch', 'jockey'], ['communist', 'bitch', 'nazi'], ['dicknose', 'turd', 'waffle'], ['pie-eating', 'prick', 'goblin'], ['racist', 'slut', 'blossom'], ['elitist', 'taint', 'biscuit'], ['white trash', 'fuck', 'clown'], ['drug loving', 'dick', 'socket'], ['butterface', 'boner', 'monster'], ['tone deaf', 'shart', 'hound'], ['ugly', 'nut', 'dragon'], ['creepy', 'sphincter', 'balloon']];

addClass = function(el, cls) {
  return el.className = el.className + (" " + cls);
};

removeClass = function(el, cls) {
  return el.className = el.className.replace(cls, '');
};

onVideoLoaded = function() {
  var el;
  el = document.getElementById('loading');
  addClass(el, 'hidden');
  return removeClass(document.getElementById('insultButton'), 'hidden');
};

showVideo = function() {
  var el;
  el = document.getElementById('video');
  removeClass(el, 'invisible');
  return el.play();
};

generatePhrase = function() {
  var i, words, _i;
  words = [];
  for (i = _i = 0; _i <= 2; i = ++_i) {
    words[i] = WORD_GRID[Math.floor(Math.random() * WORD_GRID.length)][i];
  }
  return "" + words[0] + " " + words[1] + " " + words[2];
};

addDom = function() {
  var el, text;
  text = generatePhrase();
  el = document.getElementById('insult');
  el.innerHTML = "<div class=\"fade-in\">" + text + "</div>";
  return setTimeout(showVideo, 1500);
};

document.getElementById('insultButton').addEventListener('click', addDom);

document.getElementById('video').onloadeddata = onVideoLoaded; //.addEventListener('loadeddata', onVideoLoaded);
