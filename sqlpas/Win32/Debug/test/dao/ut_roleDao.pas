unit ut_roleDao;

interface
  uses SysUtils,utrole,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_role';
        TABLE_COL = 'id,bz,name,remarks,';
        TABLE_ADD_COL = 'bz,name,remarks,';
  Type
   t_roleDao = class
    public
    function add(entity: utrole): Integer;  //新增 一条 id
    function updateById(entity: utrole): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utrole;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_roleDao }

functiont_roleDao.add(entity: utrole): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.bz,entity.name,entity.remarks,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_roleDao.deleteById(id: Integer): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set del_flag = 0 where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,id]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_roleDao.findList(entity: utrole): TList<utrole>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utrole;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(bz,entity.bz)
.add(name,entity.name)
.add(remarks,entity.remarks)

    wcStr := wc.toStr;
    wc.Free;
    sqlStr := 'select %0:S from %1:S %2:S';
    sqlStr := Format(sqlStr,[TABLE_COL,TABLE_NAME,wcStr]);
    qry := BaseDM.OpenSQL(sqlStr);
    if qry.RecordCount <= 0 then exit;
    with qry do
    begin
      First;
      while not Eof do
      begin
        New(entity1);
          entity.id := FieldByName(id).AsString;
entity.bz := FieldByName(bz).AsString;
entity.name := FieldByName(name).AsString;
entity.remarks := FieldByName(remarks).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_roleDao.getOneById(id: Integer): utrole;
var sqlStr: String;
   qry: TFDQuery;
begin
  New(Result);
  Try
    sqlStr := 'select %0:S from %1:S where id = %2:D';
    sqlStr := Format(sqlStr,[TABLE_COL,TABLE_NAME,id]);
    qry := BaseDM.OpenSQL(sqlStr);
    if qry.RecordCount <= 0 then exit;
    with qry do
    begin
      entity.id := FieldByName(id).AsString;
entity.bz := FieldByName(bz).AsString;
entity.name := FieldByName(name).AsString;
entity.remarks := FieldByName(remarks).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_roleDao.updateById(entity: utrole): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.bz,entity.name,entity.remarks,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
