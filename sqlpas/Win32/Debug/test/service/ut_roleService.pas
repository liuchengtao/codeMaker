unit ut_roleService;

interface
 uses System.Generics.Collections,ut_roleDao,utrole;
  Type
  t_roleService = class
    private
       dao: t_roleDao;
    public
      function getOneById(id: Integer): trole;
      function update(entity: trole): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: trole): TList<trole>;
      constructor Create; override;
  end;
implementation

{ t_roleService }
constructor t_roleService.Create;
begin
  inherited Create;
  dao := t_roleDao.Create;
end;

function t_roleService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_roleService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_roleService.findList(entity:  trole): TList< trole>;
begin
  Result := dao.findList(entity);
end;

function t_roleService.update(entity:  trole): Integer;
begin
  Result := dao.update(enity);
end;

end.
