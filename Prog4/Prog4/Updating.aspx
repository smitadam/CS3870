﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updating.aspx.cs" Inherits="Prog4.Shopping2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <title>CS3870 - Fall 2019 - Program 4 - Updating</title>
    <style type="text/css">
        table{
            border: none;
        }
        td{
            border: none;
        }
    </style>
</head>
<body>
<form id="UpdatingForm" runat="server">
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
        
        <h3>Prog 4</h3>
        <div style="height:50px; width:125px;" position: relative; width: 50%; margin-left: 25%">
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UWPCS3870ConnectionString %>" SelectCommand="SELECT * FROM [Product]" DeleteCommand="DELETE FROM [Product] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Product]([ProductID], [ProductName], [UnitPrice], [Description] ) VALUES (@ProductID, @ProductName, @UnitPrice, @Description)" UpdateCommand="UPDATE [Product] SET ProductName = @ProductName, UnitPrice = @UnitPrice, Description = @Description WHERE ProductID = @ProductID">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" />
                    <asp:Parameter Name="ProductName" />
                    <asp:Parameter Name="UnitPrice" />
                    <asp:Parameter Name="Description" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" />
                    <asp:Parameter Name="UnitPrice" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="ProductID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:TreeView class="TreeView" ID="TreeView1" runat="server" Height="16px" Width="185px">
            <DataBindings>
                <asp:TreeNodeBinding DataMember="Default" NavigateUrl="Default.aspx" Target="Default.aspx" Text="All Products" />
                <asp:TreeNodeBinding DataMember="Shopping" NavigateUrl="Shopping.aspx" Target="Shopping.aspx" Text="Shopping" Value="Shopping" />
                <asp:TreeNodeBinding DataMember="Updating" NavigateUrl="Updating.aspx" Text="Updating" Value="Updating" />
            </DataBindings>
            <Nodes>
                <asp:TreeNode Text="All Products" Value="New Node" NavigateUrl="Default.aspx"></asp:TreeNode>
                <asp:TreeNode Text="Updating" Value="New Node" NavigateUrl="Updating.aspx"></asp:TreeNode>
                <asp:TreeNode Text="Shopping" Value="New Node" NavigateUrl="Shopping.aspx"></asp:TreeNode>
            </Nodes>
        </asp:TreeView>
        

            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ProductID" DataSourceID="SqlDataSource" height="45px" width="496px" position="relative"  margin-left="25%" Align="center" OnItemDeleting="DetailsView1_ItemDeleting" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" DataFormatString="{0:C}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>
            <br />
        <br />
        <br />
        <asp:TextBox ID="txtMessage" runat="server" Height="197px" Width="441px" style="text-align: left" TextMode="MultiLine"></asp:TextBox>
        

    </form>
</body>
</html>