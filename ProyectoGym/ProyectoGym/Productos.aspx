<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="ProyectoGym.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GYM Saitama: Productos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header> </header>
            <div>
                <asp:Label ID="Codigo" runat="server" Text="Codigo: "></asp:Label>
                <asp:TextBox ID="CodigoText" runat="server"></asp:TextBox>

            </div>
            <div>
                <asp:Label ID="Nombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="NombreText" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Precio" runat="server" Text="Precio: "></asp:Label>
                <asp:TextBox ID="PrecioText" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Agregar_Click" />
                <asp:Button ID="Actualizar" runat="server" Text="Actualizar" OnClick="Actualizar_Click" />
                <asp:Button ID="Consultar" runat="server" Text="Consultar" OnClick="Consultar_Click" />
                <asp:Button ID="Eliminar" runat="server" Text="Eliminar" OnClick="Eliminar_Click" />
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
