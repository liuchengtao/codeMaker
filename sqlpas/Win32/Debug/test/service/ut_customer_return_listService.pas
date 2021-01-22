unit ut_customer_return_listService;

interface
 uses System.Generics.Collections,ut_customer_return_listDao,utcustomerreturnlist;
  Type
  t_customer_return_listService = class
    private
       dao: t_customer_return_listDao;
    public
      function getOneById(id: Integer): tcustomerreturnlist;
      function update(entity: tcustomerreturnlist): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tcustomerreturnlist): TList<tcustomerreturnlist>;
      constructor Create; override;
  end;
implementation

{ t_customer_return_listService }
constructor t_customer_return_listService.Create;
begin
  inherited Create;
  dao := t_customer_return_listDao.Create;
end;

function t_customer_return_listService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_customer_return_listService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_customer_return_listService.findList(entity:  tcustomerreturnlist): TList< tcustomerreturnlist>;
begin
  Result := dao.findList(entity);
end;

function t_customer_return_listService.update(entity:  tcustomerreturnlist): Integer;
begin
  Result := dao.update(enity);
end;

end.
