unit ut_user_roleService;

interface
 uses System.Generics.Collections,ut_user_roleDao,utuserrole;
  Type
  t_user_roleService = class
    private
       dao: t_user_roleDao;
    public
      function getOneById(id: Integer): tuserrole;
      function update(entity: tuserrole): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tuserrole): TList<tuserrole>;
      constructor Create; override;
  end;
implementation

{ t_user_roleService }
constructor t_user_roleService.Create;
begin
  inherited Create;
  dao := t_user_roleDao.Create;
end;

function t_user_roleService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_user_roleService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_user_roleService.findList(entity:  tuserrole): TList< tuserrole>;
begin
  Result := dao.findList(entity);
end;

function t_user_roleService.update(entity:  tuserrole): Integer;
begin
  Result := dao.update(enity);
end;

end.
