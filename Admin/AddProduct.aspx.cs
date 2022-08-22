using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (DBDataContext db = new DBDataContext())
                {
                    ddlcat.DataSource = db.tblcategories.ToList();
                    ddlcat.DataBind();

                    ddlcat.Items.Insert(0, new ListItem() { Text = "Select", Value = "-1" });
                }
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            txtfile.SaveAs(Server.MapPath("~/Images/" + txtfile.FileName));
            string path = "../Images/" + txtfile.FileName;

            tblproduct product = new tblproduct()
            {
                pname = txtfname.Text,
                Desc = txtdesc.Text,
                cid = Convert.ToInt32(ddlcat.SelectedValue),
                image = path,
                price = Convert.ToInt32(txtprice.Text),
                type = units.SelectedValue

            };

            using (DBDataContext db = new DBDataContext())
            {
                db.tblproducts.InsertOnSubmit(product);
                db.SubmitChanges();
            }

            txtdesc.Text = "";
            txtfname.Text = "";
            units.ClearSelection();
            ddlcat.ClearSelection();
            txtprice.Text = "";

            string jsmethod = "AlertMessage(' Record Inserted !..','alert-success')";
            ClientScript.RegisterStartupScript(this.GetType(), "k1", jsmethod, true);
        }
    }
}