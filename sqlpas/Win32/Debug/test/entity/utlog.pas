unit utlog;
{这是注释}
interface
  type
    Rtlog = ^Ttlog;
    [Table('t_log','1314')]
    Ttlog = Record
          [FieldInfo('id','121313')]
    id: String;
    content: String;
    time: String;
    type: String;
    user_id: Integer;   
  end;
implementation