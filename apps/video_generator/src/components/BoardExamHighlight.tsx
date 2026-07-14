import React from "react";
import { spring, useCurrentFrame, useVideoConfig } from "remotion";
import { outfitFont } from "../theme";

export interface BoardExamHighlightProps {
  repeated: number;
  years: string[];
  marks?: number;
}

export const BoardExamHighlight: React.FC<BoardExamHighlightProps> = ({
  repeated,
  years,
  marks,
}) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Entrance animation: slides down from top-right corner
  const slideProgress = spring({
    frame,
    fps,
    config: {
      damping: 12,
      stiffness: 100,
      mass: 0.6,
    },
  });

  // Scale pulse animation after it lands (around frame 15 onwards)
  const pulseStartFrame = 20;
  const pulseProgress = frame > pulseStartFrame
    ? Math.sin((frame - pulseStartFrame) * 0.1) * 0.03
    : 0;

  const translateY = (1 - slideProgress) * -150; // slide from -150px to 0px
  const scale = slideProgress + pulseProgress;

  return (
    <div
      style={{
        position: "absolute",
        top: 40,
        right: 40,
        zIndex: 100,
        transform: `translateY(${translateY}px) scale(${scale})`,
        display: "flex",
        flexDirection: "column",
        alignItems: "flex-end",
        fontFamily: outfitFont,
      }}
    >
      {/* Main Pill Badge */}
      <div
        style={{
          background: "linear-gradient(135deg, #F59E0B 0%, #D97706 100%)", // Amber/Gold gradient
          border: "2px solid #FEF3C7",
          borderRadius: 30,
          padding: "10px 24px",
          display: "flex",
          alignItems: "center",
          gap: 10,
          boxShadow: "0 10px 25px -5px rgba(217, 119, 6, 0.4)",
        }}
      >
        <span style={{ fontSize: 24, filter: "drop-shadow(0 2px 4px rgba(0,0,0,0.2))" }}>
          🔥
        </span>
        <div style={{ display: "flex", flexDirection: "column" }}>
          <span
            style={{
              color: "#FFFFFF",
              fontWeight: 800,
              fontSize: 18,
              letterSpacing: "0.05em",
              textTransform: "uppercase",
              lineHeight: 1.1,
            }}
          >
            Board Favorite
          </span>
          <span
            style={{
              color: "#FEF3C7",
              fontWeight: 600,
              fontSize: 13,
              lineHeight: 1.1,
            }}
          >
            Repeated {repeated}x in Exams
          </span>
        </div>
      </div>

      {/* Detail Label (Years and Marks) */}
      <div
        style={{
          marginTop: 8,
          backgroundColor: "rgba(15, 23, 42, 0.85)", // Dark semi-transparent tag
          backdropFilter: "blur(4px)",
          border: "1px solid rgba(254, 243, 199, 0.2)",
          borderRadius: 12,
          padding: "4px 12px",
          display: "flex",
          gap: 8,
          color: "#FEF3C7",
          fontSize: 12,
          fontWeight: 600,
          boxShadow: "0 4px 6px -1px rgba(0, 0, 0, 0.1)",
        }}
      >
        <span>Years: {years.join(", ")}</span>
        {marks && (
          <>
            <span style={{ color: "rgba(254, 243, 199, 0.4)" }}>|</span>
            <span>Weightage: {marks}M</span>
          </>
        )}
      </div>
    </div>
  );
};
