unit ut_customerService;

interface
 uses System.Generics.Collections,ut_customerDao,utcustomer;
  Type
  t_customerService = class
    private
       dao: t_customerDao;
    public
      function getOneById(id: Integer): tcustomer;
      function update(entity: tcustomer): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tcustomer): TList<tcustomer>;
      constructor Create; override;
  end;
implementation

{ t_customerService }
constructor t_customerService.Create;
begin
  inherited Create;
  dao := t_customerDao.Create;
end;

function t_customerService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_customerService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_customerService.findList(entity:  tcustomer): TList< tcustomer>;
begin
  Result := dao.findList(entity);
end;

function t_customerService.update(entity:  tcustomer): Integer;
begin
  Result := dao.update(enity);
end;

end.
