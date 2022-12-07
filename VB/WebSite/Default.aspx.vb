Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			CreateMenuItems()
		End If
		UpdateMenuState()
	End Sub

	Protected Sub CallbackPanel_Callback(ByVal source As Object, ByVal e As CallbackEventArgsBase)
		If e.Parameter.StartsWith("toggle") Then
			Dim index As Integer = Integer.Parse(e.Parameter.Substring(7))
			Dim column As GridViewColumn = Grid.Columns(index)
			If column Is Nothing Then
				Return
			End If
			column.Visible = Not column.Visible
			UpdateMenuState()
		End If

	End Sub

	Private Sub CreateMenuItems()
		For i As Integer = 0 To Grid.Columns.Count - 1
			Dim column As GridViewColumn = Grid.Columns(i)
			Dim dataColumn As GridViewDataColumn = TryCast(column, GridViewDataColumn)
			If dataColumn IsNot Nothing Then
				PopupMenu.Items.Add(dataColumn.FieldName, i.ToString())
			Else
				PopupMenu.Items.Add("#", i.ToString())
			End If
		Next i
	End Sub

	Private Sub UpdateMenuState()
		For i As Integer = 0 To Grid.Columns.Count - 1
			PopupMenu.Items(i).Checked = Grid.Columns(i).Visible
		Next i
	End Sub

End Class
