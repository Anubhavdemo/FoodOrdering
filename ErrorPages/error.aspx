<%@ Page  Title="" MasterPageFile="~/MasterPages/Customer.Master" Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="FoodOrdering.ErrorPages.error" %>

<asp:content id="Content1" contentplaceholderid="head" runat="server">
    <link href="../css/Bootstrap.css" rel="stylesheet" />
    <link href="../ErrorPages/css/style.css" rel="stylesheet" />
    <script src="js/demo-2.js"></script>
    <script src="js/rAF.js"></script>
    </asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">

        <div class="container-fluid demo-2">
            <div class="content">
                <div id="large-header" class="large-header">
                    <div class="txt-center">
                        <br />
                       
                        <div class="col-md-3 col-md-offset-4">
                            <asp:Button Text="Go Back"
                                ID="btnback"
                            CssClass="btn btn-warning btn-block"
                            runat="server"/>
                        </div>
                    </div>
                    <h1 class="header-w3ls">Page Not Found!..</h1>
                    <p class="w3-agileits1">Oops!</p>
                    <canvas id="demo-canvas"></canvas>
                    <asp:Image ImageUrl="~/ErrorPages/images/owl.gif" alt="flashy" runat="server" CssClass="w3l" />
                    <h2 class="main-title">404</span></h2>
                    <p class="w3-agileits2">We can't seem to find the page you're looking for.</p>
                </div>
            </div>
        </div>
    </asp:content>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ErrorPages/css/style.css" rel="stylesheet" />
    <script src="js/demo-2.js"></script>
    <script src="js/rAF.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container-fluid demo-2">
        <div class="content">
            <div id="large-header" class="large-header">
                <h1 class="header-w3ls">Page Not Found!..</h1>
                <p class="w3-agileits1">Oops!</p>
                <canvas id="demo-canvas"></canvas>
                <asp:Image ImageUrl="~/ErrorPages/images/owl.gif" alt="flashy" runat="server" CssClass="w3l" />
                <h2 class="main-title">404</span></h2>
                <p class="w3-agileits2">We can't seem to find the page you're looking for.</p>
            </div>
        </div>
    </div>
</asp:Content>--%>
