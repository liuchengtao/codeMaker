unit ut_customer_return_list_goodsService;

interface
 uses System.Generics.Collections,ut_customer_return_list_goodsDao,utcustomerreturnlistgoods;
  Type
  t_customer_return_list_goodsService = class
    private
       dao: t_customer_return_list_goodsDao;
    public
      function getOneById(id: Integer): tcustomerreturnlistgoods;
      function update(entity: tcustomerreturnlistgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tcustomerreturnlistgoods): TList<tcustomerreturnlistgoods>;
      constructor Create; override;
  end;
implementation

{ t_customer_return_list_goodsService }
constructor t_customer_return_list_goodsService.Create;
begin
  inherited Create;
  dao := t_customer_return_list_goodsDao.Create;
end;

function t_customer_return_list_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_customer_return_list_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_customer_return_list_goodsService.findList(entity:  tcustomerreturnlistgoods): TList< tcustomerreturnlistgoods>;
begin
  Result := dao.findList(entity);
end;

function t_customer_return_list_goodsService.update(entity:  tcustomerreturnlistgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
