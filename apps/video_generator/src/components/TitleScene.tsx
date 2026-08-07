import React from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, staticFile } from "remotion";
import { AppColors, outfitFont, animeFont } from "../theme";
import { WordAlignment } from "../data/schema";

interface TitleSceneProps {
  title: string;
  subtitle?: string;
  audio?: string;
  alignments?: WordAlignment[];
  brandColor?: string; // We can pass this in
}

export const TitleScene: React.FC<TitleSceneProps> = ({ title, subtitle, audio, brandColor = AppColors.physicsChem }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Entrance spring animation for the card
  const cardScale = spring({
    frame,
    fps,
    config: { damping: 12 },
  });

  // Fade-in animation for text
  const textOpacity = interpolate(frame, [10, 25], [0, 1], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });

  return (
    <div style={{ flex: 1, position: "relative", width: "100%", height: "100%", backgroundColor: AppColors.obsidian }}>
      {audio && <Audio src={staticFile(audio)} />}
      
      {/* Centered content container */}
      <div
        style={{
          position: "absolute",
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          fontFamily: outfitFont,
        }}
      >
        <div
          style={{
            transform: `scale(${cardScale})`,
            backgroundColor: "rgba(255, 255, 255, 0.05)",
            border: `3px solid ${brandColor}`,
            borderRadius: "16px",
            padding: "48px 64px",
            boxShadow: `0 0 30px ${brandColor}44`,
            textAlign: "center",
            maxWidth: "800px",
          }}
        >
          <h1
            style={{
              fontSize: "80px", // Increased for anime font
              fontWeight: 900,
              color: brandColor,
              margin: 0,
              opacity: textOpacity,
              letterSpacing: "4px",
              lineHeight: 1.1,
              fontFamily: animeFont,
              textShadow: `0 0 20px ${brandColor}`
            }}
          >
            {title}
          </h1>
          {subtitle && (
            <h2
              style={{
                fontSize: "36px",
                fontWeight: 300,
                color: AppColors.white,
                marginTop: "16px",
                marginBottom: 0,
                lineHeight: 1.4,
              }}
            >
              {subtitle}
            </h2>
          )}
        </div>
      </div>
    </div>
  );
};
