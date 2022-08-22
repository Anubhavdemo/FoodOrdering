<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="FoodOrdering.Admin.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .bgcolor {
            background: rgb(254, 245, 245);
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            opacity: 0.9;
            color: darkblue;
            padding: 20px;
        }
    </style>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#MainContent_productgrid').dataTable({
                stateSave: true
            });
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="col-md-10 col-md-offset-1 bgcolor">
        <asp:GridView runat="server"
            OnRowDataBound="productgrid_RowDataBound"
            ID="productgrid" AutoGenerateColumns="false"
            OnRowDeleting="productgrid_RowDeleting"
            DataKeyNames="pid"
            CssClass="table table-bordered">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="pid" />
                <asp:BoundField HeaderText="Vegetable Name" DataField="pname" />
                <asp:BoundField HeaderText="Price" DataField="price" />
                 <asp:BoundField HeaderText="Unit" DataField="type" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a href="<%# String.Format("EditProduct.aspx?id={0}", Eval("pid")) %>" class="btn btn-primary">Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <asp:Button CausesValidation="false"
                            CssClass="btn btn-danger" ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Food?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
