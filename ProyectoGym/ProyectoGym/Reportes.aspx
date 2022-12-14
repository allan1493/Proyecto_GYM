<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ProyectoGym.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="CSS/llenado.css">
</head>
<body>
    <form id="form1" class="form" runat="server">
        <div>
            <header></header>
            <div>
                <asp:Button ID="Button1" CssClass="boton" runat="server" Text="Ver facturas" OnClick="Button1_Click" />
                <br />
                <br />
            </div>
                <div>
                    <br />
                    <asp:Button ID="Button2" CssClass="boton" runat="server" Text="Ver Usuarios" OnClick="Button2_Click" />
                    <br />
                    <br />
                    <br />
            </div>
                <div><asp:Button ID="Button3" CssClass="boton" runat="server" Text="Ver Productos" OnClick="Button3_Click" />
            </div>
            <div class="dropdown">
                <asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label>
                <asp:DropDownList ID="DDLUsuario" CssClass="dropdown-content" runat="server" Enabled="false" DataTextField="codigo" DataValueField="codigo" AutoPostBack="True" OnSelectedIndexChanged="DDLUsuario_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="Label1" CssClass="label" runat="server" Text=""></asp:Label>
                <asp:GridView ID="GridView1" CssClass="mGrid" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
    <asp:Label ID="Label3" runat="server" Text="Nota: Para activar DropDownList de Usuario hay que ejecutar el boton ver usuarios" BackColor="White" BorderColor="Black"></asp:Label>
</body>
</html>
