let db,config;

module.exports = (_db, _config) => {
    db = _db;
    config = _config;
    return Forum
};

let Forum = class {
    static getTheme(){
        return new Promise((next) =>{
            db.query("select * from themes")
                .then(result => next(result))
                .catch(err => next(err))
        })
    }

    static getSujetAll(themeID){
        return new Promise((next) => {
            db.query("select * from f_sujet where theme = ?", [themeID])
                .then(result => next(result)
                )
        })
    }

};