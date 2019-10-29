<%@ Page Title="CS3870 - Fall 2019 - Program 4" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterContent.aspx.cs" Inherits="Prog4.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="style.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>CS3870 - Fall 2019 - Program 4</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <style type="text/css">
        .auto-style1 {
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: absolute;
            top: 100px;
            left: 30px;
            width: 16.4em;
            z-index: 1;
            text-align: left;
            height: 114px;
        }
    </style>
    <html>
    <body>
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
        <h3>CS 3870: Program 3</h3>
	    <ul class="auto-style1">
		    <li>
			    <a class="btn" href="Default.aspx">All Products</a>
                <br />
		    </li>
		    <li>
			    <a class="btn" href="Updating.aspx">Update Products</a>
		    </li>
            <li>
			    <a class="btn" href="Shopping.aspx">Shopping</a>
		    </li>
	    </ul>
	    <ul>
		    <li>Master Pages</li>
		    <li>Dynamic Database</li>
		    <li>Page Updating</li>
		    <li>Validation</li>
		    <li>Style and CSS Files</li>
	    </ul>
    </body>
</html>
</asp:Content>
