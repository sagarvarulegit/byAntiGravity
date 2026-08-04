import React, { useMemo } from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, Img, staticFile } from "remotion";
import { PaperBackground } from "./PaperBackground";
import { AppColors, outfitFont, serifFont } from "../theme";
import { WordAlignment } from "../data/schema";

interface TextSceneProps {
  heading: string;
  bullets: string[];
  audio?: string;
  alignments?: WordAlignment[];
  imageUrl?: string;
}

export const TextScene: React.FC<TextSceneProps> = ({ heading, bullets, audio, alignments, imageUrl }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Heading animation
  const headingOpacity = interpolate(frame, [0, 15], [0, 1], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });
  const headingTranslateY = interpolate(frame, [0, 15], [-20, 0], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });

  const imageOpacity = spring({
    frame: frame - 15,
    fps,
    config: { damping: 15 },
  });

  // Calculate bullet delays
  const bulletDelays = useMemo(() => {
    let charOffset = heading.length + 2;
    const totalChars = heading.length + bullets.join('. ').length;
    
    // Estimate total duration from alignments if available
    const durationSecs = alignments && alignments.length > 0 
      ? alignments[alignments.length - 1].end 
      : (20 + bullets.length * 35) / fps;
      
    const timePerChar = durationSecs / Math.max(1, totalChars);

    return bullets.map((b, i) => {
      let delayFrames = 20 + i * 35; // Fallback
      if (alignments && alignments.length > 0) {
        delayFrames = (charOffset * timePerChar) * fps;
      }
      charOffset += b.length + 2;
      return delayFrames;
    });
  }, [heading, bullets, alignments, fps]);

  return (
    <div style={{ flex: 1, position: "relative", width: "100%", height: "100%" }}>
      <PaperBackground />
      {audio && <Audio src={staticFile(audio)} />}

      <div
        style={{
          position: "absolute",
          top: "80px",
          left: "140px",
          right: "80px",
          bottom: "80px",
          display: "flex",
          flexDirection: "row",
          gap: "40px",
        }}
      >
        {/* Left Column: Text */}
        <div style={{ 
          flex: imageUrl ? 0.55 : 1, 
          display: "flex", 
          flexDirection: "column", 
          justifyContent: "flex-start", 
          alignItems: "flex-start" 
        }}>
          {/* Heading */}
          <h2
            style={{
              fontFamily: outfitFont,
              fontSize: "48px",
              fontWeight: 800,
              color: AppColors.blue,
              margin: "0 0 40px 0",
              opacity: headingOpacity,
              transform: `translateY(${headingTranslateY}px)`,
            }}
          >
            {heading}
          </h2>

          {/* Bullets */}
          <ul
            style={{
              listStyle: "none",
              padding: 0,
              margin: 0,
              width: "100%",
              display: "flex",
              flexDirection: "column",
              gap: "24px",
            }}
          >
            {bullets.map((bullet, index) => {
              const delay = bulletDelays[index];
              const bulletProgress = spring({
                frame: frame - delay,
                fps,
                config: { damping: 15 },
              });

              if (frame < delay) return null;

              const opacity = interpolate(bulletProgress, [0, 1], [0, 1]);
              const translateX = interpolate(bulletProgress, [0, 1], [-30, 0]);

              return (
                <li
                  key={index}
                  style={{
                    display: "flex",
                    alignItems: "flex-start",
                    gap: "16px",
                    opacity,
                    transform: `translateX(${translateX}px)`,
                  }}
                >
                  <span
                    style={{
                      fontFamily: outfitFont,
                      color: AppColors.purple,
                      fontSize: "32px",
                      lineHeight: "36px",
                      fontWeight: 900,
                    }}
                  >
                    ■
                  </span>
                  <span
                    style={{
                      fontFamily: serifFont,
                      fontSize: "28px",
                      lineHeight: "40px",
                      color: AppColors.textLightPrimary,
                    }}
                  >
                    {bullet}
                  </span>
                </li>
              );
            })}
          </ul>
        </div>

        {/* Right Column: Image */}
        {imageUrl && (
          <div style={{ 
            flex: 0.45, 
            display: "flex", 
            justifyContent: "center", 
            alignItems: "center",
            opacity: imageOpacity,
            transform: `scale(${interpolate(imageOpacity, [0, 1], [0.9, 1])})`
          }}>
            <Img 
              src={staticFile(imageUrl)} 
              alt="Illustration" 
              style={{ 
                maxWidth: "100%", 
                maxHeight: "100%", 
                objectFit: "contain",
                borderRadius: "16px",
                boxShadow: "0 10px 30px rgba(0,0,0,0.1)"
              }} 
            />
          </div>
        )}
      </div>
    </div>
  );
};
