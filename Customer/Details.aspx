<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="FoodOrdering.Customer.BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        * {
            box-sizing: border-box
        }

        /* Style the tab */
        .tab {
            float: left;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
            width: 30%;
            height: 300px;
        }

            /* Style the buttons that are used to open the tab content */
            .tab h4 {
                display: block;
                background-color: inherit;
                color: black;
                padding: 22px 16px;
                width: 100%;
                border: none;
                outline: none;
                text-align: left;
                cursor: pointer;
                transition: 0.3s;
            }

                /* Change background color of buttons on hover */
                .tab h4:hover {
                    background-color: #ddd;
                }

                /* Create an active/current "tab button" class */
                .tab h4.active {
                    background-color: crimson;
                    color:white;
                }

        /* Style the tab content */
        .tabcontent {
            float: left;
            padding: 0px 12px;
            border: 1px solid #ccc;
            width: 70%;
            border-left: none;
            height: 300px;
            background-color :  white;
        }

         #vegSpecification img {
            margin-top: 3px;
            margin-bottom: 5px;
            height: 200px;
            width: 160px;
            /*box-shadow: 10px 0px #888888;*/
        }
    </style>

    <script>

        $().ready(function () {
            document.getElementById("defaultOpen").click();
        });

        function openCity(evt, cityName) {

            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="tab">
        <h4 class="tablinks active" onclick="openCity(event, 'vegSpecification')" id="defaultOpen"> Specification</h4>
        <h4 class="tablinks" onclick="openCity(event, 'Description')">Description</h4>
    </div>

    <div id="vegSpecification" class="tabcontent">
        <div class="row">
            <div class="col-md-3">
                <br />
                <asp:Image runat="server" ID="bimage"
                    style="width: 100%; height: 260px;" />
            </div>
            <div class="col-md-8 col-md-offset-1">
                <br />
                <br />
                <div class="row">
                    <h3>
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>
                    </h3>
                </div>
                <div class="row">
                    <h3>&#8377; 
                        <asp:Label ID="lblprice" runat="server"></asp:Label>

                    </h3>
                </div>
                <div class="row">
                    <h3>
                     <asp:Label ID="lblauthor" runat="server"></asp:Label>

                    </h3>
                </div>
                <br />
                <div class="row">
                   <asp:HyperLink runat="server" Text="Add To Cart"
                       ID="carturl"
                       CssClass="btn btn-warning"
                      >
                   </asp:HyperLink>
                </div>
            </div>
        </div>
    </div>

    <div id="Description" class="tabcontent">
        <h3>Description</h3>
        <p><asp:Label ID="lbldesc"
            Font-Size="Larger"
            runat="server"></asp:Label></p>
    </div>


</asp:Content>
