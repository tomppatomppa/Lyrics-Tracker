
var request = require("request");
var user_id = "matt";
var token = "bearer";
var playlist_url = "https://api.spotify.com/v1/users/"+user_id+"/{playlist_id}"

request({url:playlist_url, headers:{"Authorization": token}}, function(err, res) {
    if(res) {
        var playlists = JSON.parse(res.body);
        var playlist_url = playlists.items[0].href
        request({url:playlist_url, headers:{"Authorization": token}}, function(err, res) {

        }
    )}
})

