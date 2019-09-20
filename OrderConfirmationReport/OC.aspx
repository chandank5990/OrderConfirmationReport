<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OC.aspx.cs" Inherits="OrderConfirmationReport.OC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
        <div style="width: 800px; font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif;
            border: 2px solid black;">
            <asp:Label ID="Label1" runat="server" Style="text-align: center; font-weight: 700;
                font-size: xx-large; color: #000000;" Text="Time Taken To Send Order Confirmation"></asp:Label></div>
        <br />
        <br />
         <table>
        <tr>
        <td>
            <asp:RadioButton ID="rdbtn1" GroupName="unit" runat="server" Text="AWS-1" 
                style="font-weight: 700; font-size: small; color: #000000;"/></td>
            <td>
                <asp:RadioButton ID="rdbtn2" GroupName="unit" runat="server" Text="AWS-2" 
                    style="font-weight: 700; font-size: small; color: #000000;"/>
            </td>
            <td>
                <asp:RadioButton ID="RadioButton1" GroupName="unit" Text="Both" runat="server" 
                    style="font-weight: 700; font-size: small; color: #000000;" />
            </td>
        </tr>
        </table><br /><br />
         <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="From : " Style="font-weight: 700; font-size: medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="25px" Style="font-weight: 700;
                        font-size: medium; text-align: center" Width="165px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="To : " Style="font-weight: 700; font-size: medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="25px" Style="font-weight: 700;
                        font-size: medium; text-align: center" Width="165px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                        Style="font-weight: 700; font-size: medium" onclick="btnSubmit_Click"/>
                </td>
            </tr>
        </table><br /><br />
        <div>
            <asp:GridView ID="GridView2" runat="server" CellSpacing="2" Style="color: Black;
                text-align: center; height: 218px; width: 800px; color: Black; text-align: center;"
                AutoGenerateColumns="False" ShowFooter="True" ShowHeaderWhenEmpty="True" >
               <Columns>
                <asp:TemplateField HeaderText="Sr No.">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OC" HeaderText="OC" ReadOnly="True" />
                        <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="Customer_Code" HeaderText="Customer_Code" ReadOnly="True" />
                        <asp:BoundField DataField="Cust_PO" HeaderText="Cust_Reference" ReadOnly="True" />
                        <asp:BoundField DataField="OcDate" HeaderText="OC Sent Date" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="Days_To_Send OC" HeaderText="Days To Send OC" ReadOnly="True" />
                        <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" />
               </Columns>
            <HeaderStyle BackColor="#ffffff" BorderStyle="Groove" />
                <EmptyDataTemplate>
                    No Record Available</EmptyDataTemplate>
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
        </center>
</asp:Content>
