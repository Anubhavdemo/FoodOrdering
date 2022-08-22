<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FoodOrdering.Admin.Order" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #MainContent_model {
            overflow-y: scroll;
            overflow-x: hidden;
            width: 900px;
            max-height: 500px;
            /*height: 500px;*/
            margin-top: 0px;
            margin-left: 100px;
            position: fixed;
            z-index: 100;
            background-color: white;
            border-radius: 3px;
            border: 1px solid black;
            /*display : none;*/
        }

        .mytable {
            width: 500px;
            height: 360px;
        }

        .bgcolor {
            background: rgb(254, 245, 245);
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            opacity: 0.8;
            color: darkblue;
            padding: 20px;
        }

        .well-lg {
            background-color: black;
            color: white;
        }
    </style>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#MainContent_ordergrid').dataTable({
                stateSave: true
            });
        });

        function Closefun() {
            $("#MainContent_model").hide('fade');
        }

        function interval() {
            setInterval(function () {
                $("#MainContent_model").hide('fade');
            }, 15000);
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="model" runat="server" visible="false">
        <div class="well-sm bg-primary">
            <h4 class="text-center">Order Details 
                        <span class="pull-right btn btn-danger" onclick="Closefun()">X</span></h4>

        </div>
        <div class="row">
            <div class="well-lg">
                <fieldset>
                    <legend class="text-success">You have to Deliver here!...
                    </legend>

                    <div class="row">
                        <div class="col-md-2">
                            <label>Address</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lbladdress"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <label>Land Mark</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lblmark"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <label>Contact Number</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lblmob"></asp:Label>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-2">
                            <label>Contact Person</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lblname"></asp:Label>
                        </div>
                    </div>

                </fieldset>
            </div>
        </div>
        <div>
            <div>
                <div class="row">
                    <div class="well-lg">
                        <fieldset>
                            <legend class="text-success">Order Details
                            </legend>
                            <div class="row">
                                <div class="col-md-4">
                                    <b>ITEM </b>
                                </div>
                                <div class="col-md-4">
                                    <b>QUANTITY</b>
                                </div>
                                <div class="col-md-4">
                                    <b>Amount</b>
                                </div>
                            </div>
                            <asp:Repeater ID="rptdata" runat="server">
                                <ItemTemplate>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"pname") %>' runat="server"></asp:Label>
                                        </div>

                                        <div class="col-md-4">
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"quantity") %>'></asp:Label>
                                            <span>
                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Unit") %>'></asp:Label>

                                            </span>
                                        </div>
                                        <div class="col-md-4">
                                            &#8377 
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"total") %>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <hr />
                            <div class="row">
                                <div class="col-md-4">
                                    <b>Total </b>
                                </div>
                                <div class="col-md-4">
                                    <b>
                                        <asp:Label runat="server" ID="totalqty"></asp:Label>
                                        <span>Unit(s)</span>
                                    </b>
                                </div>
                                <div class="col-md-4">
                                    <b><span>&#8377 </span>
                                        <asp:Label ID="totalprice" runat="server"></asp:Label>
                                    </b>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <div class="row">
        <div class="col-md-8 col-md-offset-2 text-center" style="background: rgb(254, 245, 245); opacity: 0.8;">

            <div class="col-md-6">
                <asp:RadioButtonList ID="rdbstatus" runat="server"
                    RepeatDirection="Horizontal" Height="50px"
                    Font-Size="Large"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="rdbstatus_SelectedIndexChanged" Width="433px">
                    <asp:ListItem Value="1" Selected="True">&nbsp;&nbsp;All Orde</asp:ListItem>
                    <asp:ListItem Value="Pending">&nbsp;&nbsp;Pending Orde</asp:ListItem>
                    <asp:ListItem Value="delivered">&nbsp;&nbsp;Deliver Order</asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div class="col-md-6">
                <br />
                <div class="col-md-offset-3">
                    <div class="row">
                        <div class="col-md-4">
                            <b class="text-success">Order Date</b>
                        </div>
                        <div class="col-md-8">
                            <asp:TextBox
                                AutoPostBack="true"
                                ID="txtdate"
                                OnTextChanged="txtdate_TextChanged"
                                runat="server"
                                TextMode="Date"
                                CssClass="form-control">
                            </asp:TextBox>
                            <script>
                                document.getElementById("MainContent_txtdate").max = "<% Response.Write(DateTime.Now.ToString("yyyy-MM-dd")); %>";

                            </script>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 well-sm bgcolor col-md-offset-2">

            <br />
            <asp:GridView ID="ordergrid" runat="server"
                AutoGenerateColumns="false"
                ShowHeaderWhenEmpty="true"
                EmptyDataRowStyle-CssClass="text-center text-danger"
                OnRowDataBound="ordergrid_RowDataBound"
                OnRowDeleting="ordergrid_RowDeleting"
                OnSelectedIndexChanging="ordergrid_SelectedIndexChanging"
                DataKeyNames="ono">
                <Columns>
                    <asp:BoundField DataField="ono" HeaderText="Order No" InsertVisible="False"
                        ReadOnly="True" SortExpression="ono" />
                    <asp:BoundField DataField="username" HeaderText="User Name"
                        SortExpression="username" />
                    <asp:BoundField DataFormatString="{0:d}" HtmlEncode="false" DataField="date" HeaderText="Order Date & Time" SortExpression="date" />

                    <asp:BoundField DataField="bill" HeaderText="Bill Amount" SortExpression="bill" />


                    <asp:CommandField ButtonType="Button" ShowSelectButton="true" SelectText="View"
                        HeaderText="View Details" ControlStyle-CssClass="btn btn-primary" />

                    <asp:TemplateField HeaderText="Delivery Status">
                        <ItemTemplate>
                            <i class="btn btn-sm btn-default">
                                <asp:LinkButton ID="btnstatus"
                                    CommandName="Delete"
                                    Text='<%# Eval("status")%>' runat="server">
                                </asp:LinkButton>
                                <span class='badge'>O</span>
                            </i>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
