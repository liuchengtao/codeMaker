unit ut_return_listService;

interface
 uses System.Generics.Collections,ut_return_listDao,utreturnlist;
  Type
  t_return_listService = class
    private
       dao: t_return_listDao;
    public
      function getOneById(id: Integer): treturnlist;
      function update(entity: treturnlist): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: treturnlist): TList<treturnlist>;
      constructor Create; override;
  end;
implementation

{ t_return_listService }
constructor t_return_listService.Create;
begin
  inherited Create;
  dao := t_return_listDao.Create;
end;

function t_return_listService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_return_listService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_return_listService.findList(entity:  treturnlist): TList< treturnlist>;
begin
  Result := dao.findList(entity);
end;

function t_return_listService.update(entity:  treturnlist): Integer;
begin
  Result := dao.update(enity);
end;

end.
