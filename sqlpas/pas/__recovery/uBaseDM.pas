unit uBaseDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
    TczSort = Record   //排序
      FColName: String;
      FSort: String;
    end;

    TczPage = Record    //分页
      FPageNum: Integer;
      FPageCount: Integer;
    end;

    RTest = ^TTest;
    TTest = Record    //测试
      id: Integer;
      name: String;
      age: Integer;
      bz: String;
      address: String;
    end;

    TWhereClause = class
      wcStr: String;
      strict private
        procedure addString(wcName: String; wcValue: String);
        procedure addInteger(wcName: String; wcValue: Integer);
        procedure addFolat(wcName: String; wcValue: Double);
        procedure addBoolean(wcName: String; wcValue: Boolean);
      public
        function add(wcName: String; wcValue: Variant): TWhereClause;
        function toStr: String;
    end;
    TBaseDM = class(TDataModule)
      BaseConn: TFDConnection;
    ExecQry: TFDQuery;
    private
      { Private declarations }
    public
      { Public declarations }
      function OpenSQL(sqlStr: String): TFDQuery;
      function ExecSQL(sqlStr: String): Integer;
    end;

var
  BaseDM: TBaseDM;

implementation
uses Variants;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TBaseDM }

function TBaseDM.ExecSQL(sqlStr: String): Integer;
begin
  Try
    ExecQry.Close;
    ExecQry.SQL.Text := sqlStr;
    ExecQry.ExecSQL;
    Result := 0;
  Except
    Result := -1;
  End;
end;

function TBaseDM.OpenSQL(sqlStr: String): TFDQuery;
begin
  Try
    Result := TFDQuery.Create(nil);
    Result.Connection := BaseConn;
    Result.Open(sqlStr);
  Except
    FreeAndNil(Result);
  End;
end;

{ TWhereClause }

function TWhereClause.add(wcName: String; wcValue: Variant): TWhereClause;
begin
  if not VarisNull(wcValue) then
  begin
    case VarType(wcValue) of
        varSmallInt: addInteger(wcName,wcValue);
        varInteger:  addInteger(wcName,wcValue);
        varSingle:   addInteger(wcName,wcValue);
        varDouble:   addFolat(wcName,wcValue);
     //   varCurrency: (VCurrency: Currency);
     //   varDate:     (VDate: TDateTime);
        varString:   addString(wcName,wcValue);
     //   varDispatch: (VDispatch: Pointer);
     //   varError:    (VError: HRESULT);
        varBoolean:  addBoolean(wcName,wcValue);
      //  varUnknown:  (VUnknown: Pointer);
        varShortInt: addInteger(wcName,wcValue);
        varByte:     addInteger(wcName,wcValue);
        varWord:     addInteger(wcName,wcValue);
        else
          addString(wcName,wcValue);
    end;
  end;
  Result := Self;
end;

procedure TWhereClause.addBoolean(wcName: String; wcValue: Boolean);
var s: String;
begin
  s := ' and %0:S = %1:S ';
  Self.wcStr := Self.wcStr + Format(s,[wcName,wcValue]);
end;

procedure TWhereClause.addFolat(wcName: String; wcValue: Double);
var s: String;
begin
  s := ' and %0:S = %1:D ';
  Self.wcStr := Self.wcStr + Format(s,[wcName,wcValue]);
end;

procedure TWhereClause.addInteger(wcName: String; wcValue: Integer);
var s: String;
begin
  s := ' and %0:S = %1:D ';
  Self.wcStr := Self.wcStr + Format(s,[wcName,wcValue]);

end;

procedure TWhereClause.addString(wcName, wcValue: String);
var s: String;
begin
  s := ' and %0:S = ''%1:S'' ';
  Self.wcStr := Self.wcStr + Format(s,[wcName,wcValue]);

end;

function TWhereClause.toStr: String;
begin
  if Self.wcStr <> '' then
    Self.wcStr := StringReplace(Self.wcStr,'and','where',[]);
  Result := Self.wcStr;
end;

end.
