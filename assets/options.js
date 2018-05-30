// Saves options to chrome.storage
function save_options() {
  var transparent = document.getElementById('transparent').checked;
  var transparentbackground = document.getElementById('transparentbackground').value;
  var blocked = document.getElementById('blocked').checked;
  var wideguilds = document.getElementById('wideguilds').checked;

  chrome.storage.sync.set({
    transparent: transparent,
    transparentbackground: transparentbackground,
    blocked: blocked,
    wideguilds: wideguilds
  }, function() {
    // Update status to let user know options were saved.
    var status = document.getElementById('status');
    status.textContent = 'Options saved.';
    setTimeout(function() {
      status.textContent = '';
    }, 750);
  });
}

// Restores select box and checkbox state using the preferences
// stored in chrome.storage.
function restore_options() {
  chrome.storage.sync.get({
    transparent: false,
    transparentbackground: false,
    blocked: false,
    wideguilds: false
  }, function(items) {
    document.getElementById('transparent').checked = items.transparent;
    document.getElementById('transparentbackground').value = items.transparentbackground;
    document.getElementById('blocked').checked = items.blocked;
    document.getElementById('wideguilds').checked = items.wideguilds;
  });
}

document.addEventListener('DOMContentLoaded', restore_options);
document.getElementById('save').addEventListener('click', save_options);
