import requests

url = "https://ervvgjioggfxygtjlpts.supabase.co/rest/v1/lessons?select=id,title,type,note_content"
headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Content-Type": "application/json"
}

r = requests.get(url, headers=headers)
data = r.json()
print("Lessons in database with note_content status:")
for l in data:
    note = l.get('note_content')
    status = "NULL/None" if note is None else f"Length: {len(note)}"
    print(f"- {l['title']} ({l['type']}): {status}")
