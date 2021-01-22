unit ut_logDao;

interface
  uses SysUtils,utlog,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_log';
        TABLE_COL = 'id,content,time,type,user_id,';
        TABLE_ADD_COL = 'content,time,type,user_id,';
  Type
   t_logDao = class
    public
    function add(entity: utlog): Integer;  //新增 一条 id
    function updateById(entity: utlog): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utlog;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_logDao }

functiont_logDao.add(entity: utlog): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.content,entity.time,entity.type,entity.user_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_logDao.deleteById(id: Integer): Integer;
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

function t_logDao.findList(entity: utlog): TList<utlog>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utlog;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(content,entity.content)
.add(time,entity.time)
.add(type,entity.type)
.add(user_id,entity.user_id)

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
entity.content := FieldByName(content).AsString;
entity.time := FieldByName(time).AsString;
entity.type := FieldByName(type).AsString;
entity.user_id := FieldByName(user_id).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_logDao.getOneById(id: Integer): utlog;
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
entity.content := FieldByName(content).AsString;
entity.time := FieldByName(time).AsString;
entity.type := FieldByName(type).AsString;
entity.user_id := FieldByName(user_id).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_logDao.updateById(entity: utlog): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.content,entity.time,entity.type,entity.user_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
