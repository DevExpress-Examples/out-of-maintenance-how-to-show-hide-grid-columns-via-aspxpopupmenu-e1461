<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function Grid_ContextMenu(s, e) {
            if(e.objectType == "header") {
                var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                var y = ASPxClientUtils.GetEventY(e.htmlEvent);
                PopupMenu.ShowAtPos(x, y);
            }
        }

        function PopupMenu_ItemClick(s, e) {
            CallbackPanel.PerformCallback('toggle ' + e.item.name);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <dx:ASPxCallbackPanel runat="server" ID="CallbackPanel" 
             ClientInstanceName="CallbackPanel" Width="100%" OnCallback="CallbackPanel_Callback">
            <PanelCollection><dx:PanelContent runat="server">

                <dx:ASPxGridView ID="Grid" runat="server" Width="80%" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="ProductID">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="0" />
                        <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1" />
                        <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2" />
                        <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3" />
                        <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4" />
                        <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="5" />
                        <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="6" />
                        <dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="7" />
                        <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="8" />
                    </Columns>
                    <ClientSideEvents ContextMenu="Grid_ContextMenu" />
                </dx:ASPxGridView>
                    
                <dx:ASPxPopupMenu ID="PopupMenu" runat="server" ClientInstanceName="PopupMenu">
                    <ClientSideEvents ItemClick="PopupMenu_ItemClick" />
                </dx:ASPxPopupMenu>

            </dx:PanelContent></PanelCollection>
        </dx:ASPxCallbackPanel>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Products]" />
    </form>
</body>
</html>
