using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Admin
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ordergrid.EmptyDataText = "There is no Record!..";
            if (!IsPostBack)
            {
                model.Visible = false;
                GetData();

            }

            if (ordergrid.Rows.Count > 0)
                ordergrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private void GetOrderDetails(int oid)
        {
            using (DBDataContext db = new DBDataContext())
            {
               
                List<tblorderdetail> olist = db.tblorderdetails.Where(x => x.ono == oid.ToString()).ToList();
                foreach (var item in olist)
                {
                    if(item.Unit == "gm")
                    {
                        if (item.quantity == 1)
                            item.quantity = 250;
                        else if (item.quantity == 2)
                            item.quantity = 500; 
                    }
                }
                rptdata.DataSource = olist;
                rptdata.DataBind();

                totalqty.Text = olist.Sum(x => x.quantity).ToString();
                totalprice.Text = olist.Sum(x => x.total).ToString();

                string uname = db.tblorders.SingleOrDefault(x => x.ono == oid).username;

                if(uname != null)
                {
                    tbladdress ad = db.tbladdresses.SingleOrDefault(x => x.username == uname);
                    if(ad != null)
                    {
                        lbladdress.Text = ad.Address;
                        lblname.Text = ad.Name;
                        lblmob.Text = ad.PhoneNumber;
                        lblmark.Text = ad.LandMark;
                    }
                }
            }
        }

        private void GetData(string status = "1",string odate = null)

        {
            using (DBDataContext db = new DBDataContext())
            {
                List<tblorder> olist = new List<tblorder>();
                if (status != "1")
                {
                    olist = db.tblorders.
                       Where(x => x.status == status).ToList();
                    //ordergrid.DataSource = db.tblorders.
                    //   Where(x => x.status == status).ToList();
                }
                else
                {
                    olist = db.tblorders.ToList();
                    //ordergrid.DataSource = db.tblorders.ToList();
                }

                if(!string.IsNullOrEmpty(odate))
                {
                    olist = olist.Where(x => x.date.Contains(odate)).ToList();
                }


                if(status != "1" && !string.IsNullOrEmpty(odate))
                {
                    ordergrid.EmptyDataText = "There is no " + status + "  Record on " + Convert.ToDateTime(odate).ToLongDateString().ToString();

                }
                else
                {
                    ordergrid.EmptyDataText = "There is no records!..";
                }

                ordergrid.DataSource = olist;
                ordergrid.DataBind();
            }
        }
        protected void ordergrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;


            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton b = e.Row.FindControl("btnstatus") as LinkButton;
                if (b.Text == "delivered")
                {
                    b.ForeColor = System.Drawing.Color.Green;
                    b.ToolTip = "Item Already Delivered To customer";
                    b.Enabled = false;
                    b.OnClientClick = "alert('Item Already Delivered to custome!..')";

                }
                else
                {
                    b.ForeColor = System.Drawing.Color.Red;
                    b.ToolTip = "Click To Deliver the Item";
                    // b.NavigateUrl = "Test.aspx?ono=" + e.Row.Cells[0].Text;
                }
            }
        }

        protected void rdbstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdbstatus.SelectedValue != "1")
            {
                GetData(rdbstatus.SelectedValue);
            }
            else
            {
                GetData();
            }

            model.Visible = false;
        }

        protected void ordergrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int oid = Convert.ToInt32(ordergrid.DataKeys[e.NewSelectedIndex].Value);
            GetOrderDetails(oid);
            model.Visible = true;

            ClientScript.RegisterStartupScript(this.GetType(), "k", "interval()", true);

        }

        protected void ordergrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int oid = Convert.ToInt32(ordergrid.DataKeys[e.RowIndex].Value);

            using (DBDataContext db = new DBDataContext())
            {
                tblorder tblorder = db.tblorders.SingleOrDefault(x => x.ono == oid);
                if (tblorder != null)
                {
                    tblorder.status = "delivered";
                    db.SubmitChanges();
                    GetData(rdbstatus.SelectedValue);
                }
            }


            model.Visible = false;
        }

        protected void txtdate_TextChanged(object sender, EventArgs e)
        {
            DateTime date;

            if(DateTime.TryParse(txtdate.Text,out date))
            {
                string d = date.ToShortDateString().ToString();
                if (rdbstatus.SelectedValue != "1")
                {
                    GetData(rdbstatus.SelectedValue,d);
                }
                else
                {
                    GetData(odate:d);
                }

            }
            txtdate.Text = "";
            model.Visible = false;

        }
    }
}