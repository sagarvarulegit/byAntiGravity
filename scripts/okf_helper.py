#!/usr/bin/env python3
import os
import re
import sys
import json
from datetime import datetime, timezone

# Simple YAML parser for OKF frontmatter
def parse_frontmatter(content):
    match = re.match(r'^---\s*\n(.*?)\n---\s*\n', content, re.DOTALL)
    if not match:
        return None, content
    
    yaml_text = match.group(1)
    body = content[match.end():]
    
    metadata = {}
    for line in yaml_text.split('\n'):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        if ':' in line:
            key, val = line.split(':', 1)
            key = key.strip()
            val = val.strip()
            # Simple list parsing for tags: [a, b, c]
            if val.startswith('[') and val.endswith(']'):
                val = [item.strip().strip('"').strip("'") for item in val[1:-1].split(',') if item.strip()]
            else:
                val = val.strip('"').strip("'")
            metadata[key] = val
    return metadata, body

def serialize_frontmatter(metadata):
    lines = ["---"]
    # Ensure type is first
    if 'type' in metadata:
        lines.append(f"type: {metadata['type']}")
    for k, v in metadata.items():
        if k == 'type':
            continue
        if isinstance(v, list):
            tags_str = ", ".join(v)
            lines.append(f"{k}: [{tags_str}]")
        else:
            lines.append(f"{k}: {v}")
    lines.append("---\n")
    return "\n".join(lines)

def extract_title_and_description(body, filepath):
    # Try to find the first H1 header for title
    title = os.path.basename(filepath)
    h1_match = re.search(r'^#\s+(.+)$', body, re.MULTILINE)
    if h1_match:
        title = h1_match.group(1).strip()
    
    # Try to find the first paragraph after title for description
    description = ""
    # Strip headers, empty lines, and grab the first non-empty text paragraph
    lines = [line.strip() for line in body.split('\n') if line.strip()]
    for line in lines:
        if not line.startswith('#') and not line.startswith('-') and not line.startswith('*'):
            description = line[:150] + "..." if len(line) > 150 else line
            break
            
    return title, description

def find_links(body, current_dir, root_dir):
    # Matches standard markdown links [text](path)
    links = re.findall(r'\[([^\]]+)\]\(([^)]+)\)', body)
    resolved_paths = []
    for text, path in links:
        # Ignore external links or anchor links
        if path.startswith('http://') or path.startswith('https://') or path.startswith('#') or path.startswith('mailto:'):
            continue
        
        # Resolve relative path
        abs_target = os.path.normpath(os.path.join(current_dir, path.split('#')[0]))
        if abs_target.endswith('.md') and os.path.exists(abs_target):
            rel_to_root = os.path.relpath(abs_target, root_dir)
            resolved_paths.append(rel_to_root)
    return resolved_paths

