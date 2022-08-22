using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Admin
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = 0;
                    int.TryParse(Request.QueryString["id"],out id);
                    using (DBDataContext db = new DBDataContext())
                    {
                        tblproduct p = db.tblproducts.SingleOrDefault(x => x.pid == id);
                        if (p != null)
                        {
                            LoadDDL();
                            
                            pid.Value = id.ToString();//Hidden field
                            txtprice.Text = p.price.ToString();
                            txtfname.Text = p.pname;
                            txtdesc.Text = p.Desc;
                            units.SelectedValue = p.type;
                            ddlcat.SelectedValue = p.cid.ToString();
                            prev.Src = p.image;
                        }
                        else
                        {
                            Response.Redirect("ViewProduct.aspx");
                        }
                    }
                }

            }
        }

        private void LoadDDL()
        {
            using (DBDataContext db = new DBDataContext())
            {
                ddlcat.DataSource = db.tblcategories.ToList();
                ddlcat.DataBind();

                ddlcat.Items.Insert(0, new ListItem() { Text = "Select", Value = "-1" });
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(pid.Value);
           

            using (DBDataContext db = new DBDataContext())
            {
                tblproduct p = db.tblproducts.SingleOrDefault(x => x.pid == id);
                if (p != null)
                {
                    p.pname = txtfname.Text;
                    p.price = Convert.ToInt32(txtprice.Text);
                    p.type = units.SelectedValue;
                    p.cid = Convert.ToInt32(ddlcat.SelectedValue);
                    p.Desc = txtdesc.Text;

                    if (txtfile.HasFile)
                    {
                        txtfile.SaveAs(Server.MapPath("~/Images/" + txtfile.FileName));
                        p.image = "../Images/" + txtfile.FileName;
                    }

                    db.SubmitChanges();
                }

                Response.Redirect("ViewProduct.aspx");
            }
        }
    }
}