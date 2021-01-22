unit ut_userDao;

interface
  uses SysUtils,utuser,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_user';
        TABLE_COL = 'id,bz,password,true_name,user_name,remarks,';
        TABLE_ADD_COL = 'bz,password,true_name,user_name,remarks,';
  Type
   t_userDao = class
    public
    function add(entity: utuser): Integer;  //新增 一条 id
    function updateById(entity: utuser): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utuser;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_userDao }

functiont_userDao.add(entity: utuser): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.bz,entity.password,entity.true_name,entity.user_name,entity.remarks,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_userDao.deleteById(id: Integer): Integer;
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

function t_userDao.findList(entity: utuser): TList<utuser>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utuser;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(bz,entity.bz)
.add(password,entity.password)
.add(true_name,entity.true_name)
.add(user_name,entity.user_name)
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
entity.password := FieldByName(password).AsString;
entity.true_name := FieldByName(true_name).AsString;
entity.user_name := FieldByName(user_name).AsString;
entity.remarks := FieldByName(remarks).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_userDao.getOneById(id: Integer): utuser;
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
entity.password := FieldByName(password).AsString;
entity.true_name := FieldByName(true_name).AsString;
entity.user_name := FieldByName(user_name).AsString;
entity.remarks := FieldByName(remarks).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_userDao.updateById(entity: utuser): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.bz,entity.password,entity.true_name,entity.user_name,entity.remarks,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
