import express from 'express';
import cors from 'cors';
import { DatabaseSync } from 'node:sqlite';
const database = new DatabaseSync('./apidatabase.db');

const app = express()
const port = 8080

// Middlewares
app.use(cors({
    origin: 'http://localhost:5173',
}))
app.use(express.json())

// Il manque la route /jeux ...

app.get('/jeux/:id', (req, res) => {
    // hop hop on récupère le jeu avec son ID
    const jeuQuery = database.prepare('SELECT * FROM jeux WHERE JeuID = ?');
    const jeu = jeuQuery.get(req.params.id);
    if (jeu) {
        res.json(jeu);
    } else {
        res.status(404).json({ error: 'Jeu non trouvé' });
    }
});

app.get('/utilisateurs', (req, res) => {
    // et un, et deux et cent utilisateurs!
    const utilisateursQuery = database.prepare('SELECT * FROM utilisateurs');
    res.json(utilisateursQuery.all());
});

// Il me faudrait récupérer un utilisateur par son ID

// Je sens qu'il va y avoir trop de taff, je pense que je vais changer de boite !!!!


app.listen(port, () => {
    console.log(`L'API Steam écoute sur le port ${port}`)
});