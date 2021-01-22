unit ut_customerDao;

interface
  uses SysUtils,utcustomer,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_customer';
        TABLE_COL = 'id,address,contact,name,number,remarks,';
        TABLE_ADD_COL = 'address,contact,name,number,remarks,';
  Type
   t_customerDao = class
    public
    function add(entity: utcustomer): Integer;  //新增 一条 id
    function updateById(entity: utcustomer): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utcustomer;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_customerDao }

functiont_customerDao.add(entity: utcustomer): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.address,entity.contact,entity.name,entity.number,entity.remarks,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_customerDao.deleteById(id: Integer): Integer;
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

function t_customerDao.findList(entity: utcustomer): TList<utcustomer>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utcustomer;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(address,entity.address)
.add(contact,entity.contact)
.add(name,entity.name)
.add(number,entity.number)
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
entity.address := FieldByName(address).AsString;
entity.contact := FieldByName(contact).AsString;
entity.name := FieldByName(name).AsString;
entity.number := FieldByName(number).AsString;
entity.remarks := FieldByName(remarks).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_customerDao.getOneById(id: Integer): utcustomer;
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
entity.address := FieldByName(address).AsString;
entity.contact := FieldByName(contact).AsString;
entity.name := FieldByName(name).AsString;
entity.number := FieldByName(number).AsString;
entity.remarks := FieldByName(remarks).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_customerDao.updateById(entity: utcustomer): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.address,entity.contact,entity.name,entity.number,entity.remarks,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
