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



            /*
            //האם המשתמש קיים?
            //לפי אימייל
            //אם לא קיים
            //עושים ISERTR
            //ובמקום לכתוב נרשמת בהצלחה
            //Response.Redirect("login.aspx");
            //אם קיים
            //stResult="המשתמש קיים"
            */

            string sqlInsert =
                "INSERT INTO tUsers VALUES (" +
                "N'" + fn + "'," +
                "N'" + ln + "'," +
                "N'" + email + "'," +
                "N'" + password + "'," +
                "N'" + genres + "'" +
                ")";


            MyAdoHelper.DoQuery("MyDB.mdf", sqlInsert);

            stResult = "נרשמת בהצלחה!";
        }
    }
}
