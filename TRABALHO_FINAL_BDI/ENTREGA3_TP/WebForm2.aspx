<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cliente-Servidor</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Cliente-Servidor</h1>
            <hr />
            <h3>Pesquisar:</h3>
            <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Pesquisar" OnClick="ButtonSearch_Click" />
            <hr />
            <h3>Inserir Dados:</h3>
            <label>Nome:</label>
            <asp:TextBox ID="TextBoxNome" runat="server"></asp:TextBox>
            <br />
            <label>Descrição:</label>
            <asp:TextBox ID="TextBoxDescricao" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonInsert" runat="server" Text="Inserir" OnClick="ButtonInsert_Click" />
            <hr />
            <h3>Dados Remotos:</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="Id"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting"
                >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxNomeEdit" runat="server" Text='<%# Eval("Nome") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxDescricaoEdit" runat="server" Text='<%# Eval("Descricao") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
