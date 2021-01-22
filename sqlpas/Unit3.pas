unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.Win.ADODB, Data.DB, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm3 = class(TForm)
    Button1: TButton;
    FDConnection1: TFDConnection;
    ADOConnection1: TADOConnection;
    ListBox1: TListBox;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses uBaseDM;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var test: TTest;
begin
  //
  test.id := 1;
  test.name := 'myname';
  test.age := 26;
  test.address := 'home';
  test.bz := 'bz';

end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  ADOConnection1.GetTableNames(ListBox1.Items);
end;

end.
