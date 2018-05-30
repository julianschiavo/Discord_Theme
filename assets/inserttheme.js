// Simply insert that into the head
var pluginURL = (link) => '<link href="'+link+'" type="text/css" rel="stylesheet">'
document.querySelector('head').innerHTML += pluginURL("https://rawgit.com/AlexFlipnote/Discord_Theme/master/theme.css");

chrome.storage.sync.get({
  transparent: false,
  transparentbackground: false,
  blocked: false,
  wideguilds: false
},function(items) {
  console.log(items)
  if (items.transparent == true) {
    document.querySelector('head').innerHTML += pluginURL("https://rawgit.com/AlexFlipnote/Discord_Theme/master/plugins/transparent.css")
    document.querySelector('head').innerHTML += `
      <style>
        .app { background: rgba(0, 0, 0, 0.75); }
        body {
          background: url(${items.transparentbackground});
          background-size: cover; background-attachment: fixed; background-position: center; background-repeat: no-repeat;
        }
      </style>
    `
  }

  if (items.blocked == true) {
    document.querySelector('head').innerHTML += pluginURL("https://rawgit.com/AlexFlipnote/Discord_Theme/master/plugins/blocked.css")
  }

  if (items.wideguilds == true) {
    document.querySelector('head').innerHTML += pluginURL("https://rawgit.com/AlexFlipnote/Discord_Theme/master/plugins/wideGuilds.css")
  }
})
