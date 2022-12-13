<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="ProyectoGym.Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GYM Saitama</title>
    <link rel="stylesheet" href="CSS/llenado.css">
</head>
<body>
    <header></header>
    <form id="form1" runat="server" class="form">
        <div>Clientes
        </div>
        <div style="overflow:auto">
        <div class="textbox">
            <asp:Label ID="Label1" runat="server" Text="Correo: "></asp:Label>
            <asp:TextBox ID="correo" runat="server"></asp:TextBox>
        </div>
        <div class="textbox">
            <asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="nombre" runat="server" ></asp:TextBox>
        </div>
        <div class="textbox">
            <asp:Label ID="Label3" runat="server" Text="Apellidos: " ></asp:Label>
            <asp:TextBox ID="apellidos" runat="server" ></asp:TextBox>
        </div>
        <div class="textbox">
            <asp:Label ID="Label8" runat="server" Text="Telefono: "></asp:Label>
            <asp:TextBox ID="telefono" runat="server" MaxLength="8" ></asp:TextBox>
        </div>
            <br />
            <br />
        <div class="dropdown">
            <asp:Label ID="Label4" runat="server" Text="Provincia" ></asp:Label>
            
            <asp:DropDownList CssClass="dropdown-content" ID="provincias" runat="server" DataTextField="nombre" DataValueField="codigo" AutoPostBack="True" OnSelectedIndexChanged="provincias_SelectedIndexChanged" Height="16px" Width="169px"></asp:DropDownList>
            
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="dropdown">
            <asp:Label ID="Label5" runat="server" Text="Canton" CssClass="Label"></asp:Label>
            <asp:DropDownList CssClass="dropdown-content" ID="cantones" runat="server" DataTextField="nombre" DataValueField="codigo" AutoPostBack="true" Height="16px" Width="184px" OnSelectedIndexChanged="cantones_SelectedIndexChanged" ></asp:DropDownList>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="dropdown">
            <asp:Label ID="Label6" runat="server" Text="Distrito" CssClass="Label"></asp:Label>
            <asp:DropDownList CssClass="dropdown-content" ID="distrito" runat="server" DataTextField="Nombre" DataValueField="codigo" Height="16px" Width="176px" ></asp:DropDownList>
        </div>
            <br />
            <br />
        <div class="textbox">
            <asp:Label ID="Label7" runat="server" Text="Señas" CssClass="Label"></asp:Label>
            <asp:TextBox ID="comentarios" runat="server" CssClass="textArea"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label9" runat="server" Text=""></asp:Label></div>
        <div>
            <asp:Button ID="Agregar" CssClass ="boton" runat="server" Text="Agregar" OnClick="Agregar_Click" />
            <br />
            <br />
        </div>

        <div >
            <asp:Button ID="Button1" CssClass ="boton" runat="server" Text="Consultar" OnClick="Button1_Click" />
            <br />
            <br />
            </div>
            <div><asp:Button ID="Button2" CssClass ="boton" runat="server" Text="Actualizar" OnClick="Button2_Click" /> 
                <br />
                <br />
        </div>
           <div> <asp:Button ID="Button3" CssClass ="boton" runat="server" Text="Eliminar" OnClick="Button3_Click" />
            </div>
        <div class="mGrid">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"></asp:GridView>
            
        </div>
            </div>
    </form>
</body>
</html>
