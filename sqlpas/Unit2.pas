unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst, Data.DB, FireDAC.Comp.Client,
  Vcl.ComCtrls, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ipEdt: TEdit;
    Label2: TLabel;
    datasourceEdt: TEdit;
    Label3: TLabel;
    usernameEdt: TEdit;
    Label4: TLabel;
    password: TEdit;
    FDConnection1: TFDConnection;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    CheckListBox1: TCheckListBox;
    Label5: TLabel;
    tableEdt: TEdit;
    Button2: TButton;
    FDQuery1: TFDQuery;
    Button3: TButton;
    zjCheck: TCheckBox;
    ListBox1: TListBox;
    FDTable1: TFDTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses System.Generics.Collections,uSqlTools,System.Json,uBaseDao;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var dao: TczBaseDao<TczSort>;
sort: TczSort;
s: TFDDatSColumn;
ss: TFilterOptions;
begin
//
  FDConnection1.Connected := True;
  FDConnection1.GetTableNames('','','',CheckListBox1.Items, [osMy], [tkTable]);
 // FDTable1.Connection := FDConnection1;
//  FDTable1.Open('t_log');
//  ss := FDTable1.FilterOptions;
//  s := FDTable1.GetFieldColumn(FDTable1.FieldByName('id'));

end;

procedure TForm2.Button2Click(Sender: TObject);
var I,J: Integer;
    sqlStr,s: String;
    fields: TStringlist;
    List: TList<TField>;
begin
  sqlStr := 'select *  from %:S  limit 1';
  for I := 0 to CheckListBox1.Items.Count - 1 do
  begin
    if CheckListBox1.Checked[I] then
    begin
      FDQuery1.Connection := FDConnection1;
      sqlStr := Format(sqlStr,[CheckListBox1.Items[I]]);
      FDQuery1.SQL.Text := sqlStr;
      FDQuery1.Open;
      fields := TStringList.Create;
      FDQuery1.GetFieldNames(fields);
       List := TList<TField>.Create;
       fields.Delimiter := ';';
      FDQuery1.GetFieldList(List,fields.DelimitedText);
      for J := 0 to List.Count - 1 do
      begin
        s := List.Items[J].FieldName;
       // Listbox1.Items.Add(s);
      end;
      FreeAndNil(fields);
      FreeAndNil(List);
    end;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var tableBuilder: TcenzTabelBuilder;
  I: Integer;
  stm,temStm: TStringStream;
  s,ss : String;
begin
  for I := 0 to CheckListBox1.Items.Count - 1 do
  begin
    if CheckListBox1.Checked[I] then
    begin
      //tableBuilder := TcenzTabelBuilder.Create(CheckListBox1.Items[I],FDConnection1);
      tableBuilder := TcenzTabelBuilder.Create(CheckListBox1.Items[I],FDConnection1,zjCheck.Checked);
      tableBuilder.build;
    //  s := s + #10#13 + tableBuilder.getRecord;
    end;
  end;
//  Try
//    temStm := TStringStream.Create('',TEncoding.UTF8);
//    temStm.LoadFromFile('D:\Users\DELL\103\cenzCodeMaker\sqlpas\Win32\Debug\tem\tem1.txt');
//    ss := Format(temStm.DataString,[s]);
//    stm := TStringStream.Create(ss,TEncoding.UTF8);
//    stm.SaveToFile('D:\Users\DELL\103\cenzCodeMaker\sqlpas\Win32\Debug\tem\test.txt');
//    tableBuilder.getDaoAdd;
//  Finally
//    stm.Free;
//    temStm.Free;
//  End;
end;

procedure TForm2.CheckListBox1Click(Sender: TObject);
begin
  CheckListBox1.CheckAll(cbChecked);
end;

end.
