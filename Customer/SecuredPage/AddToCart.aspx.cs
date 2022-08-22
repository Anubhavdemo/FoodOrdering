using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Customer.SecuredPage
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblmsg.Visible = false;
            hl.Visible = false;
            if (!IsPostBack)
            {
                LoadDDL();
                if (Request.QueryString["qty"] != null)
                {
                    int qty = int.Parse(Request.QueryString["qty"]);
                    //txtqty.Text = qty.ToString();
                }
            }
        }

        private void LoadDDL()
        {
            int pid;
            if (Request.QueryString["pid"] != null && int.TryParse(Request.QueryString["pid"], out pid))
            {
                using (DBDataContext db = new DBDataContext())
                {
                    string type = db.tblproducts.SingleOrDefault(x => x.pid == pid).type;

                    if (!string.IsNullOrEmpty(type))
                    {
                        if (type == "per kg")
                        {
                            for (int i = 1; i < 6; i++)
                            {
                                ddlunit.Items.Add(new ListItem()
                                {
                                    Text = i.ToString() + " kg",
                                    Value = i.ToString()
                                });
                            }
                        }
                        else if (type == "per unit")
                        {
                            for (int i = 1; i < 8; i++)
                            {
                                ddlunit.Items.Add(new ListItem()
                                {
                                    Text = i.ToString() + " unit(s)",
                                    Value = i.ToString()
                                });
                            }
                        }
                        else
                        {
                            ddlunit.Items.Add(new ListItem() {

                                Text = "250 gm",
                                Value = "1"
                            });

                            ddlunit.Items.Add(new ListItem()
                            {
                                Text = "500 gm",
                                Value = "2"
                            });

                            for (int i = 1; i < 6; i++)
                            {
                                ddlunit.Items.Add(new ListItem()
                                {
                                    Text = i.ToString() + " kg",
                                    Value = (i + 1).ToString()
                                });
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("~/Customer/Product.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["pid"] == null)
            {
                Response.Redirect("~/Customer/Product.aspx");
            }
            int pid = (int)Session["pid"];
            String pname = Session["pname"].ToString();
            int price = (int)Session["price"];
            int qty = int.Parse(ddlunit.SelectedValue);
            String img = Session["img"].ToString();
            string type = ddlunit.SelectedItem.Text;
            Product p = new Product(pid, pname, qty, price, img,type);

            ProductList list;
            List<Product> prodlist;
            if (Session["prodlist"] == null)
            {
                list = new ProductList();
            }
            else
            {
                prodlist = (List<Product>)Session["prodlist"];
                list = new ProductList(prodlist);
                lblmsg.Visible = true;
                hl.Visible = true;

            }
            prodlist = list.addProduct(p);
            Session["prodlist"] = prodlist;
            lblmsg.Visible = true;
            hl.Visible = true;
            Button1.Enabled = false;
            // Response.Redirect("View Product.aspx");

        }
    }
}