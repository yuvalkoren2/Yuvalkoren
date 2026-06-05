using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public class MyAdoHelper
{
    private const String dbFileName = "~/App_Data/MyDB.mdf";

    public static SqlConnection ConnectToDb()
    {
        string path = HttpContext.Current.Server.MapPath(dbFileName);
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True;User Instance=False;";
        return new SqlConnection(connStr);
    }

    // הפונקציה שחסרה לך בלוגין
    public static bool IsExist(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader data = com.ExecuteReader();
        bool found = data.Read();
        conn.Close();
        return found;
    }

    public static DataTable ExecuteDataTable(string sql)
    {
        SqlConnection conn = ConnectToDb();
        conn.Open();
        SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        tableAdapter.Fill(dt);
        conn.Close();
        return dt;
    }

    public static string printDataTable(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(sql);
        string html = "<table border='1'>";
        foreach (DataRow row in dt.Rows)
        {
            html += "<tr>";
            foreach (object item in row.ItemArray) html += "<td>" + item.ToString() + "</td>";
            html += "</tr>";
        }
        return html + "</table>";
    }

    // פונקציה לביצוע שאילתות מסוג INSERT, UPDATE, DELETE שאינן מחזירות נתונים
    public static void DoQuery(string sql)
    {
        // יצירת חיבור למסד הנתונים
        SqlConnection conn = ConnectToDb();
        // פתיחת החיבור
        conn.Open();
        // יצירת פקודת SQL לביצוע מול מסד הנתונים
        SqlCommand com = new SqlCommand(sql, conn);
        // ביצוע הפקודה (עבור שינויים בנתונים)
        com.ExecuteNonQuery();
        // סגירת החיבור לאחר סיום הפעולה
        conn.Close();
    }
}