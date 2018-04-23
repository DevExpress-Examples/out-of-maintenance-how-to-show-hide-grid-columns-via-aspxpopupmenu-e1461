<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
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
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<br />
		<br />
		<dxcp:ASPxCallbackPanel runat="server" ID="CallbackPanel" 
			 ClientInstanceName="CallbackPanel" Width="100%" OnCallback="CallbackPanel_Callback">
			<PanelCollection><dxrp:PanelContent runat="server">
				<dxwgv:ASPxGridView ID="Grid" runat="server" Width="80%" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="ProductID">
					<Columns>
						<dxwgv:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="0" />
						<dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1" />
						<dxwgv:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2" />
						<dxwgv:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3" />
						<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4" />
						<dxwgv:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="5" />
						<dxwgv:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="6" />
						<dxwgv:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="7" />
						<dxwgv:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="8" />
					</Columns>
					<ClientSideEvents ContextMenu="Grid_ContextMenu" />
				</dxwgv:ASPxGridView>
				<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
					SelectCommand="SELECT * FROM [Products]" />

				<dxm:ASPxPopupMenu ID="PopupMenu" runat="server" ClientInstanceName="PopupMenu">
					<ClientSideEvents ItemClick="function(s, e){ CallbackPanel.PerformCallback('toggle ' + e.item.name) }" />
				</dxm:ASPxPopupMenu>
			</dxrp:PanelContent></PanelCollection>
		</dxcp:ASPxCallbackPanel>
	</form>
</body>
</html>