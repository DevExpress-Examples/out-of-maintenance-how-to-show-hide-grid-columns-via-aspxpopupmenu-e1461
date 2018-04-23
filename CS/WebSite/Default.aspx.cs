using System;
using DevExpress.Web.ASPxMenu;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxClasses;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack)
            CreateMenuItems();
        UpdateMenuState();
    }

    protected void CallbackPanel_Callback(object source, CallbackEventArgsBase e) {
        if(e.Parameter.StartsWith("toggle")) {
            int index = int.Parse(e.Parameter.Substring(7));
            GridViewColumn column = Grid.Columns[index];
            if(column == null)
                return;
            column.Visible = !column.Visible;
            UpdateMenuState();    
        }
        
    }

    void CreateMenuItems() {
        for(int i = 0; i < Grid.Columns.Count; i++) {
            GridViewColumn column = Grid.Columns[i];
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            PopupMenu.Items.Add(dataColumn != null ? dataColumn.FieldName : "#", i.ToString());
        }
    }

    void UpdateMenuState() {
        for(int i = 0; i < Grid.Columns.Count; i++)
            PopupMenu.Items[i].Checked = Grid.Columns[i].Visible;
    }

}
