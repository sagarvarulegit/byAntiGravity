import React from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, staticFile } from "remotion";
import { PaperBackground } from "./PaperBackground";
import { AppColors, outfitFont } from "../theme";
import { WordAlignment } from "../data/schema";

interface TitleSceneProps {
  title: string;
  subtitle?: string;
  audio?: string;
  alignments?: WordAlignment[];
}

export const TitleScene: React.FC<TitleSceneProps> = ({ title, subtitle, audio }) => {
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
    <div style={{ flex: 1, position: "relative", width: "100%", height: "100%" }}>
      <PaperBackground />
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
            backgroundColor: AppColors.cardLight,
            border: `3px solid ${AppColors.blue}`,
            borderRadius: "16px",
            padding: "48px 64px",
            boxShadow: `0 10px 30px rgba(15, 23, 42, 0.08)`,
            textAlign: "center",
            maxWidth: "800px",
          }}
        >
          <h1
            style={{
              fontSize: "64px",
              fontWeight: 800,
              color: AppColors.blue,
              margin: 0,
              opacity: textOpacity,
              letterSpacing: "-1px",
              lineHeight: 1.1,
            }}
          >
            {title}
          </h1>
          {subtitle && (
            <h2
              style={{
                fontSize: "28px",
                fontWeight: 500,
                color: AppColors.purple,
                marginTop: "20px",
                marginBottom: 0,
                opacity: textOpacity,
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
