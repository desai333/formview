<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 126px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" Width="317px" 
            onitemdeleting="FormView1_ItemDeleting" 
            oniteminserting="FormView1_ItemInserting" 
            onitemupdating="FormView1_ItemUpdating" onmodechanging="FormView1_ModeChanging" AllowPaging="True" OnPageIndexChanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                <table style="width:100%;" border="1">
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Edit User Information</b>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Id</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("city") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Pin</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("pin") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update">Update</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table style="width:100%;" border="1">
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Insert User Information</b>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Id</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name</td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City</td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Pin</td>
                        <td>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Insert">Insert</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <table style="width:100%;" border="1">
                    <tr>
                        <td colspan="3">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> User Information</b>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Id</td>
                        <td class="style1">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Name</td>
                        <td class="style1">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            City</td>
                        <td class="style1">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Pin</td>
                        <td class="style1">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("pin") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                        </td>
                        <td class="style1">
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="New">New</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [student] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([city] = @original_city) OR ([city] IS NULL AND @original_city IS NULL)) AND (([pin] = @original_pin) OR ([pin] IS NULL AND @original_pin IS NULL))"
            InsertCommand="INSERT INTO [student] ([id], [name], [city], [pin]) VALUES (@id, @name, @city, @pin)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [student]"
            UpdateCommand="UPDATE [student] SET [name] = @name, [city] = @city, [pin] = @pin WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([city] = @original_city) OR ([city] IS NULL AND @original_city IS NULL)) AND (([pin] = @original_pin) OR ([pin] IS NULL AND @original_pin IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_city" Type="String" />
                <asp:Parameter Name="original_pin" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="pin" Type="Decimal" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_city" Type="String" />
                <asp:Parameter Name="original_pin" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="pin" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
