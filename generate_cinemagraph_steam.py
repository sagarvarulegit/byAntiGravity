import cv2
import numpy as np
import random
import os

input_path = r"C:\Sagar\Projects\CBSE\byAntiGravity\apps\mobile_web_client\assets\copper_sulphate_crystals_real.jpg"
output_path = r"C:\Sagar\Projects\CBSE\byAntiGravity\apps\mobile_web_client\assets\copper_sulphate_crystals_animated.mp4"

os.makedirs(os.path.dirname(output_path), exist_ok=True)

img = cv2.imread(input_path)
if img is None:
    print(f"Failed to read image at {input_path}")
    exit(1)

height, width, _ = img.shape
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
out = cv2.VideoWriter(output_path, fourcc, 30.0, (width, height))

num_particles = 80
particles = []

center_x = width // 2
center_y = int(height * 0.7)

for i in range(num_particles):
    x = random.randint(center_x - 40, center_x + 40)
    particles.append({
        'base_x': x,
        'y_offset': random.uniform(0, 1),
        'speed': random.uniform(1.0, 1.5),
        'size': random.randint(20, 40),
        'wobble_freq': random.uniform(0.5, 1.5),
        'wobble_amp': random.uniform(10, 30)
    })

frames = 90
for f in range(frames):
    frame = img.copy()
    overlay = np.zeros_like(img, dtype=np.uint8)
    
    t = f / frames 
    
    for p in particles:
        current_phase = (p['y_offset'] + t * p['speed']) % 1.0
        y_start = center_y
        y_end = height // 4
        
        y = y_start - current_phase * (y_start - y_end)
        x = p['base_x'] + np.sin(current_phase * p['wobble_freq'] * 10) * p['wobble_amp']
        current_size = p['size'] + int(current_phase * 30)
        
        alpha_multiplier = 1.0
        if current_phase < 0.2:
            alpha_multiplier = current_phase / 0.2
        elif current_phase > 0.8:
            alpha_multiplier = (1.0 - current_phase) / 0.2
            
        color = (255, 255, 255)
        alpha = int(80 * alpha_multiplier) 
        
        # Draw on overlay
        cv2.circle(overlay, (int(x), int(y)), current_size, (alpha, alpha, alpha), -1)

    # Blur the entire overlay once per frame
    overlay = cv2.GaussianBlur(overlay, (51, 51), 0)
    
    frame = cv2.add(frame, overlay)
    
    # Add labels over the frame
    font = cv2.FONT_HERSHEY_SIMPLEX
    font_scale = 0.8
    thickness = 2
    
    labels = [
        ("Water droplets condensing", width//2 - 130, height // 4),
        ("CuSO4.5H2O Crystals", width//2 - 110, height - 200),
        ("Losing water of crystallisation", width//2 - 160, height - 160),
        ("Heat", width//2 - 30, height - 40)
    ]
    
    for text, lx, ly in labels:
        # Get text bounding box for background rectangle
        (text_width, text_height), baseline = cv2.getTextSize(text, font, font_scale, thickness)
        
        # Draw semi-transparent background
        rect_overlay = frame.copy()
        padding = 5
        cv2.rectangle(rect_overlay, 
                     (lx - padding, ly - text_height - padding), 
                     (lx + text_width + padding, ly + baseline + padding), 
                     (0, 0, 0), -1)
        # Blend rectangle
        cv2.addWeighted(rect_overlay, 0.6, frame, 0.4, 0, frame)
        
        # Draw white text
        cv2.putText(frame, text, (lx, ly), font, font_scale, (255, 255, 255), thickness, cv2.LINE_AA)

    out.write(frame)

out.release()
print(f"Generated looping steam cinemagraph at {output_path}")
print(f"File size: {os.path.getsize(output_path) / 1024:.2f} KB")
