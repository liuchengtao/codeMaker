program sql;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  uSqlTools in 'pas\uSqlTools.pas',
  uBaseDao in 'pas\uBaseDao.pas',
  Unit3 in 'Unit3.pas' {Form3},
  uBaseDM in 'pas\uBaseDM.pas' {BaseDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
 // Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TBaseDM, BaseDM);
  Application.Run;
end.
