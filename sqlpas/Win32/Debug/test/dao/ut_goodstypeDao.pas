unit ut_goodstypeDao;

interface
  uses SysUtils,utgoodstype,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_goodstype';
        TABLE_COL = 'id,name,p_id,state,icon,';
        TABLE_ADD_COL = 'name,p_id,state,icon,';
  Type
   t_goodstypeDao = class
    public
    function add(entity: utgoodstype): Integer;  //新增 一条 id
    function updateById(entity: utgoodstype): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utgoodstype;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_goodstypeDao }

functiont_goodstypeDao.add(entity: utgoodstype): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.name,entity.p_id,entity.state,entity.icon,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_goodstypeDao.deleteById(id: Integer): Integer;
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

function t_goodstypeDao.findList(entity: utgoodstype): TList<utgoodstype>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utgoodstype;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(name,entity.name)
.add(p_id,entity.p_id)
.add(state,entity.state)
.add(icon,entity.icon)

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
entity.name := FieldByName(name).AsString;
entity.p_id := FieldByName(p_id).AsString;
entity.state := FieldByName(state).AsString;
entity.icon := FieldByName(icon).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_goodstypeDao.getOneById(id: Integer): utgoodstype;
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
entity.name := FieldByName(name).AsString;
entity.p_id := FieldByName(p_id).AsString;
entity.state := FieldByName(state).AsString;
entity.icon := FieldByName(icon).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_goodstypeDao.updateById(entity: utgoodstype): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.name,entity.p_id,entity.state,entity.icon,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
