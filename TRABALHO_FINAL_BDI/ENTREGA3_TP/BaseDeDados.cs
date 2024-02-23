using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Etapa3_TP
{
    public class BaseDeDados
    {
        public string strc = "Persist Security Info=True; Data Source=193.137.7.32;User ID = aluno22_63; Password=DI@2022";

        public void insere_utilizador(string primeiroNome, string ultimoNome, string telemovel, string email, DateTime dataRegisto, DateTime ultimoAcesso, bool isAtivo, bool isColaborador, int permissoes, bool isCandidato)
        {
            SqlConnection con = new SqlConnection(strc);
            SqlCommand cmd = new SqlCommand("inserir_utilizador", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@primeiroNome_param", primeiroNome);
            cmd.Parameters.AddWithValue("@ultimoNome_param", ultimoNome);
            cmd.Parameters.AddWithValue("@telemovel_param", telemovel);
            cmd.Parameters.AddWithValue("@email_param", email);
            cmd.Parameters.AddWithValue("@dataRegisto_param", dataRegisto);
            cmd.Parameters.AddWithValue("@ultimoAcesso_param", ultimoAcesso);
            cmd.Parameters.AddWithValue("@isAtivo_param", isAtivo);
            cmd.Parameters.AddWithValue("@isColaborador_param", isColaborador);
            cmd.Parameters.AddWithValue("@permissoes_param", permissoes);
            cmd.Parameters.AddWithValue("@isCandidato_param", isCandidato);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void update_utilizador(int idUtilizador, string primeiroNome, string ultimoNome, string telemovel, string email, DateTime dataRegisto, DateTime ultimoAcesso, bool isAtivo, bool isColaborador, int permissoes, bool isCandidato)
        {
            SqlConnection con = new SqlConnection(strc);
            SqlCommand cmd = new SqlCommand("update_utilizador", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@idUtilizador_param", idUtilizador);
            cmd.Parameters.AddWithValue("@primeiroNome_param", primeiroNome);
            cmd.Parameters.AddWithValue("@ultimoNome_param", ultimoNome);
            cmd.Parameters.AddWithValue("@telemovel_param", telemovel);
            cmd.Parameters.AddWithValue("@email_param", email);
            cmd.Parameters.AddWithValue("@dataRegisto_param", dataRegisto);
            cmd.Parameters.AddWithValue("@ultimoAcesso_param", ultimoAcesso);
            cmd.Parameters.AddWithValue("@isAtivo_param", isAtivo);
            cmd.Parameters.AddWithValue("@isColaborador_param", isColaborador);
            cmd.Parameters.AddWithValue("@permissoes_param", permissoes);
            cmd.Parameters.AddWithValue("@isCandidato_param", isCandidato);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void delete_utilizador(int idUtilizador)
        {
            SqlConnection con = new SqlConnection(strc);
            SqlCommand cmd = new SqlCommand("delete_utilizador", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@idUtilizador_param", idUtilizador);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public SqlDataReader mostrar_utilizador(int idUtilizador)
        {
            SqlConnection con = new SqlConnection(strc);
            SqlCommand cmd = new SqlCommand("mostrar_utilizador", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@idUtilizador_param", idUtilizador);

            con.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

           
            return reader;
        }
        public SqlDataReader Mostrar_todos_utilizadores()
        {
            SqlConnection con = new SqlConnection(strc);
            SqlCommand cmd = new SqlCommand("mostrar_todos_utilizadores", con);
            cmd.CommandType = CommandType.StoredProcedure;


            con.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);


            return reader;
        }
        
    }
}