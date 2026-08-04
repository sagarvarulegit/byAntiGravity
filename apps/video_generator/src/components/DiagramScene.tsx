import React from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, staticFile } from "remotion";
import { PaperBackground } from "./PaperBackground";
import { AppColors, outfitFont, serifFont } from "../theme";
import { DiagramComponent, DiagramWire } from "../data/schema";

interface DiagramSceneProps {
  title: string;
  subtitle?: string;
  audio?: string;
  components?: DiagramComponent[];
  wires?: DiagramWire[];
}

const Battery = ({ x, y }: { x: number; y: number }) => (
  <g transform={`translate(${x}, ${y})`}>
    <rect x="-10" y="15" width="100" height="10" fill={AppColors.cardLight} />
    <line x1="20" y1="5" x2="20" y2="35" stroke={AppColors.textLightPrimary} strokeWidth="4" />
    <line x1="35" y1="12" x2="35" y2="28" stroke={AppColors.textLightPrimary} strokeWidth="8" />
    <line x1="50" y1="5" x2="50" y2="35" stroke={AppColors.textLightPrimary} strokeWidth="4" />
    <line x1="65" y1="12" x2="65" y2="28" stroke={AppColors.textLightPrimary} strokeWidth="8" />
    <text x="12" y="0" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightSecondary}>+</text>
    <text x="68" y="0" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightSecondary}>-</text>
    <text x="25" y="50" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightPrimary}>Battery</text>
  </g>
);

const Switch = ({ x, y }: { x: number; y: number }) => (
  <g transform={`translate(${x}, ${y})`}>
    <rect x="-10" y="-10" width="30" height="60" fill={AppColors.cardLight} />
    <circle cx="5" cy="10" r="5" fill={AppColors.textLightPrimary} />
    <circle cx="5" cy="35" r="5" fill={AppColors.textLightPrimary} />
    <line x1="5" y1="10" x2="5" y2="35" stroke={AppColors.textLightPrimary} strokeWidth="4" />
    <circle cx="5" cy="22" r="3" fill={AppColors.green} />
    <text x="25" y="27" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightPrimary}>Switch</text>
  </g>
);

const Meter = ({ x, y, label, type }: { x: number; y: number; label: string; type: string }) => (
  <g transform={`translate(${x}, ${y})`}>
    <rect x="-25" y="-10" width="50" height="60" fill={AppColors.cardLight} />
    <circle cx="0" cy="20" r="22" fill={AppColors.cardLight} stroke={type === 'A' ? AppColors.blue : AppColors.orange} strokeWidth="4" />
    <text x="-7" y="27" fontFamily={outfitFont} fontSize="20" fontWeight="bold" fill={type === 'A' ? AppColors.blue : AppColors.orange}>{type}</text>
    <text x="28" y="25" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightPrimary}>{label}</text>
  </g>
);

const Bulb = ({ x, y, frame }: { x: number; y: number; frame: number }) => (
  <g transform={`translate(${x}, ${y})`}>
    <rect x="-10" y="10" width="80" height="20" fill={AppColors.cardLight} />
    <path d="M 10 20 L 20 20 C 20 10, 30 10, 30 20 C 30 30, 40 30, 40 20 L 50 20" fill="none" stroke={AppColors.textLightPrimary} strokeWidth="4" />
    <circle cx="30" cy="15" r="18" fill="none" stroke={AppColors.textLightPrimary} strokeWidth="3" />
    <circle cx="30" cy="15" r="18" fill={AppColors.orangeLight} opacity={0.4 + Math.sin(frame / 10) * 0.1} />
    <text x="15" y="-10" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightPrimary}>Bulb</text>
  </g>
);

