unit ut_damage_listService;

interface
 uses System.Generics.Collections,ut_damage_listDao,utdamagelist;
  Type
  t_damage_listService = class
    private
       dao: t_damage_listDao;
    public
      function getOneById(id: Integer): tdamagelist;
      function update(entity: tdamagelist): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tdamagelist): TList<tdamagelist>;
      constructor Create; override;
  end;
implementation

{ t_damage_listService }
constructor t_damage_listService.Create;
begin
  inherited Create;
  dao := t_damage_listDao.Create;
end;

function t_damage_listService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_damage_listService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_damage_listService.findList(entity:  tdamagelist): TList< tdamagelist>;
begin
  Result := dao.findList(entity);
end;

function t_damage_listService.update(entity:  tdamagelist): Integer;
begin
  Result := dao.update(enity);
end;

end.
