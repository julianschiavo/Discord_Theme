// Simply insert that into the head
var pluginURL = (link) => '<link href="'+link+'" type="text/css" rel="stylesheet">'

chrome.storage.sync.get({
  customcss: "",
  discordtheme: true
},function(items) {
  if (items.discordtheme == true) {
    document.querySelector('head').innerHTML += pluginURL("https://discordtheme.alexflipnote.xyz/theme.css");
  }

  if (items.customcss.length > 2) {
    document.querySelector('head').innerHTML += "<style>"+items.customcss+"</style>"
  }
})
