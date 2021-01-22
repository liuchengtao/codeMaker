unit ut_role_menuDao;

interface
  uses SysUtils,utrolemenu,System.Generics.Collections,FireDAC.Comp.Client,uBaseDM;
  const TABLE_NAME = 't_role_menu';
        TABLE_COL = 'id,menu_id,role_id,';
        TABLE_ADD_COL = 'menu_id,role_id,';
  Type
   t_role_menuDao = class
    public
    function add(entity: utrolemenu): Integer;  //新增 一条 id
    function updateById(entity: utrolemenu): Integer;  //修改一条记录 By id
    function deleteById(id: Integer): Integer;   //删除一条记录 By id
    function getOneById(id: Integer): RTest;     //获取一条记录 By id
    function findList(entity: TTest): TList<utrolemenu;
  end;
implementation
uses System.Json,System.JSON.Builders;
{ t_role_menuDao }

functiont_role_menuDao.add(entity: utrolemenu): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'insert into %0:S(%1:S) Values ({SQL_ADD_COL});';
    sqlStr := Format(sqlStr,[TABLE_NAME,TABLE_ADD_COL,entity.id,entity.menu_id,entity.role_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;
end;

function t_role_menuDao.deleteById(id: Integer): Integer;
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

function t_role_menuDao.findList(entity: utrolemenu): TList<utrolemenu>;
var wc: TWhereClause;
   sqlStr,wcStr: String;
   qry: TFDQuery;
   entity1: utrolemenu;
begin
    Result := TList<RTest>.Create;
    wc := TWhereClause.Create
      .add(id,entity.id)
.add(menu_id,entity.menu_id)
.add(role_id,entity.role_id)

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
entity.menu_id := FieldByName(menu_id).AsString;
entity.role_id := FieldByName(role_id).AsString;

        Result.Add(entity1);
        Next;
      end;
    end;
    qry.Free;
end;

function t_role_menuDao.getOneById(id: Integer): utrolemenu;
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
entity.menu_id := FieldByName(menu_id).AsString;
entity.role_id := FieldByName(role_id).AsString;

    end;
    qry.Free;
  except
    qry.Free;
  End;
end;

function t_role_menuDao.updateById(entity: utrolemenu): Integer;
var sqlStr: String;
begin
  Result := -1;
  Try
    sqlStr := 'update %0:S set {SQL_UPDATE_VALUE} where id = %1:D';
    sqlStr := Format(sqlStr,[TABLE_NAME,entity.id,entity.menu_id,entity.role_id,]);
    Result := BaseDM.ExecSQL(sqlStr);
  Except
    Result := -1;
  End;

end;

end.
