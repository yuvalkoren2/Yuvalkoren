using System;

public partial class exit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // ניקוי כל המשתנים הזמניים השמורים בזיכרון של הדפדפן עבור המשתמש הנוכחי
        Session.Clear();

        // ביטול וסיום הסשן הנוכחי באופן רשמי
        Session.Abandon();

        // הפניה של המשתמש המנותק חזרה לדף הבית (או דף אודות) בתור אורח
        Response.Redirect("about.aspx");
    }
}