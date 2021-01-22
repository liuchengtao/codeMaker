unit ut_damage_list_goodsService;

interface
 uses System.Generics.Collections,ut_damage_list_goodsDao,utdamagelistgoods;
  Type
  t_damage_list_goodsService = class
    private
       dao: t_damage_list_goodsDao;
    public
      function getOneById(id: Integer): tdamagelistgoods;
      function update(entity: tdamagelistgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tdamagelistgoods): TList<tdamagelistgoods>;
      constructor Create; override;
  end;
implementation

{ t_damage_list_goodsService }
constructor t_damage_list_goodsService.Create;
begin
  inherited Create;
  dao := t_damage_list_goodsDao.Create;
end;

function t_damage_list_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_damage_list_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_damage_list_goodsService.findList(entity:  tdamagelistgoods): TList< tdamagelistgoods>;
begin
  Result := dao.findList(entity);
end;

function t_damage_list_goodsService.update(entity:  tdamagelistgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
