import React from "react";
import { AbsoluteFill, useCurrentFrame, useVideoConfig, interpolate, random, Audio, staticFile } from "remotion";
import { WordAlignment } from "../data/schema";

const MagnesiumBurn: React.FC = () => {
  const frame = useCurrentFrame();
  const burnProgress = interpolate(frame, [30, 120], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const ribbonLength = 181;
  const tipX = 250 - (burnProgress * 100);
  const tipY = 300 - (burnProgress * 150);
  const isBurning = frame > 30 && frame < 150;
  const flicker = isBurning ? Math.abs(Math.sin(frame * 0.7)) : 0;
  const flameRadius = interpolate(flicker, [0, 1], [30, 45]);
  const glowOpacity = interpolate(burnProgress, [0, 0.1, 0.9, 1], [0, 1, 1, 0], { extrapolateRight: "clamp", extrapolateLeft: "clamp" });

  const ashParticles = new Array(20).fill(0).map((_, i) => {
    const startFrame = 40 + (i * 4);
    const dropFrame = frame - startFrame;
    if (dropFrame < 0) return null;
    const pProgress = interpolate(startFrame, [30, 120], [0, 1], { extrapolateRight: "clamp", extrapolateLeft: "clamp" });
    const startX = 250 - (pProgress * 100);
    const startY = 300 - (pProgress * 150);
    const x = startX + random(`x-${i}`) * 30 - 15;
    const y = startY + Math.pow(dropFrame, 1.2) * 2;
    const opacity = interpolate(dropFrame, [0, 30, 60], [1, 1, 0]);
    return <circle key={i} cx={x} cy={y} r={random(`r-${i}`) * 2 + 1} fill="#e2e8f0" opacity={opacity} />;
  });

  return (
    <div style={{ position: "relative", width: 400, height: 400 }}>
      <svg width="400" height="400" viewBox="0 0 400 400" style={{ overflow: "visible" }}>
        <defs>
          <radialGradient id="dazzling-glow">
            <stop offset="0%" stopColor="#ffffff" stopOpacity={1} />
            <stop offset="20%" stopColor="#ffffaa" stopOpacity={0.8} />
            <stop offset="100%" stopColor="#ffffff" stopOpacity={0} />
          </radialGradient>
        </defs>
        <rect x="230" y="360" width="40" height="15" fill="#333" rx="4" />
        <rect x="245" y="320" width="10" height="40" fill="#555" />
        {frame > 10 && (
          <path d={`M 250 320 Q 240 ${300 + Math.sin(frame*0.5)*10} 250 280 Q 260 ${300 + Math.cos(frame*0.5)*10} 250 320`} fill="rgba(100, 200, 255, 0.6)" />
        )}
        <path d="M 50 50 L 150 150" stroke="#666" strokeWidth="16" strokeLinecap="round" />
        <path d="M 70 30 L 155 145" stroke="#444" strokeWidth="8" strokeLinecap="round" />
        <line x1="150" y1="150" x2="250" y2="300" stroke="#E2E8F0" strokeWidth="12" strokeLinecap="round" strokeDasharray={`${ribbonLength} ${ribbonLength}`} strokeDashoffset={burnProgress * ribbonLength} />
        {burnProgress > 0 && <ellipse cx="250" cy="385" rx={20 * burnProgress} ry={5} fill="#e2e8f0" opacity={0.8} />}
        {ashParticles}
        {glowOpacity > 0 && <circle cx={tipX} cy={tipY} r={flameRadius * 2} fill="url(#dazzling-glow)" opacity={glowOpacity} />}
        {glowOpacity > 0 && <circle cx={tipX} cy={tipY} r={flameRadius * 0.5} fill="#ffffff" opacity={glowOpacity} />}
      </svg>
    </div>
  );
};

const QuicklimeWater: React.FC = () => {
  const frame = useCurrentFrame();
  const progress = interpolate(frame, [30, 90], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const heatOpacity = interpolate(progress, [0, 1], [0, 0.6]);
  
  return (
    <svg width="400" height="400" viewBox="0 0 400 400">
      <defs>
        <radialGradient id="heat-glow">
          <stop offset="0%" stopColor="#ff4d4f" stopOpacity={1} />
          <stop offset="100%" stopColor="#ff4d4f" stopOpacity={0} />
        </radialGradient>
      </defs>
      {/* Beaker back */}
      <path d="M 120 100 L 120 300 Q 120 320 140 320 L 260 320 Q 280 320 280 300 L 280 100" fill="none" stroke="#555" strokeWidth="4" />
      {/* Heat Glow */}
      <circle cx="200" cy="320" r="100" fill="url(#heat-glow)" opacity={heatOpacity} />
      {/* Liquid */}
      <rect x="122" y={300 - (progress * 150)} width="156" height={progress * 150 + 20} fill="rgba(200, 220, 255, 0.4)" rx="5" />
      {/* Quicklime powder at bottom */}
      <path d="M 140 315 Q 200 290 260 315 L 260 318 L 140 318 Z" fill="#fff" opacity={1 - progress*0.5} />
      {/* Slaked lime slurry */}
      {progress > 0 && <path d="M 130 310 Q 200 280 270 310 L 270 318 L 130 318 Z" fill="#eee" opacity={progress} />}
    </svg>
  );
};

const IronCopperSulphate: React.FC = () => {
  const frame = useCurrentFrame();
  const progress = interpolate(frame, [30, 120], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  
  // Blue to green
  const r = Math.round(interpolate(progress, [0, 1], [50, 150]));
  const g = Math.round(interpolate(progress, [0, 1], [150, 255]));
  const b = Math.round(interpolate(progress, [0, 1], [255, 100]));
  
  // Nail color (grey to brown)
  const nr = Math.round(interpolate(progress, [0, 1], [150, 139]));
  const ng = Math.round(interpolate(progress, [0, 1], [150, 69]));
  const nb = Math.round(interpolate(progress, [0, 1], [150, 19]));

  return (
    <svg width="400" height="400" viewBox="0 0 400 400">
      {/* Beaker */}
      <path d="M 100 150 L 100 350 Q 100 370 120 370 L 280 370 Q 300 370 300 350 L 300 150" fill="none" stroke="#555" strokeWidth="4" />
      {/* Liquid */}
      <rect x="102" y="200" width="196" height="168" fill={`rgba(${r}, ${g}, ${b}, 0.6)`} />
      {/* Iron Nails dipping down */}
      <g transform={`translate(0, ${interpolate(frame, [0, 30], [-100, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" })})`}>
        <rect x="170" y="100" width="10" height="150" fill={`rgb(${nr}, ${ng}, ${nb})`} rx="2" />
        <rect x="165" y="100" width="20" height="5" fill="#333" />
        
        <rect x="220" y="120" width="10" height="150" fill={`rgb(${nr}, ${ng}, ${nb})`} rx="2" transform="rotate(10 220 120)" />
        <rect x="215" y="120" width="20" height="5" fill="#333" transform="rotate(10 220 120)" />
      </g>
    </svg>
  );
};

const Electrolysis: React.FC = () => {
  const frame = useCurrentFrame();
  const bubbles = new Array(30).fill(0).map((_, i) => {
    const isHydrogen = i % 3 !== 0; // H2 volume is double O2 volume!
    const x = isHydrogen ? 150 + random(`hx-${i}`) * 20 - 10 : 250 + random(`ox-${i}`) * 20 - 10;
    const dropFrame = (frame + i * 5) % 100;
    const y = 320 - dropFrame * 1.5;
    return <circle key={i} cx={x} cy={y} r={random(`r-${i}`) * 2 + 1} fill="rgba(255,255,255,0.8)" />;
  });

  return (
    <svg width="400" height="400" viewBox="0 0 400 400">
      <path d="M 80 150 L 80 350 Q 80 370 100 370 L 300 370 Q 320 370 320 350 L 320 150" fill="none" stroke="#555" strokeWidth="4" />
      <rect x="82" y="200" width="236" height="168" fill="rgba(100, 200, 255, 0.3)" />
      
      {/* Electrodes (Cathode Left, Anode Right) */}
      <rect x="140" y="220" width="20" height="100" fill="#333" />
      <rect x="240" y="220" width="20" height="100" fill="#333" />
      
      {/* Test tubes inverted over electrodes */}
      <path d="M 130 150 L 130 300 A 10 10 0 0 0 170 300 L 170 150" fill="none" stroke="#888" strokeWidth="2" />
      <path d="M 230 150 L 230 300 A 10 10 0 0 0 270 300 L 270 150" fill="none" stroke="#888" strokeWidth="2" />

      {/* Wires & Battery */}
      <path d="M 150 370 L 150 390 L 250 390 L 250 370" fill="none" stroke="#888" strokeWidth="2" />
      <rect x="185" y="380" width="30" height="20" fill="#fadb14" />
      <text x="175" y="395" fill="white" fontSize="12">-</text>
      <text x="220" y="395" fill="white" fontSize="12">+</text>

      {/* Bubbles forming (active after frame 30) */}
      {frame > 30 && bubbles}
    </svg>
  );
};

const getStartFrame = (alignments: WordAlignment[] | undefined, targetWord: string, fallbackFrame: number, fps: number = 30) => {
  if (!alignments) return fallbackFrame;
  const match = alignments.find(a => a.word.toLowerCase().includes(targetWord.toLowerCase()));
  if (match) return Math.round(match.start * fps);
  return fallbackFrame;
};

const ZincAcid: React.FC<{ alignments?: WordAlignment[] }> = ({ alignments }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const dropFrame = getStartFrame(alignments, "drop", 30, fps);
  const matchFrame = getStartFrame(alignments, "matchstick", 250, fps);
  const popFrame = getStartFrame(alignments, "pop!", 350, fps);

  const bubblesStart = dropFrame + 20;

  // H2 bubbles rising from the zinc granules inside the liquid
  const bubbles = new Array(24).fill(0).map((_, i) => {
    const activeFrame = frame - bubblesStart - i * 6;
    if (activeFrame < 0) return { active: false, x: 0, y: 0, r: 0, opacity: 0 };
    const cycle = activeFrame % 100;
    const y = 320 - cycle * 1.25; // rise from granules (y=320) to surface (y~195)
    const x = 135 + random(`zb-${i}`) * 55;
    const r = random(`zr-${i}`) * 2.5 + 1;
    const fadeIn = Math.min(1, cycle / 8);
    const fadeOut = cycle > 88 ? (100 - cycle) / 12 : 1;
    return { active: true, x, y: Math.max(195, y), r, opacity: fadeIn * fadeOut };
  });

  // Matchstick slides in from the right to the tube mouth
  const matchIn = interpolate(frame, [matchFrame, matchFrame + 15], [150, -70], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  
  const popProgress = interpolate(frame, [popFrame, popFrame + 18], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const popRadius = interpolate(popProgress, [0, 1], [10, 90]);
  const popOpacity = frame > popFrame ? interpolate(frame, [popFrame, popFrame + 25], [1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" }) : 0;
  const showPop = frame > popFrame && frame < popFrame + 40;
  const flameFlicker = Math.abs(Math.sin(frame * 0.8)) * 0.5 + 0.5;

  return (
    <svg width="400" height="400" viewBox="0 0 400 400" style={{ overflow: "visible" }}>
      {/* Test tube */}
      <path d="M 120 80 L 120 300 Q 120 340 150 340 L 190 340 Q 220 340 220 300 L 220 80" fill="none" stroke="#94a3b8" strokeWidth="5" strokeLinecap="round" />
      {/* Dilute acid liquid */}
      <rect x="123" y="200" width="94" height="138" fill="rgba(125, 190, 255, 0.35)" rx="4" />
      
      {/* Zinc granules dropping */}
      {[...Array(7)].map((_, i) => {
        const dropDelay = i * 3;
        const startY = 0;
        const targetY = 323;
        const currentY = interpolate(frame, [dropFrame + dropDelay, dropFrame + dropDelay + 15], [startY, targetY], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
        if (frame < dropFrame + dropDelay) return null;
        return (
          <ellipse key={i} cx={140 + i * 11} cy={currentY} rx={7} ry={4} fill="#cbd5e1" stroke="#64748b" strokeWidth="1.5" transform={`rotate(${i * 18} ${140 + i * 11} ${currentY})`} />
        );
      })}

      {/* Hydrogen bubbles */}
      {bubbles.filter(b => b.active).map((b, i) => (
        <circle key={i} cx={b.x} cy={b.y} r={b.r} fill="rgba(255,255,255,0.85)" opacity={b.opacity} />
      ))}
      
      {/* Matchstick held at the mouth of the tube */}
      {frame >= matchFrame && (
        <g transform={`translate(${matchIn}, 0)`}>
          <line x1="300" y1="66" x2="238" y2="86" stroke="#a16207" strokeWidth="5" strokeLinecap="round" />
          <circle cx="234" cy="87" r="6" fill="#7f1d1d" />
          <path d="M 234 78 Q 227 64 234 58 Q 241 64 234 78" fill="#f59e0b" opacity={flameFlicker} />
          <path d="M 234 76 Q 230 68 234 62 Q 238 68 234 76" fill="#fde047" />
        </g>
      )}

      {/* POP burst at the tube mouth (x=164) */}
      {showPop && (
        <g>
          <circle cx="164" cy="82" r={popRadius} fill="none" stroke="#f59e0b" strokeWidth="4" opacity={popOpacity * 0.8} />
          <circle cx="164" cy="82" r={popRadius * 0.6} fill="none" stroke="#fde047" strokeWidth="3" opacity={popOpacity} />
          <text x="164" y="56" textAnchor="middle" fontSize="34" fontWeight="900" fill="#fde047" opacity={popOpacity} fontFamily="Outfit, sans-serif">
            POP!
          </text>
        </g>
      )}
    </svg>
  );
};

export const ActivityScene: React.FC<{
  activityName: string;
  description: string;
  animationType: string;
  audio?: string;
  alignments?: WordAlignment[];
}> = ({ activityName, description, animationType, audio, alignments }) => {
  return (
    <AbsoluteFill style={{ backgroundColor: "#1A1A1A", color: "white", padding: 80 }}>
      {audio && <Audio src={staticFile(audio)} />}
      <h2 style={{ fontSize: 48, color: "#fadb14", fontFamily: "Outfit, sans-serif" }}>{activityName}</h2>
      <p style={{ fontSize: 32, maxWidth: 800, fontFamily: "Georgia, serif" }}>{description}</p>
      
      <div style={{ flex: 1, display: "flex", justifyContent: "center", alignItems: "center" }}>
        {animationType === "magnesium_burn" && <MagnesiumBurn />}
        {animationType === "zinc_acid" && <ZincAcid alignments={alignments} />}
        {animationType === "quicklime_water" && <QuicklimeWater />}
        {animationType === "iron_copper_sulphate" && <IronCopperSulphate />}
        {animationType === "electrolysis" && <Electrolysis />}
      </div>
    </AbsoluteFill>
  );
};
