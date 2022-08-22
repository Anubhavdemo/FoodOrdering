<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="FoodOrdering.Admin.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgcolor {
            background: rgb(254, 245, 245);
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .hg {
            max-height: 50px;
            padding: 1px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }
    </style>

      <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#MainContent_catgrid').dataTable({
                stateSave: true
            });
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <div class="well-sm hg bg-primary">
                <div class="text-center">
                    <h2>Add New Category
                    </h2>
                </div>
            </div>

            <div class="well-sm bgcolor">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <h4>Catgory Name :</h4>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox CssClass="form-control" runat="server" ID="txtcname"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtcname"
                                ForeColor="Red"
                                ErrorMessage="Please Enter Category Name">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <h4>Discription :</h4>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox TextMode="MultiLine" Rows="5"
                                CssClass="form-control" runat="server" ID="txtdesc"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3 col-md-offset-2">
                            <asp:Button runat="server" ID="btnsave" OnClick="btnsave_Click"
                                Text="Save" CssClass="btn btn-block btn-success" />
                            <asp:Button runat="server" ID="btnUpdate"
                                Text="Update" Visible="false" CssClass="btn btn-block btn-success" OnClick="btnUpdate_Click" />
                        </div>
                        <div class="col-md-3">
                            <asp:Button runat="server" CausesValidation="false" Text="Clear" CssClass="btn btn-block btn-danger" OnClick="Unnamed_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <br />
    <br />
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="well-sm bgcolor">
                <asp:GridView ID="catgrid" runat="server" AutoGenerateColumns="false"
                    HeaderStyle-CssClass="text-center"
                    OnRowDataBound="catgrid_RowDataBound"
                    ShowHeaderWhenEmpty="true"
                    DataKeyNames="cid"
                    OnSelectedIndexChanging="catgrid_SelectedIndexChanging"
                    OnRowDeleting="catgrid_RowDeleting"
                    EmptyDataText="No Record Inserted"
                    EmptyDataRowStyle-CssClass="text-center text-danger text-capitalize"
                    CssClass="table table-bordered table-hover">
                    <Columns>
                        <asp:BoundField HeaderText="Category Id" DataField="cid" />
                        <asp:BoundField HeaderText="Category Name" DataField="cname" />
                        <asp:BoundField HeaderText="Description" DataField="desc"
                            NullDisplayText="! Description Not Provided" />
                        <asp:TemplateField HeaderText="Remove">
                            <ItemTemplate>
                                <asp:Button CausesValidation="false"
                                    CssClass="btn btn-danger" ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this Category?');" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField HeaderText="Action" SelectText="Edit"
                            ShowSelectButton="true" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>
