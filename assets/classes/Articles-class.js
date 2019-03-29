let db,config;

module.exports = (_db, _config) => {
    db = _db;
    config = _config;
    return Articles
};

let Articles = class {
    static getAll(){
        return new Promise((next)=>{
            db.query('select * from articles')
                .then(result => next(result))
                .catch(err =>next(err))
        })
    }
    static add(nom, prenom, sexe, pseudo, birth, email, pass){
        return new Promise((next) => {
            db.query("insert into users(nom, prenom, sexe, pseudo, birth, email, pass) values (?,?,?,?,?,?,?)", [nom, prenom, sexe, pseudo, birth, email, pass])
        })
            .then(() => {
                return db.query("select * from users where email = ?",[email])
            })
            .then(result => next(result[0]))
            .catch(err => next(err))
    }
    static getByEmail(email){
        return new Promise((next) =>{
            db.query("select * from users where email = ?", [email])
                .then(result => next(result[0]))
                .catch(err => next(err))
        })
    }
    static update(nom, prenom, pseudo, email){
        return new Promise((next) => {
            db.query("update users set nom = ?, prenom = ?, pseudo = ? where email = ?", [nom, prenom, pseudo, email])
                .then(() => next(true))
                .catch(err =>next(err))
        })
    }

    static delete(email){
        return new Promise((next) =>{
            db.query("delete from users where email = ?",[email])
                .then(() => next(true))
                .catch(err =>next(err))
        })
    }
}