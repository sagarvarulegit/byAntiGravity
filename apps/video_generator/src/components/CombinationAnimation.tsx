import React from "react";
import { useCurrentFrame, useVideoConfig, interpolate, spring } from "remotion";
import { outfitFont } from "../theme";

export const CombinationAnimation: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // 1. CaO Chunks falling (Frames 10 to 45)
  const caoY1 = interpolate(frame, [10, 30], [-60, 75], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const caoOpacity1 = interpolate(frame, [25, 30], [1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

  const caoY2 = interpolate(frame, [15, 35], [-60, 75], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const caoOpacity2 = interpolate(frame, [30, 35], [1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

  const caoY3 = interpolate(frame, [20, 40], [-60, 75], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const caoOpacity3 = interpolate(frame, [35, 40], [1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

  // 2. Liquid turns cloudy (Frames 30 to 60)
  const liquidOpacity = interpolate(frame, [30, 60], [0.25, 0.45], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const liquidColor = interpolate(frame, [30, 60], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
  const liquidFill = liquidColor > 0.5 ? "#E2E8F0" : "#93C5FD";

  // 3. Steam rising (Looping cycle after frame 40)
  const getSteamProps = (delay: number) => {
    const activeFrame = (frame - delay) % 60;
    const y = interpolate(activeFrame, [0, 45], [10, -40], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
    const scale = interpolate(activeFrame, [0, 45], [0.8, 1.2], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
    const opacity = frame > delay ? interpolate(activeFrame, [0, 15, 45], [0, 0.5, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" }) : 0;
    return { y, scale, opacity };
  };

  const steam1 = getSteamProps(45);
  const steam2 = getSteamProps(52);
  const steam3 = getSteamProps(60);

  // 4. Hand touch movement (Frames 90 to 180)
  // slide in to touch (90 to 115)
  // flinch back (115 to 125)
  // slide out (145 to 175)
  const handX = interpolate(frame, [90, 115, 120, 128, 145, 175], [110, 0, 15, 25, 25, 110], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });
  
  const handRotate = interpolate(frame, [115, 120, 128, 145, 175], [0, -10, -15, -15, 0], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });

  // 5. Exothermic glowing (Frames 115 to 160)
  const glowScale = spring({
    frame: frame - 115,
    fps,
    config: { damping: 10, stiffness: 100 },
  });
  const glowOpacity = interpolate(frame, [115, 120, 150, 160], [0, 0.8, 0.8, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

  // 6. Warning alert popup (Frames 118 to 160)
  const alertScale = spring({
    frame: frame - 118,
    fps,
    config: { damping: 8 },
  });
  const alertOpacity = interpolate(frame, [118, 123, 145, 155], [0, 1, 1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

  return (
    <div
      style={{
        flex: 1,
        backgroundColor: "#1E293B",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        width: "100%",
        height: "100%",
        position: "relative",
      }}
    >
      {/* Exothermic Glow behind beaker */}
      {frame > 115 && (
        <div
          style={{
            position: "absolute",
            width: "350px",
            height: "350px",
            borderRadius: "50%",
            backgroundColor: "#F97316",
            opacity: glowOpacity,
            transform: `scale(${glowScale})`,
            filter: "blur(60px)",
            zIndex: 1,
          }}
        />
      )}

      {/* Main SVG diagram canvas */}
      <svg
        viewBox="0 0 400 240"
        style={{
          width: "800px",
          height: "480px",
          zIndex: 2,
        }}
      >
        {/* Bench */}
        <line x1="20" y1="210" x2="380" y2="210" stroke="#64748B" strokeWidth="2" strokeDasharray="4 4" />

        {/* Liquid in beaker */}
        <rect
          x="145"
          y="115"
          width="110"
          height="90"
          rx="5"
          fill={liquidFill}
          fillOpacity={liquidOpacity}
        />

        {/* Beaker outline */}
        <path
          d="M 140 85 L 140 205 Q 140 210, 145 210 L 255 210 Q 260 210, 260 205 L 260 85"
          fill="none"
          stroke="#94A3B8"
          strokeWidth="2.5"
          strokeLinecap="round"
        />
        <path d="M 137 85 L 143 85" stroke="#94A3B8" strokeWidth="2" strokeLinecap="round" />
        <path d="M 257 85 L 263 85" stroke="#94A3B8" stroke-width="2" strokeLinecap="round" />

        {/* Falling CaO Chunks */}
        {caoOpacity1 > 0 && (
          <polygon
            points="180,45 186,40 192,48 184,54"
            fill="#E2E8F0"
            opacity={caoOpacity1}
            transform={`translate(0, ${caoY1})`}
          />
        )}
        {caoOpacity2 > 0 && (
          <polygon
            points="198,35 204,42 196,48 192,39"
            fill="#E2E8F0"
            opacity={caoOpacity2}
            transform={`translate(0, ${caoY2})`}
          />
        )}
        {caoOpacity3 > 0 && (
          <polygon
            points="212,48 220,44 216,52 208,50"
            fill="#E2E8F0"
            opacity={caoOpacity3}
            transform={`translate(0, ${caoY3})`}
          />
        )}

        {/* CaO solid pile at bottom */}
        <path d="M 180 210 C 190 192, 215 192, 225 210" fill="#CBD5E1" stroke="#94A3B8" strokeWidth="1" />

        {/* Rising Steam waves */}
        {steam1.opacity > 0 && (
          <path
            d="M 165 95 Q 155 80, 165 65 T 165 45"
            fill="none"
            stroke="#E2E8F0"
            strokeWidth="2"
            strokeLinecap="round"
            opacity={steam1.opacity}
            transform={`translate(0, ${steam1.y}) scale(${steam1.scale})`}
            style={{ transformOrigin: "165px 95px" }}
          />
        )}
        {steam2.opacity > 0 && (
          <path
            d="M 200 90 Q 190 75, 200 60 T 200 40"
            fill="none"
            stroke="#E2E8F0"
            strokeWidth="2"
            strokeLinecap="round"
            opacity={steam2.opacity}
            transform={`translate(0, ${steam2.y}) scale(${steam2.scale})`}
            style={{ transformOrigin: "200px 90px" }}
          />
        )}
        {steam3.opacity > 0 && (
          <path
            d="M 235 95 Q 225 80, 235 65 T 235 45"
            fill="none"
            stroke="#E2E8F0"
            strokeWidth="2"
            strokeLinecap="round"
            opacity={steam3.opacity}
            transform={`translate(0, ${steam3.y}) scale(${steam3.scale})`}
            style={{ transformOrigin: "235px 95px" }}
          />
        )}

        {/* Suspended Hand Group */}
        <g
          transform={`translate(${handX}, 0) rotate(${handRotate}, 260, 160)`}
        >
          {/* Hand outlines */}
          <path
            d="M 330 160 C 310 158, 290 156, 275 155 C 263 154, 258 150, 256 150 C 253 150, 250 154, 253 157 C 256 160, 264 165, 275 167 M 275 167 C 280 169, 290 172, 330 175"
            fill="none"
            stroke="#CBD5E1"
            strokeWidth="3.5"
            strokeLinecap="round"
          />
          <path d="M 264 154 C 260 156, 258 160, 262 163" fill="none" stroke="#CBD5E1" strokeWidth="3.5" />
          <path d="M 268 156 C 265 159, 264 163, 267 165" fill="none" stroke="#CBD5E1" strokeWidth="3.5" />
        </g>

        {/* Dynamic Warning text */}
        {alertOpacity > 0 && (
          <g
            opacity={alertOpacity}
            transform={`translate(200, 110) scale(${alertScale})`}
            style={{ transformOrigin: "0 0" }}
          >
            <rect x="-35" y="-60" width="70" height="22" rx="4" fill="#EF4444" />
            <text
              x="0"
              y="-46"
              fill="#FFFFFF"
              fontFamily={outfitFont}
              fontSize="10"
              fontWeight="bold"
              textAnchor="middle"
            >
              🔥 HOT!
            </text>
          </g>
        )}

        {/* Text instructions */}
        <g opacity={0.6} fontFamily={outfitFont} fontSize="8" fill="#94A3B8" fontWeight="bold">
          <text x="30" y="35">1. CaO chunks added</text>
          <text x="30" y="50">2. Water reacts exothermically</text>
          <text x="30" y="65">3. Beaker gets hot to touch</text>
        </g>
      </svg>
    </div>
  );
};
