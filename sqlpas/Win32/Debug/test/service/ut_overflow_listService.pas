unit ut_overflow_listService;

interface
 uses System.Generics.Collections,ut_overflow_listDao,utoverflowlist;
  Type
  t_overflow_listService = class
    private
       dao: t_overflow_listDao;
    public
      function getOneById(id: Integer): toverflowlist;
      function update(entity: toverflowlist): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: toverflowlist): TList<toverflowlist>;
      constructor Create; override;
  end;
implementation

{ t_overflow_listService }
constructor t_overflow_listService.Create;
begin
  inherited Create;
  dao := t_overflow_listDao.Create;
end;

function t_overflow_listService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_overflow_listService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_overflow_listService.findList(entity:  toverflowlist): TList< toverflowlist>;
begin
  Result := dao.findList(entity);
end;

function t_overflow_listService.update(entity:  toverflowlist): Integer;
begin
  Result := dao.update(enity);
end;

end.
