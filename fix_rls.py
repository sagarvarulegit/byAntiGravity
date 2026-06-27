import re
content = open('db/rls_policies.sql').read()
content = re.sub(r'USING \(auth\.role\(\) = \'authenticated\'\);', r'USING (TRUE);', content)
open('db/rls_policies.sql', 'w').write(content)
