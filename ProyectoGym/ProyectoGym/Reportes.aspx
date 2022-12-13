<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ProyectoGym.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header></header>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Ver facturas" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Ver Usuarios" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Ver Productos" OnClick="Button3_Click" />
            </div>
            <div>
                <asp:DropDownList ID="DDLUsuario" runat="server" Enabled="false" DataTextField="codigo" DataValueField="codigo" AutoPostBack="True" OnSelectedIndexChanged="DDLUsuario_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
