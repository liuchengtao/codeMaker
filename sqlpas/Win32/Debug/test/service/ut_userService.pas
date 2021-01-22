unit ut_userService;

interface
 uses System.Generics.Collections,ut_userDao,utuser;
  Type
  t_userService = class
    private
       dao: t_userDao;
    public
      function getOneById(id: Integer): tuser;
      function update(entity: tuser): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tuser): TList<tuser>;
      constructor Create; override;
  end;
implementation

{ t_userService }
constructor t_userService.Create;
begin
  inherited Create;
  dao := t_userDao.Create;
end;

function t_userService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_userService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_userService.findList(entity:  tuser): TList< tuser>;
begin
  Result := dao.findList(entity);
end;

function t_userService.update(entity:  tuser): Integer;
begin
  Result := dao.update(enity);
end;

end.
