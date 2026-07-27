import cv2
import numpy as np
import random
import os

input_path = r"C:\Sagar\Projects\CBSE\byAntiGravity\apps\mobile_web_client\assets\chlor_alkali_process_real.jpg"
output_path = r"C:\Sagar\Projects\CBSE\byAntiGravity\apps\mobile_web_client\assets\chlor_alkali_process_animated.mp4"

# Ensure output directory exists
os.makedirs(os.path.dirname(output_path), exist_ok=True)

# Read image
img = cv2.imread(input_path)
if img is None:
    print(f"Failed to read image at {input_path}")
    exit(1)

height, width, _ = img.shape

# Setup video writer
# Using mp4v for fallback compatibility since openh264 is missing
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
out = cv2.VideoWriter(output_path, fourcc, 30.0, (width, height))

# Generate bubbles for a 3-second seamless loop (90 frames at 30fps)
num_bubbles = 150
bubbles = []
for i in range(num_bubbles):
    # Two clusters of bubbles (one for Anode, one for Cathode)
    is_left = random.choice([True, False])
    if is_left:
        x = random.randint(width//3 - 30, width//3 + 30)
    else:
        x = random.randint(2*width//3 - 30, 2*width//3 + 30)
        
    speed = random.uniform(1.0, 2.0) # Number of full vertical loops in 3 seconds
    size = random.randint(1, 4)
    wobble_freq = random.uniform(0.05, 0.2)
    wobble_amp = random.uniform(2, 6)
    
    bubbles.append({
        'x': x,
        'y_offset': random.uniform(0, 1), # Starting phase
        'speed': speed, 
        'size': size,
        'wobble_freq': wobble_freq,
        'wobble_amp': wobble_amp
    })

frames = 90
for f in range(frames):
    frame = img.copy()
    overlay = np.zeros_like(img, dtype=np.uint8)
    
    t = f / frames # 0.0 to 1.0 (time normalized)
    
    for b in bubbles:
        # Phase determines y position
        current_phase = (b['y_offset'] + t * b['speed']) % 1.0
        
        y_bottom = height - 100
        y_top = height // 4
        y = y_bottom - current_phase * (y_bottom - y_top)
        
        # Sine wobble
        x = b['x'] + np.sin(current_phase * b['wobble_freq'] * 100) * b['wobble_amp']
        
        # Smooth alpha fade in/out at top and bottom to avoid popping
        alpha_multiplier = 1.0
        if current_phase < 0.1:
            alpha_multiplier = current_phase / 0.1
        elif current_phase > 0.9:
            alpha_multiplier = (1.0 - current_phase) / 0.1
            
        color = (255, 255, 255)
        # draw bubble on overlay
        alpha = int(180 * alpha_multiplier) # Max 180 out of 255
        cv2.circle(overlay, (int(x), int(y)), b['size'], (alpha, alpha, alpha), -1)

    # Add overlay to frame
    frame = cv2.add(frame, overlay)

    # Add labels over the frame
    font = cv2.FONT_HERSHEY_SIMPLEX
    font_scale = 0.8
    thickness = 2
    
    labels = [
        ("Anode (+)", width//3 - 70, height // 4 - 40),
        ("Cl2 Gas (Bubbles)", width//3 - 100, height // 4 - 10),
        ("Cathode (-)", 2*width//3 - 70, height // 4 - 40),
        ("H2 Gas (Bubbles)", 2*width//3 - 100, height // 4 - 10),
        ("Brine (NaCl + H2O)", width//2 - 100, height - 40),
        ("NaOH forms near cathode", 2*width//3 - 130, height - 70)
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
print(f"Generated looping cinemagraph at {output_path}")
print(f"File size: {os.path.getsize(output_path) / 1024:.2f} KB")
