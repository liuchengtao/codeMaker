unit ut_purchase_listService;

interface
 uses System.Generics.Collections,ut_purchase_listDao,utpurchaselist;
  Type
  t_purchase_listService = class
    private
       dao: t_purchase_listDao;
    public
      function getOneById(id: Integer): tpurchaselist;
      function update(entity: tpurchaselist): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tpurchaselist): TList<tpurchaselist>;
      constructor Create; override;
  end;
implementation

{ t_purchase_listService }
constructor t_purchase_listService.Create;
begin
  inherited Create;
  dao := t_purchase_listDao.Create;
end;

function t_purchase_listService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_purchase_listService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_purchase_listService.findList(entity:  tpurchaselist): TList< tpurchaselist>;
begin
  Result := dao.findList(entity);
end;

function t_purchase_listService.update(entity:  tpurchaselist): Integer;
begin
  Result := dao.update(enity);
end;

end.
