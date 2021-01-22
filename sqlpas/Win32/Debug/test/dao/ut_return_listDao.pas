unit ut_return_listDao;

interface
  uses SysUtils,utreturnlist,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_return_list';
        TABLE_COL = 'id,amount_paid,amount_payable,remarks,return_date,return_number,state,supplier_id,user_id,';
        TABLE_ADD_COL = 'amount_paid,amount_payable,remarks,return_date,return_number,state,supplier_id,user_id,';
  Type
   t_return_listDao = class
    public
    function add(entity: utreturnlist): Integer;  //新增 一条 id
    function updateById(entity: utreturnlist): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utreturnlist;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_return_listDao }

functiont_return_listDao.add(entity: utreturnlist): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.amount_paid,entity.amount_payable,entity.remarks,entity.return_date,entity.return_number,entity.state,entity.supplier_id,entity.user_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_return_listDao.deleteById(id: Integer): Integer;
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

function t_return_listDao.findList(entity: utreturnlist): TList<utreturnlist>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utreturnlist;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(amount_paid,entity.amount_paid)
.add(amount_payable,entity.amount_payable)
.add(remarks,entity.remarks)
.add(return_date,entity.return_date)
.add(return_number,entity.return_number)
.add(state,entity.state)
.add(supplier_id,entity.supplier_id)
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
entity.amount_paid := FieldByName(amount_paid).AsString;
entity.amount_payable := FieldByName(amount_payable).AsString;
entity.remarks := FieldByName(remarks).AsString;
entity.return_date := FieldByName(return_date).AsString;
entity.return_number := FieldByName(return_number).AsString;
entity.state := FieldByName(state).AsString;
entity.supplier_id := FieldByName(supplier_id).AsString;
entity.user_id := FieldByName(user_id).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_return_listDao.getOneById(id: Integer): utreturnlist;
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
entity.amount_paid := FieldByName(amount_paid).AsString;
entity.amount_payable := FieldByName(amount_payable).AsString;
entity.remarks := FieldByName(remarks).AsString;
entity.return_date := FieldByName(return_date).AsString;
entity.return_number := FieldByName(return_number).AsString;
entity.state := FieldByName(state).AsString;
entity.supplier_id := FieldByName(supplier_id).AsString;
entity.user_id := FieldByName(user_id).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_return_listDao.updateById(entity: utreturnlist): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.amount_paid,entity.amount_payable,entity.remarks,entity.return_date,entity.return_number,entity.state,entity.supplier_id,entity.user_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
