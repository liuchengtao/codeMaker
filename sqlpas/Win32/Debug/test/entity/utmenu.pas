unit utmenu;
{这是注释}
interface
  type
    Rtmenu = ^Ttmenu;
    [Table('t_menu','')]
    Ttmenu = Record
          [FieldInfo('id','')]
    id: String;
    icon: String;
    name: String;
    state: Integer;
    url: String;
    p_id: Integer;   
  end;
implementation