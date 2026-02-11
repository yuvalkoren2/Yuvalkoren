using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    public string stResult = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
           
            string gmail = Request.Form["pass"];
            string password = Request.Form["Password"];


            // בדיקת משתמש רגיל
            string sqlSelect =
                "SELECT * FROM tUsers " +
                "WHERE Email = N'" + gmail + "' " +
                "AND UserPassword = N'" + password + "'";

            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (!userExists)
                stResult = "אימייל או סיסמה שגויים";
            else
                stResult = "משתמש רשום";

        }
    }
}