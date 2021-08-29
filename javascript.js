



function getDatabase() {
   return LocalStorage.openDatabaseSync("local", "1.0", "Lyric Data", 1000000);
}

function initDatabase() {
    print('initDatabase()')
    db = LocalStorage.openDatabaseSync("local", "1.0", "Lyric Data", 100000);
    db.transaction( function(tx) {
        print('... create table')
        tx.executeSql('CREATE TABLE IF NOT EXISTS data(param_title TEXT, param_lyrics TEXT)');
    });
}

function readData(title) {
    var db = getDatabase()
    var rs = ""
    print('readData()')
    if(!db) { return; }
    db.transaction( function(tx) {
        print('read '+title)
        rs = tx.executeSql('SELECT param_title FROM data WHERE param_title=?;', [title]);

    });

    if(rs.rows.length > 0) {
        console.log(title +" exists ")
        return rs.rows.item(0).param_title
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
