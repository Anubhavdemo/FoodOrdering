using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Customer.SecuredPage
{
    public partial class ConfirmOreder : System.Web.UI.Page
    {
        string uname = HttpContext.Current.User.Identity.Name.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["prodlist"] == null)
            {
                Response.Redirect("~/Customer/Product.aspx");

            }
            if (!IsPostBack)
            {
                if (Session["prodlist"] != null)
                {
                    List<FoodOrdering.Model.Product> prodlist = (List<FoodOrdering.Model.Product>)Session["prodlist"];

                    if (prodlist.Count() > 0)
                    {
                        //prodlist.GroupBy(x => x.Pid);
                        rptitem.DataSource = prodlist;
                        rptitem.DataBind();

                        int total = prodlist.Sum(x => x.Qty);
                        int rs = prodlist.Sum(x => x.Total);
                        totalqty.Text = total.ToString();
                        totalprice.Text = rs.ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Customer/Product.aspx");
                }

                GetAddress();
            }

            if (p1.Visible)
            {
                lblheading.Text = "Your order will deliver here!.";
            }
            else
            {
                lblheading.Text = "Please Enter delivery address";

            }

        }


        private void GetAddress()
        {
            using (DBDataContext db = new DBDataContext())
            {
                tbladdress add = db.tbladdresses.SingleOrDefault(x => x.username == uname);
                if (add != null)
                {
                    lbladdress.Text = add.Address;
                    lblmark.Text = add.LandMark;
                    lblmob.Text = add.PhoneNumber;
                    lblname.Text = add.Name;
                    p1.Visible = true;
                    p2.Visible = false;
                    lblheading.Text = "Your order will deliver here!.";

                }
                else
                {
                    p1.Visible = false;
                    p2.Visible = true;
                    lblheading.Text = "Please Enter delivery address";

                }
            }
        }

        protected void btnedid_Click(object sender, EventArgs e)
        {
            using (DBDataContext db = new DBDataContext())
            {
                tbladdress add = db.tbladdresses.SingleOrDefault(x => x.username == uname);
                if (add != null)
                {
                    txtaddress.Text = add.Address;
                    txtmark.Text = add.LandMark;
                    txtmob.Text = add.PhoneNumber;
                    txtname.Text = add.Name;
                    p1.Visible = false;
                    p2.Visible = true;
                    lblheading.Text = "Please Enter delivery address";

                }
            }
        }

        protected void btnsaveaddress_Click(object sender, EventArgs e)
        {
            using (DBDataContext db = new DBDataContext())
            {
                tbladdress add = db.tbladdresses.SingleOrDefault(x => x.username == uname);

                if (add != null)
                {
                    add.Address = txtaddress.Text;
                    add.LandMark = txtmark.Text;
                    add.PhoneNumber = txtmob.Text;
                    add.Name = txtname.Text;
                    db.SubmitChanges();
                }
                else
                {
                    tbladdress ad = new tbladdress();
                    ad.username = uname;
                    ad.Address = txtaddress.Text;
                    ad.LandMark = txtmark.Text;
                    ad.PhoneNumber = txtmob.Text;
                    ad.Name = txtname.Text;
                    db.tbladdresses.InsertOnSubmit(ad);
                    db.SubmitChanges();

                }
            }

            GetAddress();
        }

        protected void placeorder_Click(object sender, EventArgs e)
        {
           
                if (Session["prodlist"] != null)
                {
                    List<FoodOrdering.Model.Product> prodlist = (List<FoodOrdering.Model.Product>)Session["prodlist"];

                    if (prodlist.Count() > 0)
                    {
                        tblorder order = new tblorder()
                        {
                            username = uname,
                            date = DateTime.Now.ToString(),
                            status = "pending",
                            bill = Convert.ToInt32(prodlist.Sum(x => x.Total))
                        };

                        using (DBDataContext db = new DBDataContext())
                        {
                            db.tblorders.InsertOnSubmit(order);
                            db.SubmitChanges();

                            foreach (Product p in prodlist)
                            {
                            db.tblorderdetails.InsertOnSubmit(
                                  new tblorderdetail()
                                  {
                                      ono = order.ono.ToString(),
                                      pno = p.Pid,
                                      pname = p.Pname,
                                      quantity = p.Qty,
                                      total = p.Total,
                                      Unit = (db.tblproducts.SingleOrDefault(x => x.pid == p.Pid).type == "per kg" ? "kg" :
                                          (db.tblproducts.SingleOrDefault(x => x.pid == p.Pid).type == "per unit" ? "unit" : (p.Qty < 3 ? "gm" : "kg"))
                                      )   
                                      }
                                    );
                                db.SubmitChanges();
                            }
                        }

                        placeorder.Enabled = false;
                    btnedid.Enabled = false;
                        p3.Visible = true;
                    }
                }

        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            if (Session["prodlist"] != null)
            {
                Session["prodlist"] = null;
            }
            Response.Redirect("~/Customer/Product.aspx");

        }
    }
}