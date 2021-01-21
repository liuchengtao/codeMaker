unit utlog;
{这是注释}
interface
  type
    Rtlog = ^Ttlog;
    [Table('t_log','1314')]
    Ttlog = Record
          [FieldInfo('id','121313')]
    id: String;    [FieldInfo('content','')]
    content: String;    [FieldInfo('time','')]
    time: String;    [FieldInfo('type','')]
    type: String;    [FieldInfo('user_id','')]
    user_id: Integer;   
  end;
implementation