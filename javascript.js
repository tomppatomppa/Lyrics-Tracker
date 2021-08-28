



function getDatabase() {
   return LocalStorage.openDatabaseSync("local", "1.0", "Lyric Data", 1000000);
}

function initDatabase() {
    print('initDatabase()')
    db = LocalStorage.openDatabaseSync("local", "1.0", "Lyric Data", 100000);
    db.transaction( function(tx) {
        print('... create table')
        tx.executeSql('CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)');
    });
}

function readData(title) {
    var db = getDatabase()
    var rs = ""
    print('readData()')
    if(!db) { return; }
    db.transaction( function(tx) {
        print('... read crazy object')
        rs = tx.executeSql('SELECT value FROM data WHERE name=?;', [title]);

    });

    if(rs.rows.length > 0) {
        console.log("exists " + rs.rows.item(0).value)
        return rs.rows.item(0).value
    }
    else {
        return false
    }


}
function storeData(title, lyrics) {
    var db = getDatabase()
    if(!db) { return; }
    db.transaction( function(tx) {
        var result = tx.executeSql('SELECT * from data where name = "local"');
        // prepare object to be stored as JSON
        //var obj = { x: title.x, y: title.y };
        if(result.rows.length === 1) {// use update
            print('... title exists, update it')
            result = tx.executeSql('UPDATE data set name=? where value=?;'[title], [lyrics]);
        } else { // use insert
            print('... title does not exists, create it')
            result = tx.executeSql('INSERT INTO data VALUES (?,?)', [title, lyrics]);
        }
    });
}
