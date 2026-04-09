# 1) Given number of minutes, convert it into human readable form.
def convert_minutes(minutes):
    hours=minutes//60
    mins=minutes%60
    if hours==0:
        return f"{mins} mintues"
    elif hours==1:
        return f"{hours} hr {mins} minutes"
    else:
        return f"{hours} hr {mins} minutes"
    
print(convert_minutes(130))
print(convert_minutes(110))