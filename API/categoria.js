const sql = require('mssql');
const banco = require('./banco');

function Categoria(){
    this.nome = '',
    this.ativo = true
}

async function getListaCategoria(){
    let pool = await sql.connect(banco.config);

    let result = await pool.request().query('select * from CATEGORIA');

    return(result.recordset);
};

async function getListaCategoriaPorId(id){
    let pool = await sql.connect(banco.config);

    let result = await pool.request().query('select * from CATEGORIA where ID_CATEGORIA = ' + id);

    return(result.recordset[0]);
};

async function addCategoria(categoria){
    let pool = await sql.connect(banco.config);

    let result = await pool.request()
    .input('nome', sql.VarChar, categoria.nome)
    .input('ativo', sql.Bit, categoria.ativo)
    .query('insert into CATEGORIA values(@nome, @ativo, GETDATE());');

    return(result.recordset);
};

module.exports.Categoria = Categoria;
module.exports.getListaCategoria = getListaCategoria;
module.exports.getListaCategoriaPorId = getListaCategoriaPorId;
module.exports.addCategoria = addCategoria;