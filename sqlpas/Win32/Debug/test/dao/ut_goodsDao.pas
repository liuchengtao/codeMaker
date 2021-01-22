unit ut_goodsDao;

interface
  uses SysUtils,utgoods,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_goods';
        TABLE_COL = 'id,code,inventory_quantity,min_num,model,name,producer,purchasing_price,remarks,selling_price,unit,type_id,state,last_purchasing_price,';
        TABLE_ADD_COL = 'code,inventory_quantity,min_num,model,name,producer,purchasing_price,remarks,selling_price,unit,type_id,state,last_purchasing_price,';
  Type
   t_goodsDao = class
    public
    function add(entity: utgoods): Integer;  //新增 一条 id
    function updateById(entity: utgoods): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utgoods;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_goodsDao }

functiont_goodsDao.add(entity: utgoods): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.code,entity.inventory_quantity,entity.min_num,entity.model,entity.name,entity.producer,entity.purchasing_price,entity.remarks,entity.selling_price,entity.unit,entity.type_id,entity.state,entity.last_purchasing_price,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_goodsDao.deleteById(id: Integer): Integer;
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

function t_goodsDao.findList(entity: utgoods): TList<utgoods>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utgoods;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(code,entity.code)
.add(inventory_quantity,entity.inventory_quantity)
.add(min_num,entity.min_num)
.add(model,entity.model)
.add(name,entity.name)
.add(producer,entity.producer)
.add(purchasing_price,entity.purchasing_price)
.add(remarks,entity.remarks)
.add(selling_price,entity.selling_price)
.add(unit,entity.unit)
.add(type_id,entity.type_id)
.add(state,entity.state)
.add(last_purchasing_price,entity.last_purchasing_price)

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
entity.code := FieldByName(code).AsString;
entity.inventory_quantity := FieldByName(inventory_quantity).AsString;
entity.min_num := FieldByName(min_num).AsString;
entity.model := FieldByName(model).AsString;
entity.name := FieldByName(name).AsString;
entity.producer := FieldByName(producer).AsString;
entity.purchasing_price := FieldByName(purchasing_price).AsString;
entity.remarks := FieldByName(remarks).AsString;
entity.selling_price := FieldByName(selling_price).AsString;
entity.unit := FieldByName(unit).AsString;
entity.type_id := FieldByName(type_id).AsString;
entity.state := FieldByName(state).AsString;
entity.last_purchasing_price := FieldByName(last_purchasing_price).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_goodsDao.getOneById(id: Integer): utgoods;
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
entity.code := FieldByName(code).AsString;
entity.inventory_quantity := FieldByName(inventory_quantity).AsString;
entity.min_num := FieldByName(min_num).AsString;
entity.model := FieldByName(model).AsString;
entity.name := FieldByName(name).AsString;
entity.producer := FieldByName(producer).AsString;
entity.purchasing_price := FieldByName(purchasing_price).AsString;
entity.remarks := FieldByName(remarks).AsString;
entity.selling_price := FieldByName(selling_price).AsString;
entity.unit := FieldByName(unit).AsString;
entity.type_id := FieldByName(type_id).AsString;
entity.state := FieldByName(state).AsString;
entity.last_purchasing_price := FieldByName(last_purchasing_price).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_goodsDao.updateById(entity: utgoods): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.code,entity.inventory_quantity,entity.min_num,entity.model,entity.name,entity.producer,entity.purchasing_price,entity.remarks,entity.selling_price,entity.unit,entity.type_id,entity.state,entity.last_purchasing_price,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
