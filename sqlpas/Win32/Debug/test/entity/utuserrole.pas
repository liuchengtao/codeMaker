unit utuserrole;
{这是注释}
interface
  type
    Rtuserrole = ^Ttuserrole;
    [Table('t_user_role','')]
    Ttuserrole = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('role_id','')]
    role_id: Integer;    [FieldInfo('user_id','')]
    user_id: Integer;   
  end;
implementation