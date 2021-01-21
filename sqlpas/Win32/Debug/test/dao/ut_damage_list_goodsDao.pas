unit uDao;

interface
  uses SysUtils,utdamagelistgoods,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_damage_list_goods';
        TABLE_COL = 'id,code,model,name,num,price,total,unit,damage_list_id,type_id,goods_id,';
        TABLE_ADD_COL = 'code,model,name,num,price,total,unit,damage_list_id,type_id,goods_id,';
  Type
   TDao = class
    public
    function add(entity: utdamagelistgoods): Integer;  //新增 一条 id
    function updateById(entity: utdamagelistgoods): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utdamagelistgoods;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ TDao }

function TDao.add(entity: utdamagelistgoods): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.name,entity.age,entity.bz,entity.address]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function TDao.deleteById(id: Integer): Integer;
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

function TDao.findList(entity: utdamagelistgoods): TList<utdamagelistgoods>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utdamagelistgoods;
begin
//    wc := TWhereClause.Create
//          .add('id',entity.id)
//          .add('name',entity.name)
//          .add('age',entity.age)
//          .add('bz',entity.bz)
//          .add('address',entity.address);
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(code,entity.code)
.add(model,entity.model)
.add(name,entity.name)
.add(num,entity.num)
.add(price,entity.price)
.add(total,entity.total)
.add(unit,entity.unit)
.add(damage_list_id,entity.damage_list_id)
.add(type_id,entity.type_id)
.add(goods_id,entity.goods_id)

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
entity.model := FieldByName(model).AsString;
entity.name := FieldByName(name).AsString;
entity.num := FieldByName(num).AsString;
entity.price := FieldByName(price).AsString;
entity.total := FieldByName(total).AsString;
entity.unit := FieldByName(unit).AsString;
entity.damage_list_id := FieldByName(damage_list_id).AsString;
entity.type_id := FieldByName(type_id).AsString;
entity.goods_id := FieldByName(goods_id).AsString;

//        test.id := FieldByName('id').AsInteger;
//        test.name := FieldByName('name').AsString;
//        test.age := FieldByName('age').AsInteger;
//        test.bz := FieldByName('bz').AsString;
//        test.address := FieldByName('address').AsString;
        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function TDao.getOneById(id: Integer): utdamagelistgoods;
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
entity.model := FieldByName(model).AsString;
entity.name := FieldByName(name).AsString;
entity.num := FieldByName(num).AsString;
entity.price := FieldByName(price).AsString;
entity.total := FieldByName(total).AsString;
entity.unit := FieldByName(unit).AsString;
entity.damage_list_id := FieldByName(damage_list_id).AsString;
entity.type_id := FieldByName(type_id).AsString;
entity.goods_id := FieldByName(goods_id).AsString;

//      Result.id := FieldByName('id').AsInteger;
//      Result.name := FieldByName('name').AsString;
//      Result.age := FieldByName('age').AsInteger;
//      Result.bz := FieldByName('bz').AsString;
//      Result.address := FieldByName('address').AsString;
    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function TDao.updateById(entity: utdamagelistgoods): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.name,entity.age,entity.age,entity.address]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
