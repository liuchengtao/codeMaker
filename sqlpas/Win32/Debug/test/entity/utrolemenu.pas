unit utrolemenu;
{这是注释}
interface
  type
    Rtrolemenu = ^Ttrolemenu;
    [Table('t_role_menu','')]
    Ttrolemenu = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('menu_id','')]
    menu_id: Integer;    [FieldInfo('role_id','')]
    role_id: Integer;   
  end;
implementation