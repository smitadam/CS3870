<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderingProduct.aspx.cs" Inherits="Prog2.OrderingProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CS3870 - Fall 2019 - Program 2</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <style type="text/css">
        .auto-style2 {
            height: 1px;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
            width: 338px;
        }
        .auto-style8 {
            width: 338px;
        }
        .auto-style9 {
            height: 1px;
            width: 338px;
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
    </style>
</head>
<body>
    <form id="OrderingProductForm" runat="server">
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
		<ul class="auto-style10">
			<li>
				<a class="btn" href="Default.aspx">Start Page</a>
			</li>
			<li>
				<a class="btn" href="OrderingProduct.aspx">Order Form</a>
			</li>
		</ul>
        <table style: align= "center" width ="60%">
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
                <td>
                    &nbsp;</td>
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
                <td>
                    &nbsp;</td>
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
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Button ID="btnCompute" runat="server" style="font-weight: 700" Text="Compute" CssClass="btn" Width="121px" Height="32px" OnClick="btnCompute_Click" />
                </td>
                <td>
                    <asp:Button ID="btnReset" runat="server" style="font-weight: 700" Text="Reset" CssClass="btn" Width="119px" Height="32px" OnClick="btnReset_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
