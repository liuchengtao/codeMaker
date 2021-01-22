unit ut_menuDao;

interface
  uses SysUtils,utmenu,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_menu';
        TABLE_COL = 'id,icon,name,state,url,p_id,';
        TABLE_ADD_COL = 'icon,name,state,url,p_id,';
  Type
   t_menuDao = class
    public
    function add(entity: utmenu): Integer;  //新增 一条 id
    function updateById(entity: utmenu): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utmenu;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_menuDao }

functiont_menuDao.add(entity: utmenu): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.icon,entity.name,entity.state,entity.url,entity.p_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_menuDao.deleteById(id: Integer): Integer;
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

function t_menuDao.findList(entity: utmenu): TList<utmenu>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utmenu;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(icon,entity.icon)
.add(name,entity.name)
.add(state,entity.state)
.add(url,entity.url)
.add(p_id,entity.p_id)

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
entity.icon := FieldByName(icon).AsString;
entity.name := FieldByName(name).AsString;
entity.state := FieldByName(state).AsString;
entity.url := FieldByName(url).AsString;
entity.p_id := FieldByName(p_id).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_menuDao.getOneById(id: Integer): utmenu;
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
entity.icon := FieldByName(icon).AsString;
entity.name := FieldByName(name).AsString;
entity.state := FieldByName(state).AsString;
entity.url := FieldByName(url).AsString;
entity.p_id := FieldByName(p_id).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_menuDao.updateById(entity: utmenu): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.icon,entity.name,entity.state,entity.url,entity.p_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
