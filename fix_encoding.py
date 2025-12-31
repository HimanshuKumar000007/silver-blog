import os

files = [r"d:\silver-site-mission-millionaire\1.html", r"d:\silver-site-mission-millionaire\index.html"]

replacements = {
    "â˜°": "☰",
    "â—": "●",
    "Â·": "·"
}

for file_path in files:
    if os.path.exists(file_path):
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            original_content = content
            for bad, good in replacements.items():
                content = content.replace(bad, good)
            
            if content != original_content:
                with open(file_path, 'w', encoding='utf-8') as f:
                    f.write(content)
                print(f"Updated {file_path}")
            else:
                print(f"No changes needed for {file_path}")
                
        except Exception as e:
            print(f"Error processing {file_path}: {e}")
