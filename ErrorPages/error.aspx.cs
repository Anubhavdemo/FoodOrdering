using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.ErrorPages
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnback.Attributes.Add("onClick", "javascript:history.back(); return false;");
        }

        protected override void OnPreInit(EventArgs e)
        {
            string uname = HttpContext.Current.User.Identity.Name.ToString();

            if(uname == "admin")
            {
                this.MasterPageFile = "~/MasterPages/Admin.Master";

            }
        }
    }
}