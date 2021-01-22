unit ut_sale_listService;

interface
 uses System.Generics.Collections,ut_sale_listDao,utsalelist;
  Type
  t_sale_listService = class
    private
       dao: t_sale_listDao;
    public
      function getOneById(id: Integer): tsalelist;
      function update(entity: tsalelist): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tsalelist): TList<tsalelist>;
      constructor Create; override;
  end;
implementation

{ t_sale_listService }
constructor t_sale_listService.Create;
begin
  inherited Create;
  dao := t_sale_listDao.Create;
end;

function t_sale_listService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_sale_listService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_sale_listService.findList(entity:  tsalelist): TList< tsalelist>;
begin
  Result := dao.findList(entity);
end;

function t_sale_listService.update(entity:  tsalelist): Integer;
begin
  Result := dao.update(enity);
end;

end.
