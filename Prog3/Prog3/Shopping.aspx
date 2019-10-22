<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Prog3.Shopping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <title>CS3870 - Fall 2019 - Program 3</title>
    <style type="text/css">

h1 {
    font-family: "Times New Roman",Georgia,serif;
    text-align: center;
    text-decoration: underline;
    color: blue;
}

h2 {
    font-family: Impact, Charcoal, sans-serif;
    text-align: center;
    font-style: italic;
    color: black;
}

        .auto-style10 {
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: absolute;
            top: 100px;
            left: 30px;
            width: 12em;
            z-index: 1;
            text-align: left;
        }
    
ul {
    list-style-position: inside;
}

li {
    font-weight: 800;
    text-align: left;
    margin-left: 40%;
    font-family: Helvetica;
    font-size: 14pt;
    padding-bottom: 10px;
}

li {
    padding-top: 5px;
}

.btn {
    border: 3px;
    border-style: outset;
    padding: 5px;
    color: black;
    border-color: grey;
    background-color: ButtonFace;
    font-family: Helvetica;
    font-weight: 800;
    text-decoration: none;
    font-size: 14px;
}

    a {
    text-decoration: none;
    color: blue;
}

    table {
    align-items: center;
}

        .auto-style7 {
            height: 26px;
            width: 338px;
        }
        
td {
    color: black;
    border: 3px;
    border-style: outset;
}

        .auto-style3 {
            height: 26px;
        }
        .auto-style8 {
            width: 338px;
        }
        .auto-style9 {
            height: 1px;
            width: 338px;
        }
        .auto-style2 {
            height: 1px;
        }
        </style>
</head>
<body>
    <form id="ShoppingForm" runat="server">
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
        <ul class="auto-style10">
            <li><a class="btn" href="MasterContent.aspx">Start Page</a> </li>
            <li><a class="btn" href="Default.aspx">All Products</a> </li>
        </ul>
        <table align="center" style:="" width="60%">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Text="Name"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblID" runat="server" Font-Bold="True" Text="ID"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblSubTotal" runat="server" Font-Bold="True" Text="Sub Total"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtSubTotal" runat="server" ReadOnly="True" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="IDRequiredFieldValidator" runat="server" ControlToValidate="txtID" ErrorMessage="ID cannot be empty!" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" Text="Price"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTax" runat="server" Font-Bold="True" Text="Tax"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtTax" runat="server" ReadOnly="True" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:CompareValidator ID="PriceCompareValidator" runat="server" ControlToValidate="txtPrice" ErrorMessage="Unit price must be a positive number!" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" ForeColor="Red" Operator="GreaterThan" Type="Double" ValueToCompare="0"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price cannot be empty!" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblQuantity" runat="server" Font-Bold="True" Text="Quantity"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblGrandTotal" runat="server" Font-Bold="True" Text="Grand Total"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtGrandTotal" runat="server" ReadOnly="True" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="QuantityRequiredFieldValidator" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity cannot be empty!" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="QuantityCompareValidator" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity must be a non-negative integer!" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" ForeColor="Red" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Button ID="btnCompute" runat="server" CssClass="btn" Height="32px" OnClick="btnCompute_Click" style="font-weight: 700" Text="Compute" Width="121px" />
                </td>
                <td>
                    <asp:Button ID="btnReset" runat="server" CssClass="btn" Height="32px" OnClick="btnReset_Click" style="font-weight: 700" Text="Reset" Width="119px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
