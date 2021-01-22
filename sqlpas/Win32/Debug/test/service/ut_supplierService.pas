unit ut_supplierService;

interface
 uses System.Generics.Collections,ut_supplierDao,utsupplier;
  Type
  t_supplierService = class
    private
       dao: t_supplierDao;
    public
      function getOneById(id: Integer): tsupplier;
      function update(entity: tsupplier): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tsupplier): TList<tsupplier>;
      constructor Create; override;
  end;
implementation

{ t_supplierService }
constructor t_supplierService.Create;
begin
  inherited Create;
  dao := t_supplierDao.Create;
end;

function t_supplierService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_supplierService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_supplierService.findList(entity:  tsupplier): TList< tsupplier>;
begin
  Result := dao.findList(entity);
end;

function t_supplierService.update(entity:  tsupplier): Integer;
begin
  Result := dao.update(enity);
end;

end.