const Resistor = ({ x, y }: { x: number; y: number }) => (
  <g transform={`translate(${x}, ${y})`}>
    <rect x="-10" y="-10" width="80" height="20" fill={AppColors.cardLight} />
    <path d="M 0 0 L 10 -10 L 20 10 L 30 -10 L 40 10 L 50 -10 L 60 10 L 70 0" fill="none" stroke={AppColors.textLightPrimary} strokeWidth="4" />
    <text x="15" y="-20" fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={AppColors.textLightPrimary}>Resistor</text>
  </g>
);

export const DiagramScene: React.FC<DiagramSceneProps> = ({ title, subtitle, audio, components = [], wires = [] }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const contentEntrance = spring({ frame, fps, config: { damping: 14 } });
  const textOpacity = interpolate(contentEntrance, [0, 1], [0, 1]);
  const textTranslateX = interpolate(contentEntrance, [0, 1], [-50, 0]);
  const diagramScale = interpolate(contentEntrance, [0, 1], [0.8, 1]);
  const diagramOpacity = interpolate(contentEntrance, [0, 1], [0, 1]);
  const currentOffset = -frame * 3;

  const hasDiagram = (components && components.length > 0) || (wires && wires.length > 0);

  return (
    <div style={{ flex: 1, position: "relative", width: "100%", height: "100%" }}>
      <PaperBackground />
      {audio && <Audio src={staticFile(audio)} />}

      <div
        style={{
          position: "absolute", top: "80px", left: "140px", right: "80px", bottom: "80px",
          display: "grid", gridTemplateColumns: hasDiagram ? "1fr 1.2fr" : "1fr", alignItems: "center", gap: "40px",
        }}
      >
        <div style={{ opacity: textOpacity, transform: `translateX(${textTranslateX}px)`, fontFamily: outfitFont }}>
          <h2 style={{ fontSize: "44px", fontWeight: 800, color: AppColors.blue, margin: "0 0 16px 0", lineHeight: 1.2 }}>{title}</h2>
          {subtitle && <p style={{ fontFamily: serifFont, fontSize: "24px", lineHeight: "36px", color: AppColors.textLightSecondary, margin: 0 }}>{subtitle}</p>}
        </div>

        {hasDiagram && (
          <div style={{ display: "flex", justifyContent: "center", alignItems: "center", opacity: diagramOpacity, transform: `scale(${diagramScale})`, height: "100%" }}>
            <svg width="460" height="340" viewBox="0 0 460 340" style={{ backgroundColor: AppColors.cardLight, border: `2px solid ${AppColors.borderLight}`, borderRadius: "16px", boxShadow: "0 8px 24px rgba(15, 23, 42, 0.04)" }}>
              
              {/* Wires */}
              {wires.map(wire => {
                const d = `M ${wire.points.map(p => `${p[0]} ${p[1]}`).join(' L ')}`;
                return (
                  <g key={wire.id}>
                    <path d={d} fill="none" stroke="#CBD5E1" strokeWidth="6" strokeLinejoin="round" />
                    <path d={d} fill="none" stroke={AppColors.purple} strokeWidth="6" strokeDasharray="15, 15" strokeDashoffset={currentOffset} strokeLinejoin="round" />
                  </g>
                );
              })}

              {/* Components */}
              {components.map(comp => {
                if (comp.type === 'battery') return <Battery key={comp.id} x={comp.x} y={comp.y} />;
                if (comp.type === 'switch') return <Switch key={comp.id} x={comp.x} y={comp.y} />;
                if (comp.type === 'ammeter') return <Meter key={comp.id} x={comp.x} y={comp.y} label={comp.label || "Ammeter"} type="A" />;
                if (comp.type === 'voltmeter') return <Meter key={comp.id} x={comp.x} y={comp.y} label={comp.label || "Voltmeter"} type="V" />;
                if (comp.type === 'bulb') return <Bulb key={comp.id} x={comp.x} y={comp.y} frame={frame} />;
                if (comp.type === 'resistor') return <Resistor key={comp.id} x={comp.x} y={comp.y} />;
                return null;
              })}
            </svg>
          </div>
        )}
      </div>
    </div>
  );
};
