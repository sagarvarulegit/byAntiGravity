import os
import re
import glob

def fix_uuid(match):
    full_uuid = match.group(0)
    parts = full_uuid.split('-')
    last_part = parts[-1]
    
    if len(last_part) == 12:
        return full_uuid
    elif len(last_part) > 12:
        # truncate from the beginning of the last part
        diff = len(last_part) - 12
        parts[-1] = last_part[diff:]
    else:
        # pad with zeros
        diff = 12 - len(last_part)
        parts[-1] = ('0' * diff) + last_part
        
    return '-'.join(parts)

uuid_pattern = re.compile(r'\b[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]+\b')

for filepath in glob.glob("db/*.sql"):
    with open(filepath, "r") as f:
        content = f.read()
        
    new_content = uuid_pattern.sub(fix_uuid, content)
    
    if new_content != content:
        print(f"Fixed UUIDs in {filepath}")
        with open(filepath, "w") as f:
            f.write(new_content)
