unit utoverflowlist;
{这是注释}
interface
  type
    Rtoverflowlist = ^Ttoverflowlist;
    [Table('t_overflow_list','')]
    Ttoverflowlist = Record
          [FieldInfo('id','')]
    id: String;
    overflow_date: String;
    overflow_number: String;
    remarks: String;
    user_id: Integer;   
  end;
implementation