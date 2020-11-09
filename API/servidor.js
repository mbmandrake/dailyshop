const express = require('express');
const bodyParser = require('body-parser');
const categoria = require('./categoria');
const servidor = express();

servidor.use(bodyParser.json());

servidor.get('/categoria', async (req,res) => {
    let lista = await categoria.getListaCategoria();
    res.json(lista);
});

servidor.get('/categoria/:id', async (req,res) => {
    let lista = await categoria.getListaCategoriaPorId(req.params.id);
    res.json(lista);
});

servidor.post('/categoria', async (req,res) => {
    let dados = req.body;

    let catego = new categoria.Categoria();
    catego.nome = dados.nome;
    catego.ativo = dados.ativo;

    await categoria.addCategoria(catego);
    res.json(catego);
});

servidor.listen(8080,()=>{console.log('Rodando o Servidor');})