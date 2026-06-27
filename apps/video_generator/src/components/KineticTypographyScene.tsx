import React from "react";
import { useCurrentFrame, useVideoConfig, interpolate, spring, Audio, staticFile } from "remotion";
import { PaperBackground } from "./PaperBackground";
import { AppColors, outfitFont } from "../theme";
import { WordAlignment } from "../data/schema";

interface KineticTypographySceneProps {
  text: string;
  audio?: string;
  alignments?: WordAlignment[];
}

export const KineticTypographyScene: React.FC<KineticTypographySceneProps> = ({ text, audio, alignments }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();
  const currentTime = frame / fps;

  const words = text.split(/\s+/).filter(w => w.length > 0);
  const framesPerWord = 12;

  return (
    <div style={{ flex: 1, position: "relative", width: "100%", height: "100%" }}>
      <PaperBackground />
      {audio && <Audio src={staticFile(audio)} />}

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
          padding: "0 100px",
        }}
      >
        <div
          style={{
            display: "flex",
            flexWrap: "wrap",
            justifyContent: "center",
            alignContent: "center",
            gap: "16px 20px",
            maxWidth: "1000px",
            fontFamily: outfitFont,
          }}
        >
          {words.map((word, index) => {
            const alignment = alignments?.[index];
            const startFrame = alignment ? alignment.start * fps : (15 + index * framesPerWord);
            const wordFrame = frame - startFrame;

            // Simple scale pop when word is hit
            const scaleSpring = spring({
              frame: wordFrame,
              fps,
              config: { damping: 10, stiffness: 120 },
            });

            // Calculate opacity
            const opacity = interpolate(wordFrame, [-5, 5], [0.15, 1], {
              extrapolateLeft: "clamp",
              extrapolateRight: "clamp",
            });

            // Calculate color highlight
            const isActive = alignment 
              ? currentTime >= alignment.start && currentTime <= alignment.end
              : wordFrame >= 0 && wordFrame < framesPerWord;
            
            const isPast = alignment 
              ? currentTime > alignment.end
              : wordFrame >= framesPerWord;

            const color = isActive
              ? AppColors.orange
              : isPast
              ? AppColors.textLightPrimary
              : `${AppColors.textLightSecondary}44`;

            const scale = wordFrame >= 0 ? interpolate(scaleSpring, [0, 1], [0.8, 1]) : 0.8;

            return (
              <span
                key={index}
                style={{
                  fontSize: "44px",
                  fontWeight: 700,
                  color,
                  opacity,
                  transform: `scale(${scale})`,
                  display: "inline-block",
                  lineHeight: 1.2,
                }}
              >
                {alignment ? alignment.word : word}
              </span>
            );
          })}
        </div>
      </div>
    </div>
  );
};
