<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="ProyectoGym.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GYM Saitama: Productos</title>
    <link rel="stylesheet" href="CSS/llenado.css">
</head>
<body>
    <form id="form1" runat="server" class="form">
        <div>
            <header class="subnav"> 
                <asp:Button ID="Button1" CssClass="subnavbtn" runat="server" Text="Clientes" OnClick="Button1_Click" />
                <asp:Button ID="Button2" CssClass="subnavbtn" runat="server" Text="Facturar" OnClick="Button2_Click" />
                <asp:Button ID="Button4" CssClass="subnavbtn" runat="server" Text="Reportes" OnClick="Button4_Click" />
                <asp:Button ID="Button3" CssClass="subnavbtn" runat="server" Text="Home" OnClick="Button3_Click" />
                
            </header>
            <br />
            <br />
            <div class="textbox">
                <asp:Label ID="Codigo" runat="server" Text="Codigo: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="CodigoText" runat="server"></asp:TextBox>

                <asp:Label ID="Nombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="NombreText" runat="server"></asp:TextBox>
                <asp:Label ID="Precio" runat="server" Text="Precio: "></asp:Label>
                <asp:TextBox ID="PrecioText" runat="server"></asp:TextBox>

            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="" CssClass="label"></asp:Label>
            </div>
            <div>
                <asp:Button ID="Agregar" runat="server" CssClass="boton" Text="Agregar" OnClick="Agregar_Click"/>
                <br />
                <br />
                <br />
                </div>
                <div><asp:Button ID="Actualizar" runat="server" CssClass="boton" Text="Actualizar" OnClick="Actualizar_Click" />
                    <br />
                    <br />
                    <br />
            </div>
                <div><asp:Button ID="Consultar" runat="server" CssClass="boton" Text="Consultar" OnClick="Consultar_Click" />
                    <br />
                    <br />
            </div>
                <div></div><asp:Button ID="Eliminar" runat="server" CssClass="boton" Text="Eliminar" OnClick="Eliminar_Click" />
            </div>
            <div class="mGrid">

                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
