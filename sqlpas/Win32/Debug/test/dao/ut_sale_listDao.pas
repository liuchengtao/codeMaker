unit ut_sale_listDao;

interface
  uses SysUtils,utsalelist,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_sale_list';
        TABLE_COL = 'id,amount_paid,amount_payable,remarks,sale_date,sale_number,state,user_id,customer_id,';
        TABLE_ADD_COL = 'amount_paid,amount_payable,remarks,sale_date,sale_number,state,user_id,customer_id,';
  Type
   t_sale_listDao = class
    public
    function add(entity: utsalelist): Integer;  //新增 一条 id
    function updateById(entity: utsalelist): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utsalelist;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_sale_listDao }

functiont_sale_listDao.add(entity: utsalelist): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.amount_paid,entity.amount_payable,entity.remarks,entity.sale_date,entity.sale_number,entity.state,entity.user_id,entity.customer_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_sale_listDao.deleteById(id: Integer): Integer;
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

function t_sale_listDao.findList(entity: utsalelist): TList<utsalelist>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utsalelist;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(amount_paid,entity.amount_paid)
.add(amount_payable,entity.amount_payable)
.add(remarks,entity.remarks)
.add(sale_date,entity.sale_date)
.add(sale_number,entity.sale_number)
.add(state,entity.state)
.add(user_id,entity.user_id)
.add(customer_id,entity.customer_id)

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
entity.sale_date := FieldByName(sale_date).AsString;
entity.sale_number := FieldByName(sale_number).AsString;
entity.state := FieldByName(state).AsString;
entity.user_id := FieldByName(user_id).AsString;
entity.customer_id := FieldByName(customer_id).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_sale_listDao.getOneById(id: Integer): utsalelist;
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
entity.sale_date := FieldByName(sale_date).AsString;
entity.sale_number := FieldByName(sale_number).AsString;
entity.state := FieldByName(state).AsString;
entity.user_id := FieldByName(user_id).AsString;
entity.customer_id := FieldByName(customer_id).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_sale_listDao.updateById(entity: utsalelist): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.amount_paid,entity.amount_payable,entity.remarks,entity.sale_date,entity.sale_number,entity.state,entity.user_id,entity.customer_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
