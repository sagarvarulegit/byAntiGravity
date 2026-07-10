import requests

tables = ["subjects", "chapters", "lessons", "users"]
headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I"
}

for table in tables:
    url = f"https://ervvgjioggfxygtjlpts.supabase.co/rest/v1/{table}?select=*"
    try:
        response = requests.get(url, headers=headers)
        print(f"Table: {table:12} | Status: {response.status_code} | Count: {len(response.json()) if response.status_code == 200 else 'Error'}")
        if response.status_code == 200 and len(response.json()) > 0:
            print(f"Sample data from {table}: {response.json()[0]}")
    except Exception as e:
        print(f"Error querying {table}: {e}")
