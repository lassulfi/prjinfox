/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.infox.dal;

import java.sql.*;

/**
 * Classe com o módulo de conexão ao banco de dados MySQL
 * @author LuisDaniel
 */
public class ModuloConexao {
    
    //Atributos
    
    //Métodos
    
    /**
     * Método responsável pela conexão com o DB
     * @return 
     */
    public static Connection conector(){
    
        //Variável para armazenar a conexão do App com o BD
        java.sql.Connection conexao = null;
        
        //Carrega o driver para conexão com o BD
        String driver = "com.mysql.jdbc.Driver";
        
        //Variável para armazenar informacoes referentes ao BD
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        
        //Variáveis que armazenam o username e senha para acesso ao BD
        String user = "root";
        String password = "";
        
        //Estalece a conexão com BD
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url,user,password);
            return conexao;
        } catch (Exception e) {
            //A linha abaixo serve de apoio para esclarecer o erro.
            //System.out.println(e);
            return null;
        }     
    }
    
}
