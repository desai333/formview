using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\ASP\\Unit 3\\9 FormView Control\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fdisplay();
        }
    }
    public void fdisplay()
    {
     /*   cmd = new SqlCommand("select * from student", con);
        con.Open();
        dr=cmd.ExecuteReader();
        FormView1.DataSource = dr;
        FormView1.DataBind();
        con.Close(); */

        FormView1.DataSource = SqlDataSource1;
        SqlDataSource1.DataBind();
        FormView1.DataBind();
    }
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fdisplay();
    }

    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Label id = FormView1.FindControl("Label5") as Label;
        TextBox name = FormView1.FindControl("TextBox1") as TextBox;
        TextBox city = FormView1.FindControl("TextBox2") as TextBox;
        TextBox pin = FormView1.FindControl("TextBox3") as TextBox;

        cmd = new SqlCommand("update student set name='"+name.Text+"',city='"+city.Text+"',pin="+pin.Text+" where id="+id.Text+"", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        fdisplay();
    }
    protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        Label id = FormView1.FindControl("Label1") as Label;
        cmd = new SqlCommand("delete from student where id="+id.Text+"", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        fdisplay();
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        TextBox id = FormView1.FindControl("TextBox4") as TextBox;
        TextBox name = FormView1.FindControl("TextBox5") as TextBox;
        TextBox city = FormView1.FindControl("TextBox6") as TextBox;
        TextBox pin = FormView1.FindControl("TextBox7") as TextBox;

        cmd = new SqlCommand("insert into student values("+id.Text+",'"+name.Text+"','"+city.Text+"',"+pin.Text+")", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        FormView1.ChangeMode(FormViewMode.Insert);
        fdisplay();
    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {
        FormView1.PageIndex = e.NewPageIndex;
        fdisplay();

    }
}
