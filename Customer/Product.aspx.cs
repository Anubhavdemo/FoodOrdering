using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Customer
{
    public partial class Food : System.Web.UI.Page
    {
        int pagesize = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["pno"] == null)
                {
                    if(Session["cid"] != null)
                    {
                        Session["cid"] = null;
                    }
                }
                LoadDDL();
                FetchData();
            }

        }

        private void FetchData()
        {
            int pno = 1;
            if (Request.QueryString["pno"] != null)
            {
                if(int.TryParse(Request.QueryString["pno"],out pno))
                {
                    pno = Convert.ToInt32(Request.QueryString["pno"]);
                }
            }
            GetData(pagenumber: pno);
        }

        private void GetData(int pagenumber = 1)
        {
            int count = 0;
            using (DBDataContext db = new DBDataContext())
            {

                if (Session["cid"] != null)
                {
                    int cid = Convert.ToInt32(Session["cid"]);
                    count = db.tblproducts.Where(x => x.cid == cid).Count();
                    rptproduct.DataSource = db.tblproducts.
                        Where(x => x.cid == cid).ToList()
                       .Skip((pagenumber - 1) * pagesize).Take(pagesize);
                }
                else
                {
                    count = db.tblproducts.Count();
                    rptproduct.DataSource = db.tblproducts.ToList()
                   .Skip((pagenumber - 1) * pagesize).Take(pagesize);
                }
                PageIndexing(count: count);
                rptproduct.DataBind();
                if (count > 0)
                {
                    p1.Visible = false;
                }
                else
                {
                    string ms = "";
                    if (Session["cid"] != null)
                    {
                        ms += ddlcat.SelectedItem;
                    }
                    msg.Text = ms;
                    p1.Visible = true;
                }

            }
        }

        private void LoadDDL()
        {
            using (DBDataContext db = new DBDataContext())
            {
                ddlcat.DataSource = db.tblcategories.ToList();
                ddlcat.DataBind();

                ddlcat.Items.Insert(0, new ListItem() { Text = "Select Category", Value = "-1" });
            }

            if (Session["cid"] != null)
            {
                ddlcat.SelectedValue = Session["cid"].ToString();
            }
        }
        private void PageIndexing(int count = 0)
        {
            List<ListItem> listItems = new List<ListItem>();

            if (count % pagesize == 0)
            {
                count = count / pagesize;
            }
            else
            {
                count = count / pagesize + 1;
            }

            for (int i = 1; i <= count; i++)
            {
                listItems.Add(new ListItem()
                {
                    Text = i.ToString()
                });
            }

            rptpage.DataSource = listItems;
            rptpage.DataBind();
        }

        protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cid = ddlcat.SelectedValue;

            if (cid != "-1" && Request.QueryString["pno"] != null)
            {
                Session["cid"] = cid;
                //FetchData(1);
                Response.Redirect("Product.aspx?pno=1");
            }
            else if (cid != "-1")
            {
                Session["cid"] = cid;
            }
            else
            {
                Session["cid"] = null;
                //FetchData();
            }
            FetchData();
        }

       

       
    }
}