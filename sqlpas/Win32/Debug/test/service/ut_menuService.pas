unit ut_menuService;

interface
 uses System.Generics.Collections,ut_menuDao,utmenu;
  Type
  t_menuService = class
    private
       dao: t_menuDao;
    public
      function getOneById(id: Integer): tmenu;
      function update(entity: tmenu): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tmenu): TList<tmenu>;
      constructor Create; override;
  end;
implementation

{ t_menuService }
constructor t_menuService.Create;
begin
  inherited Create;
  dao := t_menuDao.Create;
end;

function t_menuService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_menuService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_menuService.findList(entity:  tmenu): TList< tmenu>;
begin
  Result := dao.findList(entity);
end;

function t_menuService.update(entity:  tmenu): Integer;
begin
  Result := dao.update(enity);
end;

end.
