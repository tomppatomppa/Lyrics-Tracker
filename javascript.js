function clearDrawer() {
    addSong_Drawer.titleString = ""
    addSong_Drawer.lyricString = ""
}
function toggleSetList() {
    if(set_List_Drawer.visible == false) {
        console.log("open")
        set_List_Drawer.visible = true

    }
    else {
        console.log("close")
        set_List_Drawer.popup.close()
        set_List_Drawer.visible = false


    }
}


function getDatabase() {
   return LocalStorage.openDatabaseSync("local", "1.0", "Lyric Data", 1000000);

}

function initDatabase() {

    db = LocalStorage.openDatabaseSync("local", "1.0", "Lyric Data", 100000);
    try {
            db.transaction( function(tx) {
            print('... create table')
            tx.executeSql('CREATE TABLE IF NOT EXISTS song_data(param_title TEXT, param_lyrics TEXT)');
        })
    }catch(err) {
        console.log("Error creating database")
    };
}
//Implement check if exists already
function dbInsert(titleData, LyricData) {
    var db = getDatabase()
    var rowid = 0;
    var rx = ""
    db.transaction(function(tx) {
        rx = tx.executeSql('SELECT param_title FROM song_data WHERE param_title=?', [titleData])

        if(rx.rows.length > 0) {
            console.log("title exists")
            tx.executeSql('UPDATE song_data SET param_title=? WHERE param_title=?;', [titleData, titleData])
            tx.executeSql('UPDATE song_data SET param_lyrics=? WHERE param_title=?;', [LyricData, titleData])
        }
        else {
            console.log("new title")
             tx.executeSql('INSERT INTO song_data VALUES(?,?)', [titleData, LyricData])
        }

    });


//    var result = tx.executeSql('SELECT last_insert_rowid()')
//    rowid = result.insertId
    return rowid
}
//Adds all songs to MyListView
function dbReadAll()
{
    var db = getDatabase()
    var songlist_data = []
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT param_title,param_lyrics FROM song_data')
        for (var i = 0; i < results.rows.length; i++) {
            songlist_data.push(results.rows.item(i).param_title)
            //console.log(results.rows.item(i).param_title," : ",
                        //results.rows.item(i).param_lyrics)
        }
    })
    return songlist_data
}
function getLyricsData(title) {
    var db = getDatabase()
    var rs = ""
    print('readData()')
    if(!db) { return; }
    db.transaction( function(tx) {
        print('read '+title)
        rs = tx.executeSql('SELECT param_lyrics FROM song_data WHERE param_title=?;', [title]);
    });

    if(rs.rows.length > 0) {
        console.log(title +" exists ")
        return rs.rows.item(0).param_lyrics
    }
    else {
        console.log(title +" does not exist ")
        return false
    }


}
function readAllData() {
    var db = getDatabase()
    var rs = ""
    //print('readData()')
    if(!db) { return; }
    db.transaction( function(tx) {

        rs = tx.executeSql('SELECT * FROM data;');

    });
    var name_data = []
    if(rs.rows.length > 0) {
        for(var name = 0; name < rs.rows.length; name++) {
            name_data.push(rs.rows.item(name).param_title)
            console.log("exists " + rs.rows.item(name).param_title)
        }
        return name_data


    }
    else {
        console.log("empty database")
    }



}


function storeData(title, lyrics) {
    var db = getDatabase()
    if(!db) { return; }
    db.transaction( function(tx) {
        var result = tx.executeSql('SELECT param_title FROM data WHERE param_title=?;', [title]);
        if(result.rows.length === 1) {// use update
            print('... title exists, update it' + title)
            result = tx.executeSql('UPDATE data SET param_title=?;', [title]);

        } else { // use insert
            print('... title does not exists, create it'+ title)
            result = tx.executeSql('INSERT INTO data (param_title, param_lyrics) VALUES (?,?);', [title, lyrics]);
        }
    });
}
