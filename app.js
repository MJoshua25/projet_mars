require('babel-register');
var bodyParser = require('body-parser');
const express = require('express');
const morgan = require('morgan');
const {success , error, checkAndChange} = require('./assets/functions');
const config = require('./assets/config');
const mysql = require('promise-mysql');

mysql.createConnection(config.db)
    .then((db) =>{
        var app = express();
        var UserRouter = express.Router();
        let Users = require('./assets/classes/Users-class')(db, config);
        let Forum = require('./assets/classes/Forum-class')(db, config);
        let Articles = require('./assets/classes/Articles-class')(db, config);

        app.use(bodyParser.json());
        app.use(bodyParser.urlencoded({ extended: true }));

        app.use(morgan('dev'));

        UserRouter.route('/')

            //afficher tous les utilisateurs
            .get(async (req , res) => {
                    let allUser = await Users.getAll()
                    res.json(checkAndChange(allUser))
            })

            //ajouter un utilisateur
            .post(async (req , res) => {
                    let addUser = await Users.add(req.body.nom, req.body.prenom, req.body.sexe, req.body.pseudo, new Date(req.body.naiss), req.body.email , req.body.pass)
                    res.json(checkAndChange(addUser))
            });

        UserRouter.route('/:email')
        //Afficher un membre
            .get(async (req , res) =>{
                    let user = await Users.getByEmail(req.params.email)
                    res.json(checkAndChange(user))
            })

            //Modifier un membre
            .put(async (req , res) => {
                    let updateUser = await Users.update(req.params.email)
                    res.json(checkAndChange(updateUser))
            })
            .delete(async (req , res) => {
                    let deleteUser = await Users.delete(req.params.email)
                    res.json(checkAndChange(deleteUser))
            });
        app.use(config.rootAPI + 'users' , UserRouter);

        app.listen(config.port, () => {
            console.log("Started on port "+ config.port);
        });
    })
    .catch(err => console.log(err.message));