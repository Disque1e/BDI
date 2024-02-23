<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Etapa3_TP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 133px;
        }

        .auto-style2 {
            width: 199px;
        }

        .auto-style3 {
            width: 298px;
        }

        .auto-style4 {
            width: 133px;
            height: 6px;
        }

        .auto-style5 {
            width: 199px;
            height: 6px;
        }

        .auto-style6 {
            width: 298px;
            height: 6px;
        }

        .auto-style7 {
            height: 6px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">ID Utilizador</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtIDUtilizador" runat="server" Width="179px"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="BtnPesquisarUtilizador" runat="server" Text="Pesquisar Utilizador" OnClick="BtnPesquisarUtilizador_Click" />
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="BtnLimparIDUtilizador" runat="server" Text="Limpar ID do Utilizador" OnClick="BtnLimparIDUtilizador_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Utilizadores</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

            </table>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDUtilizador" DataSourceID="SqlDataSource1"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="IDUtilizador" HeaderText="IDUtilizador" InsertVisible="False" ReadOnly="True" SortExpression="IDUtilizador" />
                <asp:TemplateField HeaderText="PrimeiroNome" SortExpression="PrimeiroNome">
                    <ItemTemplate>
                        <asp:Label ID="lblPrimeiroNome" runat="server" Text='<%# Bind("PrimeiroNome") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPrimeiroNomeEdit" runat="server" Text='<%# Bind("PrimeiroNome") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UltimoNome" SortExpression="UltimoNome">
                    <ItemTemplate>
                        <asp:Label ID="lblUltimoNome" runat="server" Text='<%# Bind("UltimoNome") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxUltimoNomeEdit" runat="server" Text='<%# Bind("UltimoNome") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telemovel" SortExpression="Telemovel">
                    <ItemTemplate>
                        <asp:Label ID="lblTelemovel" runat="server" Text='<%# Bind("Telemovel") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxTelemovelEdit" runat="server" Text='<%# Bind("Telemovel") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxEmailEdit" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DataRegisto" HeaderText="DataRegisto" ReadOnly="True" SortExpression="DataRegisto" />
                <asp:BoundField DataField="UltimoAcesso" HeaderText="UltimoAcesso" ReadOnly="True" SortExpression="UltimoAcesso" />
                <asp:TemplateField HeaderText="IsAtivo">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxIsAtivo" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsAtivo")) %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBoxIsAtivoEdit" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsAtivo")) %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsColaborador">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxIsColaborador" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsColaborador")) %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBoxIsColaboradorEdit" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsColaborador")) %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Permissoes" SortExpression="Permissoes">
                    <ItemTemplate>
                        <asp:Label ID="lblPermissoes" runat="server" Text='<%# Bind("Permissoes") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPermissoesEdit" runat="server" Text='<%# Bind("Permissoes") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsCandidato">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxIsCandidato" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsCandidato")) %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBoxIsCandidatoEdit" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsCandidato")) %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
        <p></p>
        <tr>
    <td colspan="8">
        <table style="width: 100%;">
            <tr>
                <td style="width: 10%;">
                    PrimeiroNome:<br />
                    <asp:TextBox ID="textBoxPrimeiroNome" runat="server" style="width: 100%;" />
                </td>
                <td style="width: 10%;">
                    UltimoNome:<br />
                    <asp:TextBox ID="textBoxUltimoNome" runat="server" style="width: 100%;" />
                </td>
                <td style="width: 10%;">
                    Telemóvel:<br />
                    <asp:TextBox ID="textBoxTelemovel" runat="server" style="width: 100%;" />
                </td>
                <td style="width: 10%;">
                    Email<br />
                    <asp:TextBox ID="textBoxEmail" runat="server" style="width: 100%;" />
                </td>
                <td style="width: 10%;">
                    IsAtivo<br />
                    <asp:CheckBox ID="checkBoxIsAtivo" runat="server" />
                </td>
                <td style="width: 10%;">
                    IsColaborador<br />
                    <asp:CheckBox ID="checkBoxIsColaborador" runat="server" />
                </td>
                <td style="width: 10%;">
                    Permissoes<br />
                    <asp:TextBox ID="textBoxPermissoes" runat="server" style="width: 100%;" />
                </td>
                <td style="width: 10%;">
                    IsCandidato<br />
                    <asp:CheckBox ID="checkBoxIsCandidato" runat="server" />
                </td>
                <td style="width: 10%;">
                    <asp:Button ID="BtnNovoUtilizador" runat="server" Text="Novo Utilizador" OnClick="BtnNovoUtilizador_Click" />
                </td>
            </tr>
        </table>
    </td>
</tr>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Utilizadores]" DeleteCommand="delete_utilizador"></asp:SqlDataSource>
    </form>
</body>
</html>
