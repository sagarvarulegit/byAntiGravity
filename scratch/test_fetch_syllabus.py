import requests

url = "https://ervvgjioggfxygtjlpts.supabase.co/rest/v1/subjects?select=id,name,code,description,thumbnail_url,chapters(id,title,sequence_number,description,lessons(id,title,type,video_hls_url,video_duration_seconds,note_content,is_free,sequence_number))"
headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Content-Type": "application/json"
}

r = requests.get(url, headers=headers)
data = r.json()
print("Subjects in response:")
for s in data:
    print(f"- {s['name']} (Chapters count: {len(s['chapters'])})")
    for c in s['chapters']:
        for l in c['lessons']:
            print(f"    - {l['title']}")
