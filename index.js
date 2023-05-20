require('dotenv').config()
const {
  PG_HOST,
  PG_USER,
  PG_PASSWORD,
  PG_DATABASE,
  PG_PORT,
  PORT
} = process.env
const { Client } = require('pg')
const express = require ('express')
const app = express()
app.use(express.json())


app.get('/medicos', (req, res) => {
  const client = new Client({
    host: PG_HOST,
    user: PG_USER,
    password: PG_PASSWORD,
    database: PG_DATABASE,
    port: PG_PORT,
    
  })
  client.connect()
  client.query('SELECT * FROM tb_medico')
  .then(bdResult => {
    console.log(bdResult)
    res.status(200).end()
  })
  .catch(e => {
    console.log(e)
    res.status(500).end()
  })
})


app.listen(
  PORT,
  () => console.log(`Servidor Ok. Porta: ${PORT}`)
)


