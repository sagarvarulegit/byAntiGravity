import React from "react";
import { AbsoluteFill, useCurrentFrame, useVideoConfig, spring, interpolate, Img, staticFile } from "remotion";
import { ConversationMessage, WordAlignment } from "../data/schema";

export const ConversationScene: React.FC<{
  messages: ConversationMessage[];
  imageUrl?: string;
  audio?: string;
  alignments?: WordAlignment[];
}> = ({ messages, imageUrl }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // For a comic recap, we'll reveal each message sequentially
  const staggerFrames = 90; // Frames between each message appearing

  return (
    <AbsoluteFill style={{ backgroundColor: "#1A1A1A", color: "white", padding: "80px 120px", display: "flex", flexDirection: imageUrl ? "row" : "column", justifyContent: "center", alignItems: "center", gap: imageUrl ? 60 : 30 }}>
      {imageUrl && (
        <div style={{ flex: 1, display: "flex", justifyContent: "center", alignItems: "center", height: "100%" }}>
          <Img 
            src={staticFile(imageUrl)} 
            style={{ 
              maxWidth: "100%", 
              maxHeight: "100%", 
              objectFit: "contain",
              borderRadius: "20px",
              border: "4px solid #fadb14",
              boxShadow: "0 20px 50px rgba(0,0,0,0.8)",
              backgroundColor: "white"
            }} 
          />
        </div>
      )}
      
      <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", gap: 30, height: "100%", width: imageUrl ? "100%" : "auto" }}>
        {!imageUrl && (
          <h2 style={{ fontSize: 48, color: "#fadb14", fontFamily: "Outfit, sans-serif", textAlign: "center", marginBottom: 40 }}>
            Comic Recap
          </h2>
        )}
        
        {messages.map((msg, index) => {
          const startFrame = index * staggerFrames + 30;
          
          const scale = spring({
            frame: frame - startFrame,
            fps,
            config: { damping: 12, stiffness: 100 },
          });

          const opacity = interpolate(frame - startFrame, [0, 15], [0, 1], {
            extrapolateLeft: "clamp",
            extrapolateRight: "clamp",
          });

          const isLeft = index % 2 === 0;
          
          const avatarSize = imageUrl ? 60 : 80;
          const nameSize = imageUrl ? 16 : 20;
          const textSize = imageUrl ? 24 : 32;

          return (
            <div 
              key={index} 
              style={{ 
                display: "flex", 
                flexDirection: isLeft ? "row" : "row-reverse", 
                alignItems: "flex-start", 
                gap: 20,
                opacity,
                transform: `scale(${scale})`,
                transformOrigin: isLeft ? "left center" : "right center",
              }}
            >
              <div style={{
                width: avatarSize, height: avatarSize, borderRadius: avatarSize / 2, 
                backgroundColor: isLeft ? "#2b5a83" : "#832b4b",
                display: "flex", justifyContent: "center", alignItems: "center",
                fontSize: textSize, fontWeight: "bold", fontFamily: "Outfit, sans-serif",
                border: "4px solid #333",
                flexShrink: 0
              }}>
                {msg.speaker.charAt(0)}
              </div>

              <div style={{
                backgroundColor: isLeft ? "#333" : "#fadb14",
                color: isLeft ? "white" : "black",
                padding: "20px 30px",
                borderRadius: "20px",
                borderTopLeftRadius: isLeft ? 0 : "20px",
                borderTopRightRadius: isLeft ? "20px" : 0,
                maxWidth: "85%",
                boxShadow: "0 10px 30px rgba(0,0,0,0.5)"
              }}>
                <div style={{ fontSize: nameSize, fontWeight: "bold", marginBottom: 10, fontFamily: "Outfit, sans-serif", opacity: 0.7 }}>
                  {msg.speaker} {msg.role ? `(${msg.role})` : ""}
                </div>
                <div style={{ fontSize: textSize, fontFamily: "Georgia, serif", lineHeight: 1.4 }}>
                  {msg.text}
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </AbsoluteFill>
  );
};
