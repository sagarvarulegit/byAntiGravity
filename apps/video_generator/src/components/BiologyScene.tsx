import React from "react";
import { AbsoluteFill, useCurrentFrame, useVideoConfig, interpolate, Audio, staticFile, Easing } from "remotion";
import { WordAlignment } from "../data/schema";

const getStartFrame = (alignments: WordAlignment[] | undefined, targetWord: string, fallbackFrame: number, fps: number = 30) => {
  if (!alignments) return fallbackFrame;
  const match = alignments.find(a => a.word.toLowerCase().includes(targetWord.toLowerCase()));
  if (match) return Math.round(match.start * fps);
  return fallbackFrame;
};

export const BiologyScene: React.FC<{
  title: string;
  subtitle?: string;
  variant?: "heart_double_circulation";
  audio?: string;
  alignments?: WordAlignment[];
}> = ({ title, subtitle, variant, audio, alignments }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Pattern Interrupt Triggers & Timing
  const twiceFrame = getStartFrame(alignments, "twice", 30, fps);
  const lungsFrame = getStartFrame(alignments, "lungs", 90, fps);
  const bodyFrame = getStartFrame(alignments, "body", 150, fps);
  const vTrickFrame = getStartFrame(alignments, "visit", 210, fps);
  const aTrickFrame = getStartFrame(alignments, "away", 250, fps);

  // Animations
  const heartbeat = Math.sin(frame * 0.4) * 0.05 + 1;
  const showTwiceText = frame >= twiceFrame && frame < twiceFrame + 90;
  
  const drawDeoxToLungs = interpolate(frame, [lungsFrame, lungsFrame + 30], [0, 200], { extrapolateRight: "clamp", extrapolateLeft: "clamp" });
  const drawOxToHeart = interpolate(frame, [lungsFrame + 30, lungsFrame + 60], [0, 200], { extrapolateRight: "clamp", extrapolateLeft: "clamp" });
  
  const drawOxToBody = interpolate(frame, [bodyFrame, bodyFrame + 30], [0, 200], { extrapolateRight: "clamp", extrapolateLeft: "clamp" });
  const drawDeoxToHeart = interpolate(frame, [bodyFrame + 30, bodyFrame + 60], [0, 200], { extrapolateRight: "clamp", extrapolateLeft: "clamp" });

  const showVTrick = frame >= vTrickFrame;
  const showATrick = frame >= aTrickFrame;

  return (
    <AbsoluteFill style={{ backgroundColor: "#0F172A", color: "white", padding: 60, fontFamily: "Outfit, sans-serif" }}>
      {audio && <Audio src={staticFile(audio)} />}
      
      {/* HEADER */}
      <div style={{ position: "absolute", top: 40, left: 60, right: 60, display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <div>
          <h1 style={{ fontSize: 60, color: "#ef4444", margin: 0 }}>{title}</h1>
          {subtitle && <h2 style={{ fontSize: 36, color: "#cbd5e1", margin: 0, fontWeight: 300 }}>{subtitle}</h2>}
        </div>
      </div>

      {/* CANVAS */}
      <div style={{ position: "absolute", top: 150, left: 60, right: 60, bottom: 60, display: "flex", justifyContent: "center", alignItems: "center" }}>
        
        {variant === "heart_double_circulation" && (
          <svg width="800" height="600" viewBox="0 0 800 600" style={{ overflow: "visible" }}>
            
            {/* The Heart Node (Middle) */}
            <g transform={`translate(400, 300) scale(${heartbeat})`}>
              <path d="M 0 -30 C -40 -70, -80 -20, 0 50 C 80 -20, 40 -70, 0 -30 Z" fill="#ef4444" stroke="#7f1d1d" strokeWidth="4" />
              {/* Divided Chambers representation */}
              <line x1="0" y1="-40" x2="0" y2="45" stroke="#7f1d1d" strokeWidth="3" />
              <line x1="-30" y1="-5" x2="30" y2="-5" stroke="#7f1d1d" strokeWidth="3" />
              <text x="-40" y="-10" fill="white" fontSize="14" fontWeight="bold">RA</text>
              <text x="20" y="-10" fill="white" fontSize="14" fontWeight="bold">LA</text>
              <text x="-35" y="25" fill="white" fontSize="14" fontWeight="bold">RV</text>
              <text x="15" y="25" fill="white" fontSize="14" fontWeight="bold">LV</text>
            </g>

            {/* The Lungs Node (Top) */}
            <g transform="translate(400, 100)">
              <rect x="-60" y="-30" width="120" height="60" rx="30" fill="#38bdf8" opacity="0.3" stroke="#0284c7" strokeWidth="3" />
              <text x="0" y="8" fill="#38bdf8" fontSize="24" textAnchor="middle" fontWeight="bold">LUNGS</text>
            </g>

            {/* The Body Node (Bottom) */}
            <g transform="translate(400, 500)">
              <rect x="-60" y="-30" width="120" height="60" rx="10" fill="#fde047" opacity="0.3" stroke="#ca8a04" strokeWidth="3" />
              <text x="0" y="8" fill="#fde047" fontSize="24" textAnchor="middle" fontWeight="bold">BODY TISSUES</text>
            </g>

            {/* Circulation Paths */}
            
            {/* 1. Deox blood from RV to Lungs (Pulmonary Artery) */}
            <path d="M 370 280 Q 250 190 340 100" fill="none" stroke="#3b82f6" strokeWidth="10" strokeDasharray="250" strokeDashoffset={250 - drawDeoxToLungs} strokeLinecap="round" opacity="0.8" />
            {frame >= lungsFrame + 15 && showATrick && <text x="250" y="190" fill="#3b82f6" fontSize="20" fontWeight="bold" textAnchor="end">Pulmonary Artery (A = Away!)</text>}
            
            {/* 2. Ox blood from Lungs to LA (Pulmonary Vein) */}
            <path d="M 460 100 Q 550 190 430 280" fill="none" stroke="#ef4444" strokeWidth="10" strokeDasharray="250" strokeDashoffset={250 - drawOxToHeart} strokeLinecap="round" opacity="0.8" />
            {frame >= lungsFrame + 45 && showVTrick && <text x="550" y="190" fill="#ef4444" fontSize="20" fontWeight="bold">Pulmonary Vein (V = Visit!)</text>}

            {/* 3. Ox blood from LV to Body (Aorta) */}
            <path d="M 430 320 Q 550 410 460 500" fill="none" stroke="#ef4444" strokeWidth="10" strokeDasharray="250" strokeDashoffset={250 - drawOxToBody} strokeLinecap="round" opacity="0.8" />
            {frame >= bodyFrame + 15 && showATrick && <text x="550" y="410" fill="#ef4444" fontSize="20" fontWeight="bold">Aorta (A = Away!)</text>}

            {/* 4. Deox blood from Body to RA (Vena Cava) */}
            <path d="M 340 500 Q 250 410 370 320" fill="none" stroke="#3b82f6" strokeWidth="10" strokeDasharray="250" strokeDashoffset={250 - drawDeoxToHeart} strokeLinecap="round" opacity="0.8" />
            {frame >= bodyFrame + 45 && showVTrick && <text x="250" y="410" fill="#3b82f6" fontSize="20" fontWeight="bold" textAnchor="end">Vena Cava (V = Visit!)</text>}

            {/* Zeigarnik Effect Popup */}
            {showTwiceText && (
              <g transform="translate(400, 300)">
                <text x="0" y="120" fill="#fadb14" fontSize="36" textAnchor="middle" fontWeight="bold" stroke="black" strokeWidth="6" paintOrder="stroke">WHY PUMP IT TWICE?!</text>
              </g>
            )}

          </svg>
        )}

      </div>
    </AbsoluteFill>
  );
};
