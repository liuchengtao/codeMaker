unit uDao;

interface
  uses SysUtils,utdamagelist,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_damage_list';
        TABLE_COL = 'id,damage_date,damage_number,remarks,user_id,';
        TABLE_ADD_COL = 'damage_date,damage_number,remarks,user_id,';
  Type
   TDao = class
    public
    function add(entity: utdamagelist): Integer;  //新增 一条 id
    function updateById(entity: utdamagelist): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utdamagelist;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ TDao }

function TDao.add(entity: utdamagelist): Integer;
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

function TDao.findList(entity: utdamagelist): TList<utdamagelist>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utdamagelist;
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
.add(damage_date,entity.damage_date)
.add(damage_number,entity.damage_number)
.add(remarks,entity.remarks)
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
entity.damage_date := FieldByName(damage_date).AsString;
entity.damage_number := FieldByName(damage_number).AsString;
entity.remarks := FieldByName(remarks).AsString;
entity.user_id := FieldByName(user_id).AsString;

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

function TDao.getOneById(id: Integer): utdamagelist;
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
entity.damage_date := FieldByName(damage_date).AsString;
entity.damage_number := FieldByName(damage_number).AsString;
entity.remarks := FieldByName(remarks).AsString;
entity.user_id := FieldByName(user_id).AsString;

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

function TDao.updateById(entity: utdamagelist): Integer;
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