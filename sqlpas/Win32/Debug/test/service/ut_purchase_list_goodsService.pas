unit ut_purchase_list_goodsService;

interface
 uses System.Generics.Collections,ut_purchase_list_goodsDao,utpurchaselistgoods;
  Type
  t_purchase_list_goodsService = class
    private
       dao: t_purchase_list_goodsDao;
    public
      function getOneById(id: Integer): tpurchaselistgoods;
      function update(entity: tpurchaselistgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tpurchaselistgoods): TList<tpurchaselistgoods>;
      constructor Create; override;
  end;
implementation

{ t_purchase_list_goodsService }
constructor t_purchase_list_goodsService.Create;
begin
  inherited Create;
  dao := t_purchase_list_goodsDao.Create;
end;

function t_purchase_list_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_purchase_list_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_purchase_list_goodsService.findList(entity:  tpurchaselistgoods): TList< tpurchaselistgoods>;
begin
  Result := dao.findList(entity);
end;

function t_purchase_list_goodsService.update(entity:  tpurchaselistgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