def main():
    if len(sys.argv) < 2:
        print("Usage: okf_helper.py [validate | init | index | graph] [dir]")
        sys.exit(1)
        
    cmd = sys.argv[1]
    docs_dir = sys.argv[2] if len(sys.argv) > 2 else "docs"
    docs_dir = os.path.abspath(docs_dir)
    
    if not os.path.exists(docs_dir):
        print(f"Error: Directory {docs_dir} does not exist.")
        sys.exit(1)
        
    if cmd == "validate":
        invalid_files = []
        valid_count = 0
        total_count = 0
        
        for root, _, files in os.walk(docs_dir):
            for file in files:
                if not file.endswith('.md') or file == 'index.md':
                    continue
                total_count += 1
                filepath = os.path.join(root, file)
                rel_path = os.path.relpath(filepath, docs_dir)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                metadata, _ = parse_frontmatter(content)
                if not metadata:
                    invalid_files.append((rel_path, "Missing YAML Frontmatter"))
                elif 'type' not in metadata or not metadata['type']:
                    invalid_files.append((rel_path, "Missing required 'type' field in YAML frontmatter"))
                else:
                    valid_count += 1
                    
        print(f"OKF Validation Results for {docs_dir}:")
        print(f"Total Markdown Files: {total_count}")
        print(f"Valid OKF Files: {valid_count}")
        print(f"Invalid Files: {len(invalid_files)}")
        if invalid_files:
            print("\nErrors:")
            for path, err in invalid_files:
                print(f"  - {path}: {err}")
            sys.exit(1)
        else:
            print("\nAll files successfully validated against OKF Spec!")
            sys.exit(0)
            
    elif cmd == "init":
        initialized_count = 0
        for root, _, files in os.walk(docs_dir):
            for file in files:
                if not file.endswith('.md') or file == 'index.md':
                    continue
                filepath = os.path.join(root, file)
                rel_path = os.path.relpath(filepath, docs_dir)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                metadata, body = parse_frontmatter(content)
                if not metadata:
                    # Determine default type based on subfolder
                    file_type = "Plan" if "implementation-plans" in rel_path else "Standard"
                    title, desc = extract_title_and_description(body, filepath)
                    
                    # Generate basic metadata
                    mtime = os.path.getmtime(filepath)
                    iso_time = datetime.fromtimestamp(mtime).strftime('%Y-%m-%dT%H:%M:%SZ')
                    
                    metadata = {
                        'type': file_type,
                        'title': title,
                        'description': desc or f"Documentation for {title}",
                        'tags': [file_type.lower()],
                        'timestamp': iso_time
                    }
                    
                    new_content = serialize_frontmatter(metadata) + body
                    with open(filepath, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"Initialized frontmatter for {rel_path} (Type: {file_type})")
                    initialized_count += 1
                    
        print(f"\nSuccessfully initialized {initialized_count} files with OKF frontmatter.")
        
    elif cmd == "index":
        catalog = {}
        for root, _, files in os.walk(docs_dir):
            for file in files:
                if not file.endswith('.md') or file == 'index.md':
                    continue
                filepath = os.path.join(root, file)
                rel_path = os.path.relpath(filepath, docs_dir)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                metadata, body = parse_frontmatter(content)
                if not metadata or 'type' not in metadata:
                    continue
                    
                ftype = metadata['type']
                if ftype not in catalog:
                    catalog[ftype] = []
                    
                catalog[ftype].append({
                    'path': rel_path,
                    'title': metadata.get('title', file),
                    'description': metadata.get('description', ''),
                    'tags': metadata.get('tags', []),
                    'timestamp': metadata.get('timestamp', '')
                })
                
        # Generate the index.md
        index_path = os.path.join(docs_dir, 'index.md')
        
        index_content = []
        index_content.append("---")
        index_content.append("type: Catalog")
        index_content.append("title: Open Knowledge Format Catalog Index")
        index_content.append("description: Automatically generated index of all knowledge concepts and documentation in this project.")
        index_content.append(f"timestamp: {datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')}")
        index_content.append("---")
        index_content.append("\n# Open Knowledge Format (OKF) Catalog Index")
        index_content.append("\nThis catalog indexes the organizational knowledge of this repository in accordance with the Open Knowledge Format (OKF) specification.")
        
        for ftype in sorted(catalog.keys()):
            index_content.append(f"\n## {ftype}s")
            index_content.append("| Concept / Document | Description | Tags | Last Updated |")
            index_content.append("| :--- | :--- | :--- | :--- |")
            for entry in sorted(catalog[ftype], key=lambda x: x['title']):
                tags_str = ", ".join([f"`{t}`" for t in entry['tags']])
                path_link = f"[{entry['title']}]({entry['path']})"
                index_content.append(f"| {path_link} | {entry['description']} | {tags_str} | {entry['timestamp']} |")
                
        with open(index_path, 'w', encoding='utf-8') as f:
            f.write("\n".join(index_content) + "\n")
            
        print(f"Generated OKF index at {os.path.relpath(index_path, docs_dir)}")

    elif cmd == "graph":
        nodes = []
        edges = []
        node_paths = set()
        
        # First pass: collect all nodes
        for root, _, files in os.walk(docs_dir):
            for file in files:
                if not file.endswith('.md'):
                    continue
                filepath = os.path.join(root, file)
                rel_path = os.path.relpath(filepath, docs_dir)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                metadata, _ = parse_frontmatter(content)
                ftype = metadata.get('type', 'Unknown') if metadata else 'Unknown'
                title = metadata.get('title', file) if metadata else file
                
                nodes.append({
                    'id': rel_path,
                    'title': title,
                    'type': ftype,
                    'description': metadata.get('description', '') if metadata else ''
                })
                node_paths.add(rel_path)
                
        # Second pass: collect edges (links)
        for root, _, files in os.walk(docs_dir):
            for file in files:
                if not file.endswith('.md'):
                    continue
                filepath = os.path.join(root, file)
                rel_path = os.path.relpath(filepath, docs_dir)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                _, body = parse_frontmatter(content)
                linked_files = find_links(body, os.path.dirname(filepath), docs_dir)
                
                for target in linked_files:
                    if target in node_paths:
                        edges.append({
                            'source': rel_path,
                            'target': target
                        })
                        
        graph_data = {
            'nodes': nodes,
            'edges': edges
        }
        
        graph_path = os.path.join(docs_dir, 'knowledge_graph.json')
        with open(graph_path, 'w', encoding='utf-8') as f:
            json.dump(graph_data, f, indent=2)
            
        print(f"Generated OKF Knowledge Graph JSON at {os.path.relpath(graph_path, docs_dir)}")
        print(f"Nodes: {len(nodes)}, Edges: {len(edges)}")

if __name__ == "__main__":
    main()
