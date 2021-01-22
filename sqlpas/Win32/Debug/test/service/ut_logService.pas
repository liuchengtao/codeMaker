unit ut_logService;

interface
 uses System.Generics.Collections,ut_logDao,utlog;
  Type
  t_logService = class
    private
       dao: t_logDao;
    public
      function getOneById(id: Integer): tlog;
      function update(entity: tlog): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tlog): TList<tlog>;
      constructor Create; override;
  end;
implementation

{ t_logService }
constructor t_logService.Create;
begin
  inherited Create;
  dao := t_logDao.Create;
end;

function t_logService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_logService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_logService.findList(entity:  tlog): TList< tlog>;
begin
  Result := dao.findList(entity);
end;

function t_logService.update(entity:  tlog): Integer;
begin
  Result := dao.update(enity);
end;

end.
