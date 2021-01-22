unit ut_role_menuService;

interface
 uses System.Generics.Collections,ut_role_menuDao,utrolemenu;
  Type
  t_role_menuService = class
    private
       dao: t_role_menuDao;
    public
      function getOneById(id: Integer): trolemenu;
      function update(entity: trolemenu): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: trolemenu): TList<trolemenu>;
      constructor Create; override;
  end;
implementation

{ t_role_menuService }
constructor t_role_menuService.Create;
begin
  inherited Create;
  dao := t_role_menuDao.Create;
end;

function t_role_menuService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_role_menuService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_role_menuService.findList(entity:  trolemenu): TList< trolemenu>;
begin
  Result := dao.findList(entity);
end;

function t_role_menuService.update(entity:  trolemenu): Integer;
begin
  Result := dao.update(enity);
end;

end.
