using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    public string stResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string fn = Request.Form["firstname"];
            string ln = Request.Form["lastname"];
            string email = Request.Form["Email"];
            string password = Request.Form["Password"];
            string genres = Request.Form["genre"];



            // בדיקה אם האימייל קיים
            string sqlCheck =
                "SELECT * FROM tUsers WHERE gmail = N'" + email + "'";

            bool exists = MyAdoHelper.IsExist(sqlCheck);

            if (exists)
            {
                stResult = "מייל שהוכנס קיים במערכת, הכנס אימייל חדש";
            }
            else
            {
                string sqlInsert =
                "INSERT INTO tUsers VALUES (" +
                "N'" + fn + "'," +
                "N'" + ln + "'," +
                "N'" + email + "'," +
                "N'" + password + "'," +
                "N'" + genres + "'" +
                ")";


                MyAdoHelper.DoQuery("MyDB.mdf", sqlInsert);

                Response.Redirect("about.aspx");
            }
        }
    }
}
