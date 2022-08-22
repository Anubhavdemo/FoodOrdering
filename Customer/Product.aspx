<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FoodOrdering.Customer.Food" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <script>
        $(document).ready(function () {
            $('.slidermy').slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                autoplay: true,
                arrows: false,
                autoplaySpeed: 2000,
            });
        });
    </script>
    <style>
        h1, h2, div, p, span {
            user-select: none;
        }

        .slidermy img {
            height: 300px;
            width: 150px;
            user-select: none;
        }

        div:focus {
            border: none;
            outline: none;
        }

        #errormsg {
            height: 300px;
            border-radius: 20px;
            background-color: white;
            color: red;
            text-align: center;
        }

            #errormsg h2 {
                margin-top: 120px;
            }

        .textstyle {
            color: crimson;
            font-size: 25px;
            font-family: 'Freestyle Script';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">
        <div class="col-md-12">
            <div>
                <div class="col-md-3 col-md-offset-1">
                    <asp:DropDownList runat="server" DataTextField="cname"
                        AutoPostBack="true"
                        DataValueField="cid"
                        ID="ddlcat" CssClass="form-control" OnSelectedIndexChanged="ddlcat_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="col-md-5 btn-block">
                    <ul class="pagination">
                        <asp:Repeater runat="server" ID="rptpage">
                            <ItemTemplate>
                                <li>
                                    <a href="Product.aspx?pno=<%# string.Format("{0}",Eval("Text"))%>">
                                        <%# string.Format("{0}",Eval("Text")) %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
            <asp:Repeater runat="server" ID="rptproduct">
                <ItemTemplate>
                    
                    <div class="record">
                        <div class="vegimg">
                            <img src="<%# string.Format("{0}",Eval("image")) %>">
                        </div>
                        <div class="prodname text-center"
                            style="height: 73px; overflow: hidden;">
                            <p>
                                <asp:Label runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                            </p>

                            <p>
                                <span>
                                    <asp:Label runat="server" Text='<%# Eval("type") %>'></asp:Label>

                                </span>
                                &nbsp; &nbsp;
                                &#8377 
                                <span>
                                    <asp:Label runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                </span>
                            </p>
                        </div>
                        <div class="prodname">
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp; 
                                <a class="btn btn-warning" href="Details.aspx?id=<%# string.Format("{0}",Eval("pid"))%>">View Detail</a>
                                <span>
                                    <a class="btn btn-warning"
                                        href="SecuredPage/AddToCart.aspx?pid=<%# string.Format("{0}",Eval("pid"))%>">Add To Cart</a>
                                </span>
                            </p>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:Panel ID="p1" runat="server" Visible="false">
            <div class="col-md-6 col-md-offset-3" id="errormsg">
                <h2>There is No 
                <span>
                    <asp:Label runat="server" ID="msg"></asp:Label></span>
                    !..</h2>
            </div>
        </asp:Panel>
    </div>
    <br />
    <br />
</asp:Content>
