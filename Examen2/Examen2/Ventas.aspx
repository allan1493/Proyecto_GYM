<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Examen2.Ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Bienvenidos!<br />
        </div>
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Cajero"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
        </div>
        <div>
            <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Maquina"></asp:Label>
            <br />
            <br />
        </div>
        <div>
            <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Producto"></asp:Label>
        </div>
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Insertar Venta" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
