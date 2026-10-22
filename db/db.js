import mysql from 'mysql2'

export default class Database{
    #conexao

    get conexao() {return this.#conexao} set conexao(conexao) {this.#conexao = conexao}

    constructor(){
        this.#conexao = mysql.createPool({
            host:"127.0.0.1",
            database:"artisthub",
            user:"root",
            idleTimeout:30000,
            connectionLimit:50
        })
    }

    ExecutaComando(sql,valores) {
        var cnn = this.#conexao
        return new Promise(function(res, rej){
             cnn.query(sql, valores, function (error, results, fields) {
                if (error) 
                    rej(error);
                else 
                    res(results);
            });
        })
    }
    ExecutaComandoNonQuery(sql, valores) {
        var cnn = this.#conexao;
        return new Promise(function(res, rej) {
            cnn.query(sql, valores, function (error, results, fields) {
                if (error) 
                    rej(error);
                else 
                    res(results.affectedRows > 0);
            });
        })
    }

    ExecutaComandoLastInserted(sql, valores) {
        var cnn = this.#conexao;
        return new Promise(function(res, rej) {
            cnn.query(sql, valores, function (error, results, fields) {
                if (error) 
                    rej(error);
                else 
                    res(results.insertId);
            });
        })
    }

    AbreTransacao(){
        var cnn = this.#conexao;
        return new Promise(function(res, rej) {
            cnn.query("START TRANSACTION",sql, valores, function (error, results, fields) {
                if (error) 
                    rej(error);
                else 
                    res(results);
            });
        })
    }

    Rollback(){
        var cnn = this.#conexao;
        return new Promise(function(res, rej) {
            cnn.query("ROLLBACK",sql, valores, function (error, results, fields) {
                if (error) 
                    rej(error);
                else 
                    res(results);
            });
        })
    }

    Commit(){
        var cnn = this.#conexao;
        return new Promise(function(res, rej) {
            cnn.query("COMMIT",sql, valores, function (error, results, fields) {
                if (error) 
                    rej(error);
                else 
                    res(results);
            });
        })
    } 
}