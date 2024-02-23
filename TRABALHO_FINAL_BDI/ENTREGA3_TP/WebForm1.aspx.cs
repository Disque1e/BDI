using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Etapa3_TP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnPesquisarUtilizador_Click(object sender, EventArgs e)
        {
            //Mostrar apenas um utilizador
            SqlDataSource1.SelectCommand = "SELECT * FROM Utilizadores WHERE IDUtilizador=" + txtIDUtilizador.Text;
            SqlDataSource1.DataBind();
        }

        protected void BtnLimparIDUtilizador_Click(object sender, EventArgs e)
        {
            //Inserir todos os utilizadores na GridView
            SqlDataSource1.SelectCommand = "SELECT * FROM Utilizadores";
            SqlDataSource1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView(string.Empty);
        }

        protected void BtnNovoUtilizador_Click(object sender, EventArgs e)
        {
            string primeiroNome = textBoxPrimeiroNome.Text;
            string ultimoNome = textBoxUltimoNome.Text;
            string telemovel = textBoxTelemovel.Text;
            string email = textBoxEmail.Text;
            bool isAtivo = checkBoxIsAtivo.Checked;
            bool isColaborador = checkBoxIsColaborador.Checked;
            int permissoes = Convert.ToInt32(textBoxPermissoes.Text);
            bool isCandidato = checkBoxIsCandidato.Checked;

            BaseDeDados bd = new BaseDeDados();
            bd.insere_utilizador(primeiroNome, ultimoNome, telemovel, email, DateTime.Now, DateTime.Now, isAtivo, isColaborador, permissoes, isCandidato);

            textBoxPrimeiroNome.Text = string.Empty;
            textBoxUltimoNome.Text = string.Empty;
            textBoxTelemovel.Text = string.Empty;
            textBoxEmail.Text = string.Empty;
            checkBoxIsAtivo.Checked = false;
            checkBoxIsColaborador.Checked = false;
            textBoxPermissoes.Text = string.Empty;
            checkBoxIsCandidato.Checked = false;

            SqlDataSource1.SelectCommand = "SELECT * FROM Utilizadores";
            SqlDataSource1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string primeiroNome = ((TextBox)row.FindControl("TextBoxPrimeiroNomeEdit")).Text;
            string ultimoNome = ((TextBox)row.FindControl("TextBoxUltimoNomeEdit")).Text;
            string telemovel = ((TextBox)row.FindControl("TextBoxTelemovelEdit")).Text;
            string email = ((TextBox)row.FindControl("TextBoxEmailEdit")).Text;
            bool isAtivo = ((CheckBox)row.FindControl("CheckBoxIsAtivoEdit")).Checked;
            bool isColaborador = ((CheckBox)row.FindControl("CheckBoxIsColaboradorEdit")).Checked;
            int permissoes = Convert.ToInt32(((TextBox)row.FindControl("TextBoxPermissoesEdit")).Text);
            bool isCandidato = ((CheckBox)row.FindControl("CheckBoxIsCandidatoEdit")).Checked;

            BaseDeDados bd = new BaseDeDados();
            bd.update_utilizador(id, primeiroNome, ultimoNome, telemovel, email, DateTime.Now, DateTime.Now, isAtivo, isColaborador, permissoes, isCandidato);

            SqlDataSource1.SelectCommand = "SELECT * FROM Utilizadores";
            SqlDataSource1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Utilizadores";
            SqlDataSource1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            BaseDeDados bd = new BaseDeDados();
            bd.delete_utilizador(id);

            SqlDataSource1.SelectCommand = "SELECT * FROM Utilizadores";
            SqlDataSource1.DataBind();
            
        }


        private void BindGridView(string filter)
        {


            GridView1.DataBind();
        }
    }
}