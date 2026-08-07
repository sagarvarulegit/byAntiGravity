import React from "react";
import { useCurrentFrame, interpolate } from "remotion";

export const LensSignDiagram: React.FC = () => {
  const frame = useCurrentFrame();

  const rayProgress = interpolate(frame, [10, 45], [0, 1], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });

  const dimOpacity = interpolate(frame, [30, 55], [0, 1], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });
  const dimScale = interpolate(frame, [30, 55], [0.8, 1], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });

  const pulse = Math.sin(frame * 0.1) * 0.2 + 0.8;

  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 1000 960"
      width="100%"
      height="100%"
      style={{ backgroundColor: "#0F172A", fontFamily: "system-ui, -apple-system, sans-serif" }}
    >
      <defs>
        <marker id="arrow-ray" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
          <path d="M 0 1 L 10 5 L 0 9 z" fill="#FACC15" />
        </marker>
        <marker id="arrow-dim-red" viewBox="0 0 10 10" refX="5" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
          <path d="M 0 1 L 10 5 L 0 9 z" fill="#EF4444" />
        </marker>
        <marker id="arrow-dim-green" viewBox="0 0 10 10" refX="5" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
          <path d="M 0 1 L 10 5 L 0 9 z" fill="#10B981" />
        </marker>
        <filter id="glow-ray" x="-20%" y="-20%" width="140%" height="140%">
          <feGaussianBlur stdDeviation="3" result="blur" />
          <feComposite in="SourceGraphic" in2="blur" operator="over" />
        </filter>
      </defs>

      {/* ==================== PANEL 1: CONVEX LENS ==================== */}
      <g id="convex-panel">
        <rect x="20" y="20" width="960" height="440" rx="24" fill="#1E293B" stroke="#334155" strokeWidth="3" />
        <rect x="40" y="40" width="360" height="44" rx="12" fill="#0284C7" />
        <text x="55" y="70" fill="#FFFFFF" fontSize="22" fontWeight="800" letterSpacing="0.5">
          CONVEX LENS (Converging)
        </text>

        <line x1="50" y1="230" x2="950" y2="230" stroke="#64748B" strokeWidth="3" strokeDasharray="8 6" />
        <text x="920" y="220" fill="#94A3B8" fontSize="16" fontWeight="600">Axis</text>

        <path d="M 500 110 Q 545 230 500 350 Q 455 230 500 110 Z" fill="rgba(56, 189, 248, 0.2)" stroke="#38BDF8" strokeWidth="4" />
        <line x1="500" y1="110" x2="500" y2="350" stroke="#38BDF8" strokeWidth="2" strokeDasharray="4 4" opacity="0.6" />

        <circle cx="500" cy="230" r="7" fill="#F59E0B" stroke="#FFFFFF" strokeWidth="2" />
        <text x="500" y="260" fill="#F8FAFC" fontSize="20" fontWeight="800" textAnchor="middle">O</text>

        <circle cx="330" cy="230" r="6" fill="#38BDF8" />
        <text x="330" y="260" fill="#38BDF8" fontSize="18" fontWeight="700" textAnchor="middle">F₁</text>

        <circle cx="670" cy="230" r={8 * pulse} fill="#10B981" filter="url(#glow-ray)" />
        <text x="670" y="260" fill="#10B981" fontSize="20" fontWeight="900" textAnchor="middle">F₂ (Focus)</text>

        {/* Object */}
        <g transform="translate(180, 230)">
          <line x1="0" y1="0" x2="0" y2="-90" stroke="#F97316" strokeWidth="6" strokeLinecap="round" />
          <polygon points="0,-102 -10,-88 10,-88" fill="#F97316" />
          <text x="0" y="-112" fill="#F97316" fontSize="18" fontWeight="900" textAnchor="middle">OBJECT</text>
        </g>

        {/* EXACTLY 3 LIGHT RAYS (Progressive Draw) */}
        <g opacity={rayProgress}>
          {/* Ray 1: Top Parallel -> Refracts through F2 */}
          <path d="M 180 140 L 500 140 L 900 351.8" fill="none" stroke="#FACC15" strokeWidth="4" filter="url(#glow-ray)" pathLength="1" strokeDasharray="1" strokeDashoffset={1 - rayProgress} />
          
          {/* Ray 2: Center Ray through O */}
          <path d="M 180 140 L 500 230 L 900 342.5" fill="none" stroke="#FACC15" strokeWidth="4" filter="url(#glow-ray)" pathLength="1" strokeDasharray="1" strokeDashoffset={1 - rayProgress} />

          {/* Ray 3: Through F1 -> Refracts Parallel */}
          <path d="M 180 140 L 330 230 L 500 332 L 900 332" fill="none" stroke="#FACC15" strokeWidth="4" filter="url(#glow-ray)" pathLength="1" strokeDasharray="1" strokeDashoffset={1 - rayProgress} />
        </g>
        
        {/* Draw arrows independently to avoid dashoffset clipping issues on markers */}
        <g opacity={rayProgress > 0.5 ? (rayProgress - 0.5) * 2 : 0}>
          <polygon points="340,140 330,135 330,145" fill="#FACC15" />
          <polygon points="670,230.1 661,223.5 656,232.5" fill="#FACC15" transform="rotate(27.9 670 230.1)" />
          <polygon points="340,185 330.5,182.5 335.5,191.5" fill="#FACC15" transform="rotate(15.7 340 185)" />
          <polygon points="255,185 245,181 251,190" fill="#FACC15" transform="rotate(31 255 185)" />
          <polygon points="700,332 690,327 690,337" fill="#FACC15" />
        </g>

        {/* Real Image */}
        <g transform="translate(863, 230)" opacity={rayProgress}>
          <line x1="0" y1="0" x2="0" y2="92" stroke="#EC4899" strokeWidth="6" strokeLinecap="round" />
          <polygon points="0,102 -10,88 10,88" fill="#EC4899" />
          <text x="0" y="122" fill="#EC4899" fontSize="16" fontWeight="800" textAnchor="middle">Real Image</text>
        </g>

        {/* DIMENSION LINE 1: OBJECT DISTANCE (u) */}
        <g transform="translate(0, 390)" opacity={dimOpacity} style={{ transform: `scale(${dimScale})`, transformOrigin: "340px 390px" }}>
          <line x1="180" y1="0" x2="500" y2="0" stroke="#EF4444" strokeWidth="3" markerStart="url(#arrow-dim-red)" markerEnd="url(#arrow-dim-red)" />
          <line x1="180" y1="-12" x2="180" y2="12" stroke="#EF4444" strokeWidth="2" />
          <line x1="500" y1="-12" x2="500" y2="12" stroke="#EF4444" strokeWidth="2" />
          <rect x="230" y="-20" width="220" height="40" rx="20" fill="#EF4444" />
          <text x="340" y="6" fill="#FFFFFF" fontSize="17" fontWeight="900" textAnchor="middle">u = ALWAYS NEGATIVE (-)</text>
        </g>

        {/* DIMENSION LINE 2: FOCAL LENGTH (f) */}
        <g transform="translate(0, 390)" opacity={dimOpacity} style={{ transform: `scale(${dimScale})`, transformOrigin: "585px 390px" }}>
          <line x1="500" y1="0" x2="670" y2="0" stroke="#10B981" strokeWidth="3" markerStart="url(#arrow-dim-green)" markerEnd="url(#arrow-dim-green)" />
          <line x1="670" y1="-12" x2="670" y2="12" stroke="#10B981" strokeWidth="2" />
          <rect x="515" y="-20" width="140" height="40" rx="20" fill="#10B981" />
          <text x="585" y="6" fill="#FFFFFF" fontSize="17" fontWeight="900" textAnchor="middle">f = POSITIVE (+)</text>
        </g>
      </g>

      {/* ==================== PANEL 2: CONCAVE LENS ==================== */}
      <g id="concave-panel">
        <rect x="20" y="480" width="960" height="460" rx="24" fill="#1E293B" stroke="#334155" strokeWidth="3" />
        <rect x="40" y="500" width="360" height="44" rx="12" fill="#7C3AED" />
        <text x="55" y="530" fill="#FFFFFF" fontSize="22" fontWeight="800" letterSpacing="0.5">
          CONCAVE LENS (Diverging)
        </text>

        {/* Axis & Lens */}
        <line x1="50" y1="710" x2="950" y2="710" stroke="#64748B" strokeWidth="3" strokeDasharray="8 6" />
        <text x="920" y="700" fill="#94A3B8" fontSize="16" fontWeight="600">Axis</text>
        <path d="M 465 590 L 535 590 Q 508 710 535 830 L 465 830 Q 492 710 465 590 Z" fill="rgba(168, 85, 247, 0.2)" stroke="#A855F7" strokeWidth="4" />
        <line x1="500" y1="590" x2="500" y2="830" stroke="#A855F7" strokeWidth="2" strokeDasharray="4 4" opacity="0.6" />

        {/* Optical Center & Focal Points */}
        <circle cx="500" cy="710" r="7" fill="#F59E0B" stroke="#FFFFFF" strokeWidth="2" />
        <text x="500" y="740" fill="#F8FAFC" fontSize="20" fontWeight="800" textAnchor="middle">O</text>
        <circle cx="330" cy="710" r={8 * pulse} fill="#EF4444" filter="url(#glow-ray)" />
        <text x="330" y="740" fill="#EF4444" fontSize="20" fontWeight="900" textAnchor="middle">F₁ (Virtual Focus)</text>
        <circle cx="670" cy="710" r="6" fill="#A855F7" />
        <text x="670" y="740" fill="#A855F7" fontSize="18" fontWeight="700" textAnchor="middle">F₂</text>

        {/* Object */}
        <g transform="translate(180, 710)">
          <line x1="0" y1="0" x2="0" y2="-90" stroke="#F97316" strokeWidth="6" strokeLinecap="round" />
          <polygon points="0,-102 -10,-88 10,-88" fill="#F97316" />
          <text x="0" y="-112" fill="#F97316" fontSize="18" fontWeight="900" textAnchor="middle">OBJECT</text>
        </g>

        {/* EXACTLY 3 LIGHT RAYS (Progressive Draw) */}
        <g opacity={rayProgress}>
          {/* Ray 1: Top Parallel -> Diverges UPWARDS */}
          <path d="M 180 620 L 500 620 L 900 408.2" fill="none" stroke="#FACC15" strokeWidth="4" filter="url(#glow-ray)" pathLength="1" strokeDasharray="1" strokeDashoffset={1 - rayProgress} />
          {/* Ray 1 Virtual Trace */}
          <line x1="500" y1="620" x2="330" y2="710" stroke="#FACC15" strokeWidth="3" strokeDasharray="6 4" opacity={rayProgress} />

          {/* Ray 2: Center Ray through O */}
          <path d="M 180 620 L 500 710 L 900 822.5" fill="none" stroke="#FACC15" strokeWidth="4" filter="url(#glow-ray)" pathLength="1" strokeDasharray="1" strokeDashoffset={1 - rayProgress} />

          {/* Ray 3: Towards F2 -> Refracts Parallel */}
          <path d="M 180 620 L 500 679 L 900 679" fill="none" stroke="#FACC15" strokeWidth="4" filter="url(#glow-ray)" pathLength="1" strokeDasharray="1" strokeDashoffset={1 - rayProgress} />
          {/* Ray 3 Virtual Trace */}
          <line x1="500" y1="679" x2="330" y2="679" stroke="#FACC15" strokeWidth="3" strokeDasharray="6 4" opacity={rayProgress} />
        </g>

        {/* Arrows for Concave rays */}
        <g opacity={rayProgress > 0.5 ? (rayProgress - 0.5) * 2 : 0}>
          <polygon points="340,620 330,615 330,625" fill="#FACC15" />
          <polygon points="700,514 695,524 703,524" fill="#FACC15" transform="rotate(27.9 700 514)" />
          
          <polygon points="340,665 333,656 342,656" fill="#FACC15" transform="rotate(-15.7 340 665)" />
          
          <polygon points="340,649 333,640 342,640" fill="#FACC15" transform="rotate(-10.4 340 649)" />
          <polygon points="700,679 690,674 690,684" fill="#FACC15" />
        </g>

        {/* Virtual Image */}
        <g transform="translate(389, 710)" opacity={rayProgress}>
          <line x1="0" y1="0" x2="0" y2="-21" stroke="#38BDF8" strokeWidth="4" strokeDasharray="4 3" />
          <polygon points="0,-31 -7,-19 7,-19" fill="#38BDF8" />
          <text x="0" y="-39" fill="#38BDF8" fontSize="15" fontWeight="800" textAnchor="middle">Virtual Img</text>
        </g>

        {/* DIMENSION LINE 2: FOCAL LENGTH (f) - placed higher so it doesn't overlap u */}
        <g transform="translate(0, 800)" opacity={dimOpacity} style={{ transform: `scale(${dimScale})`, transformOrigin: "415px 800px" }}>
          <line x1="330" y1="0" x2="500" y2="0" stroke="#EF4444" strokeWidth="3" markerStart="url(#arrow-dim-red)" markerEnd="url(#arrow-dim-red)" />
          <line x1="330" y1="-12" x2="330" y2="12" stroke="#EF4444" strokeWidth="2" />
          <line x1="500" y1="-12" x2="500" y2="12" stroke="#EF4444" strokeWidth="2" />
          <rect x="305" y="-20" width="220" height="40" rx="20" fill="#EF4444" />
          <text x="415" y="6" fill="#FFFFFF" fontSize="17" fontWeight="900" textAnchor="middle">f = ALWAYS NEGATIVE (-)</text>
        </g>

        {/* DIMENSION LINE 1: OBJECT DISTANCE (u) - placed lower */}
        <g transform="translate(0, 870)" opacity={dimOpacity} style={{ transform: `scale(${dimScale})`, transformOrigin: "340px 870px" }}>
          <line x1="180" y1="0" x2="500" y2="0" stroke="#EF4444" strokeWidth="3" markerStart="url(#arrow-dim-red)" markerEnd="url(#arrow-dim-red)" />
          <line x1="180" y1="-12" x2="180" y2="12" stroke="#EF4444" strokeWidth="2" />
          <line x1="500" y1="-12" x2="500" y2="12" stroke="#EF4444" strokeWidth="2" />
          <rect x="230" y="-20" width="220" height="40" rx="20" fill="#EF4444" />
          <text x="340" y="6" fill="#FFFFFF" fontSize="17" fontWeight="900" textAnchor="middle">u = ALWAYS NEGATIVE (-)</text>
        </g>
      </g>
    </svg>
  );
};
