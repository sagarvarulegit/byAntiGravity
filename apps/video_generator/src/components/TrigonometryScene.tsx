import {
  AbsoluteFill,
  useCurrentFrame,
  useVideoConfig,
  interpolate,
  Audio,
  staticFile,
  Interactive,
} from "remotion";
import { WordAlignment } from "../data/schema";
import { animeFont, outfitFont } from "../theme";

// ---------- Palette (Maths brand: Electric Cyan #FBBF24) ----------
const C = {
  cyan: "#FBBF24",
  red: "#ef4444",
  green: "#84CC16",
  amber: "#F59E0B",
  violet: "#A78BFA",
  slate: "#94A3B8",
  white: "#ffffff",
  dark: "#1E293B",
};

// ---------- Shared helpers ----------
const getStartFrame = (
  alignments: WordAlignment[] | undefined,
  targetWord: string,
  fallbackFrame: number,
  fps: number = 30,
) => {
  if (!alignments) return fallbackFrame;
  const match = alignments.find((a) =>
    a.word.toLowerCase().includes(targetWord.toLowerCase()),
  );
  if (match) return Math.round(match.start * fps);
  return fallbackFrame;
};

// Monotonic progress helper (guards against degenerate interpolate ranges)
const p = (frame: number, start: number, end: number) => {
  if (end <= start) return frame >= start ? 1 : 0;
  return interpolate(frame, [start, end], [0, 1], {
    extrapolateRight: "clamp",
    extrapolateLeft: "clamp",
  });
};

const lerp = (a: number, b: number, t: number) => a + (b - a) * t;

// SVG circular arc path from angle a0 to a1 (degrees; 0 = right, clockwise positive in y-down).
const arc = (
  cx: number,
  cy: number,
  r: number,
  a0: number,
  a1: number,
  sweep: number = 1,
) => {
  const rad = (d: number) => (d * Math.PI) / 180;
  const x0 = cx + r * Math.cos(rad(a0));
  const y0 = cy + r * Math.sin(rad(a0));
  const x1 = cx + r * Math.cos(rad(a1));
  const y1 = cy + r * Math.sin(rad(a1));
  return `M ${x0.toFixed(1)} ${y0.toFixed(1)} A ${r} ${r} 0 0 ${sweep} ${x1.toFixed(1)} ${y1.toFixed(1)}`;
};

// ---------- Shared lighthouse diagram geometry (canvas 800x600) ----------
// Beacon = lantern of the lighthouse SVG (image at 20,140 sized 200x200)
const B = { x: 80, y: 270 };
const SEA_Y = 470;
// Near ship: 60° depression. Far ship: 30° depression. Laser endpoints land at the waterline.
const S1 = { x: 260, y: 415, w: 90, h: 60 };
const S2 = { x: 625, y: 405, w: 110, h: 80 };

const SeaAndLighthouse: React.FC<{ beaconGlow?: number }> = ({
  beaconGlow = 1,
}) => (
  <>
    <rect x="0" y={SEA_Y} width="800" height="130" fill="#020617" rx="10" />
    <Interactive.G name="Sea Waves">
      <image
        href={staticFile("images/sea-waves-svgrepo-com.svg")}
        x="0"
        y="430"
        width="800"
        height="170"
        preserveAspectRatio="none"
        style={{ filter: "drop-shadow(0 -10px 20px #FBBF24) brightness(0.8)" }}
      />
    </Interactive.G>
    <Interactive.G
      name="Lighthouse Structure"
      style={{
        rotate: "-0.1deg",
        scale: 0.985,
      }}
    >
      <image
        href={staticFile("images/lighthouse-svgrepo-com.svg")}
        x="20"
        y="140"
        width="200"
        height="450"
        style={{ filter: "drop-shadow(0 0 10px #FBBF24) brightness(1.5)" }}
      />
    </Interactive.G>
    <Interactive.G name="Beacon Glow">
      <circle
        cx={B.x}
        cy={B.y}
        r="12"
        fill="#FBBF24"
        opacity={0.5 + 0.5 * Math.abs(Math.sin(beaconGlow * 0.1))}
        style={{ filter: "drop-shadow(0 0 20px #FBBF24)" }}
      />
    </Interactive.G>
  </>
);

const Ship: React.FC<{
  src: string;
  x: number;
  y: number;
  w: number;
  h: number;
  opacity?: number;
  name?: string;
}> = ({ src, x, y, w, h, opacity = 1, name = "Ship" }) => (
  <Interactive.G
    name={name}
    style={{
      translate: "1.4px -6.4px",
      scale: 0.978,
    }}
  >
    <image
      href={staticFile(src)}
      x={x}
      y={y}
      width={w}
      height={h}
      style={{ filter: "brightness(1.5)", opacity }}
    />
  </Interactive.G>
);

// Depression arcs at the beacon (r=60 → 60°, r=45 → 30°) + labels
const BeaconArcs: React.FC<{
  show60: number;
  show30: number;
  labelSize?: number;
}> = ({ show60, show30, labelSize = 22 }) => (
  <>
    {show30 > 0 && (
      <Interactive.G name="30° Depression Arc" opacity={show30}>
        <path
          d={arc(B.x, B.y, 45, 0, 30)}
          fill="none"
          stroke={C.green}
          strokeWidth="3"
          strokeDasharray="4 4"
        />
        <text
          x={159}
          y={180}
          fontFamily={outfitFont}
          fontSize={labelSize}
          fontWeight="900"
          fill={C.green}
          textAnchor="middle"
        >
          30°
        </text>
      </Interactive.G>
    )}
    {show60 > 0 && (
      <Interactive.G name="60° Depression Arc" opacity={show60}>
        <path
          d={arc(B.x, B.y, 60, 0, 60)}
          fill="none"
          stroke={C.red}
          strokeWidth="3"
          strokeDasharray="4 4"
        />
        <text
          x={144}
          y={228}
          fontFamily={outfitFont}
          fontSize={labelSize}
          fontWeight="900"
          fill={C.red}
          textAnchor="middle"
        >
          60°
        </text>
      </Interactive.G>
    )}
  </>
);

const MeasurementLabels: React.FC<{ opacity: number; labelSize?: number }> = ({
  opacity,
  labelSize = 22,
}) => (
  <Interactive.G name="Measurement Labels (x, x+y)" opacity={opacity}>
    <line
      x1={B.x}
      y1="502"
      x2={S2.x}
      y2="502"
      stroke={C.white}
      strokeWidth="2"
      strokeDasharray="8 6"
      opacity="0.7"
    />
    <line
      x1={B.x}
      y1="496"
      x2={B.x}
      y2="508"
      stroke={C.white}
      strokeWidth="2"
      opacity="0.7"
    />
    <line
      x1={S1.x}
      y1="496"
      x2={S1.x}
      y2="508"
      stroke={C.white}
      strokeWidth="2"
      opacity="0.7"
    />
    <line
      x1={S2.x}
      y1="496"
      x2={S2.x}
      y2="508"
      stroke={C.white}
      strokeWidth="2"
      opacity="0.7"
    />
    <text
      x={lerp(B.x, S1.x, 0.5)}
      y="530"
      fontFamily={outfitFont}
      fontSize={labelSize}
      fontWeight="900"
      fill={C.cyan}
      textAnchor="middle"
    >
      x
    </text>
    <text
      x={lerp(S1.x, S2.x, 0.5)}
      y="530"
      fontFamily={outfitFont}
      fontSize={labelSize}
      fontWeight="900"
      fill={C.cyan}
      textAnchor="middle"
    >
      x + y
    </text>
  </Interactive.G>
);

export const TrigonometryScene: React.FC<{
  title: string;
  subtitle?: string;
  variant?:
    | "intro"
    | "quest"
    | "angle_definition"
    | "lighthouse_real"
    | "lighthouse_abstract"
    | "lighthouse_proximity"
    | "lighthouse_solve"
    | "boss_end";
  audio?: string;
  alignments?: WordAlignment[];
}> = ({ title, subtitle, variant, audio, alignments }) => {
  const frame = useCurrentFrame();
  const { fps, width: vw, height: vh } = useVideoConfig();
  const portrait = vh > vw;

  // ================= INTRO (roadmap) anchors =================
  const chip1F = getStartFrame(alignments, "one", 20, fps);
  const chip2F = getStartFrame(alignments, "two", 70, fps);
  const chip3F = getStartFrame(alignments, "three", 120, fps);
  const chip4F = getStartFrame(alignments, "four", 170, fps);
  const chip5F = getStartFrame(alignments, "five", 220, fps);
  const chip6F = getStartFrame(alignments, "six", 270, fps);
  const goF = getStartFrame(alignments, "boss", 330, fps);
  const goP = p(frame, goF, goF + 20);

  // ================= QUEST (problem statement) anchors =================
  const qLine1F = getStartFrame(alignments, "75", 40, fps);
  const qLine2F = getStartFrame(alignments, "60", 140, fps);
  const qLine3F = getStartFrame(alignments, "same", 240, fps);
  const qFindF = getStartFrame(alignments, "find", 320, fps);
  const qAcceptF = getStartFrame(alignments, "accepted", 400, fps);
  const qLine1P = p(frame, qLine1F, qLine1F + 20);
  const qLine2P = p(frame, qLine2F, qLine2F + 20);
  const qLine3P = p(frame, qLine3F, qLine3F + 20);
  const qFindP = p(frame, qFindF, qFindF + 20);
  const qAcceptP = p(frame, qAcceptF, qAcceptF + 20);

  // ================= ANGLE DEFINITION anchors =================
  const defHorizonF = getStartFrame(alignments, "horizon", 60, fps);
  const defBoatF = getStartFrame(alignments, "boat", 200, fps);
  const defCalledF = getStartFrame(alignments, "called", 320, fps);
  const defGoldenF = getStartFrame(alignments, "golden", 440, fps);
  const defVerticalF = getStartFrame(alignments, "vertical", 500, fps);
  const defHorizonP = p(frame, defHorizonF, defHorizonF + 25);
  const defBoatP = p(frame, defBoatF, defBoatF + 25);
  const defArcP = p(frame, defCalledF, defCalledF + 25);
  const defGoldenP = p(frame, defGoldenF, defGoldenF + 20);
  const defWrongP = p(frame, defVerticalF, defVerticalF + 20);

  // ================= LIGHTHOUSE REAL anchors =================
  const meterF = getStartFrame(alignments, "75", 30, fps);
  const ship1F = getStartFrame(alignments, "close", 158, fps);
  const ship2F = getStartFrame(alignments, "far", 226, fps);
  const sightF = getStartFrame(alignments, "before", 90, fps);
  const steepF = getStartFrame(alignments, "steep", 180, fps);
  const ang30F = getStartFrame(alignments, "further", 300, fps);
  const distF = getStartFrame(alignments, "distances", 420, fps);

  // ================= ABSTRACT / Z-TRICK anchors =================
  const depressionF = getStartFrame(alignments, "drawn", 20, fps);
  const impossibleF = getStartFrame(alignments, "impossible", 121, fps);
  const zRuleF = getStartFrame(alignments, "trick", 235, fps);
  const parallelF = getStartFrame(alignments, "parallel", 340, fps);
  const traceF = getStartFrame(alignments, "trace", 401, fps);
  const identicalF = getStartFrame(alignments, "identical", 708, fps);
  const slidesF = getStartFrame(alignments, "slides", 814, fps);
  const elevationF = getStartFrame(alignments, "elevation", 898, fps);
  const activatedF = getStartFrame(alignments, "activated", 958, fps);

  // ================= PROXIMITY anchors =================
  const swapF = getStartFrame(alignments, "swap", 15, fps);
  const closerF = getStartFrame(alignments, "closer", 180, fps);
  const craneF = getStartFrame(alignments, "crane", 300, fps);
  const biggerF = getStartFrame(alignments, "bigger", 350, fps);
  const finalF = getStartFrame(alignments, "final", 420, fps);

  // ================= SOLVE anchors =================
  const step1F = getStartFrame(alignments, "first", 30, fps);
  const xValF = getStartFrame(alignments, "25", 150, fps);
  const step2F = getStartFrame(alignments, "second", 260, fps);
  const xyValF = getStartFrame(alignments, "129", 380, fps);
  const step3F = getStartFrame(alignments, "three", 520, fps);
  const yValF = getStartFrame(alignments, "50", 640, fps);
  const answerF = getStartFrame(alignments, "final", 760, fps);
  const securedF = getStartFrame(alignments, "secured", 900, fps);

  // ================= BOSS END anchors =================
  const defeatedF = getStartFrame(alignments, "defeated", 15, fps);
  const marksF = getStartFrame(alignments, "secured", 60, fps);
  const rec1F = getStartFrame(alignments, "invisible", 150, fps);
  const rec2F = getStartFrame(alignments, "trick", 230, fps);
  const rec3F = getStartFrame(alignments, "root", 300, fps);
  const rec4F = getStartFrame(alignments, "closer", 380, fps);
  const nextF = getStartFrame(alignments, "next", 460, fps);

  // ---------- computed animation values ----------
  const sightDraw = p(frame, sightF, sightF + 20);
  const laser1P = p(frame, steepF, steepF + 22);
  const laser2P = p(frame, ang30F, ang30F + 22);
  const arcs60P = p(frame, steepF + 10, steepF + 30);
  const arcs30P = p(frame, ang30F + 10, ang30F + 30);
  const distP = p(frame, distF, distF + 20);

  // ship popping progress (0 -> 1 -> 0 over 15 frames)
  const ship1Pop = Math.sin(p(frame, ship1F, ship1F + 15) * Math.PI);
  const ship2Pop = Math.sin(p(frame, ship2F, ship2F + 15) * Math.PI);

  // Z-trick
  const zDraw = p(frame, traceF, traceF + 40);
  const impossibleP = p(frame, impossibleF, impossibleF + 20);
  const traceT = p(frame, traceF, traceF + 45);
  const zShipPop = Math.sin(p(frame, traceF + 30, traceF + 45) * Math.PI);
  const identicalP = p(frame, identicalF, identicalF + 25);
  const slideT = p(frame, slidesF, slidesF + 45);
  const landP = p(frame, elevationF, elevationF + 15);
  const activatedP = p(frame, activatedF, activatedF + 20);
  const pulse = 0.55 + 0.45 * Math.abs(Math.sin(frame * 0.25));
  // slide the top depression angle down the laser to the (near) ship corner
  const thetaX = lerp(B.x, S1.x, slideT);
  const thetaY = lerp(B.y, SEA_Y, slideT);

  // Proximity
  const glideT = p(frame, closerF, closerF + 90);
  const shipX = lerp(S2.x, S1.x, glideT);
  const angleNow = lerp(30, 60, glideT);
  const warningP = p(frame, swapF, swapF + 18);
  const readoutP = p(frame, closerF - 10, closerF);
  const craneP = p(frame, craneF, craneF + 30);
  const biggerP = p(frame, biggerF, biggerF + 18);
  const cheatP = p(frame, finalF, finalF + 18);

  // Solve
  const step1P = p(frame, step1F, step1F + 20);
  const xValP = p(frame, xValF, xValF + 20);
  const step2P = p(frame, step2F, step2F + 20);
  const xyValP = p(frame, xyValF, xyValF + 20);
  const step3P = p(frame, step3F, step3F + 20);
  const yValP = p(frame, yValF, yValF + 20);
  const answerP = p(frame, answerF, answerF + 25);
  const stampP = p(frame, securedF, securedF + 20);

  // Boss end
  const defeatedP = p(frame, defeatedF, defeatedF + 25);
  const marksP = p(frame, marksF, marksF + 20);
  const rec1P = p(frame, rec1F, rec1F + 20);
  const rec2P = p(frame, rec2F, rec2F + 20);
  const rec3P = p(frame, rec3F, rec3F + 20);
  const rec4P = p(frame, rec4F, rec4F + 20);
  const nextP = p(frame, nextF, nextF + 20);

  // Roadmap chips (intro)
  const chips = [
    {
      f: chip1F,
      color: C.cyan,
      num: "1",
      title: "Real Setup",
      sub: "75 m lighthouse",
    },
    {
      f: chip2F,
      color: C.red,
      num: "2",
      title: "Invisible Line",
      sub: "line of sight",
    },
    {
      f: chip3F,
      color: C.green,
      num: "3",
      title: "The Z-Trick",
      sub: "slide the angle",
    },
    {
      f: chip4F,
      color: C.amber,
      num: "4",
      title: "Proximity Rule",
      sub: "closer = bigger",
    },
    {
      f: chip5F,
      color: C.violet,
      num: "5",
      title: "Cheat Codes",
      sub: "√3 = 60°, 1/√3 = 30°",
    },
    {
      f: chip6F,
      color: C.cyan,
      num: "6",
      title: "5-Mark Boss Solve",
      sub: "distance between ships",
    },
  ];

  return (
    <AbsoluteFill
      style={{
        background:
          "radial-gradient(circle at center, #121212 0%, #000000 100%)",
        color: "white",
        padding: 60,
        fontFamily: outfitFont,
      }}
    >
      {audio && <Audio src={staticFile(audio)} />}

      {/* HEADER (hidden on boss_end full-canvas layout) */}
      {variant !== "boss_end" && (
        <Interactive.Div
          name="Header Container"
          style={{
            position: "absolute",
            top: 40,
            left: 60,
            right: 60,
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <div>
            <Interactive.H1
              name="Scene Main Title"
              style={{
                fontSize: 60,
                color: "#FBBF24",
                margin: 0,
                fontWeight: 900,
                textShadow: "0 0 20px rgba(6, 182, 212, 0.5)",
              }}
            >
              {title}
            </Interactive.H1>
            {subtitle && (
              <Interactive.H2
                name="Scene Subtitle"
                style={{
                  fontSize: 36,
                  color: "#cbd5e1",
                  margin: 0,
                  fontWeight: 300,
                }}
              >
                {subtitle}
              </Interactive.H2>
            )}
          </div>
        </Interactive.Div>
      )}

      {/* TWO-PANEL CANVAS: text/explanation/formulas LEFT, visual/animation RIGHT (portrait reels stack vertically) */}
      <div
        style={{
          position: "absolute",
          top: variant === "boss_end" ? 0 : 150,
          left: 60,
          right: 60,
          bottom: 60,
          display: "flex",
          gap: 40,
          flexDirection: portrait ? "column" : "row",
        }}
      >
        {/* ==================== LEFT: TEXT PANEL ==================== */}
        {variant !== "boss_end" && (
          <div
            style={{
              width: portrait ? "100%" : 560,
              display: "flex",
              flexDirection: "column",
              justifyContent: "center",
              gap: 26,
              minWidth: 0,
            }}
          >
            {variant === "quest" && (
              <>
                <Interactive.Div
                  name="Quest Card Container"
                  style={{
                    opacity: 1,
                    border: `2px solid ${C.cyan}`,
                    borderRadius: 24,
                    backgroundColor: "rgba(30,41,59,0.92)",
                    padding: "34px 30px",
                    display: "flex",
                    flexDirection: "column",
                    gap: 24,
                    boxShadow: "0 0 24px rgba(6,182,212,0.25)",
                  }}
                >
                  <Interactive.Div
                    name="Boss Question Badge"
                    style={{
                      alignSelf: "flex-start",
                      backgroundColor: C.red,
                      color: "#0F172A",
                      fontFamily: animeFont,
                      fontSize: 28,
                      letterSpacing: 2,
                      padding: "8px 20px",
                      borderRadius: 10,
                    }}
                  >
                    THE BOSS QUESTION
                  </Interactive.Div>
                  <Interactive.Div
                    name="Quest Text Line 1"
                    style={{
                      opacity: qLine1P,
                      fontSize: 30,
                      fontWeight: 700,
                      lineHeight: 1.3,
                    }}
                  >
                    From the top of a 75 m high lighthouse,
                  </Interactive.Div>
                  <Interactive.Div
                    name="Quest Text Line 2"
                    style={{
                      opacity: qLine2P,
                      fontSize: 30,
                      fontWeight: 700,
                      lineHeight: 1.3,
                    }}
                  >
                    angles of depression of two ships are 60° and 30°.
                  </Interactive.Div>
                  <Interactive.Div
                    name="Quest Text Line 3"
                    style={{
                      opacity: qLine3P,
                      fontSize: 25,
                      fontWeight: 500,
                      color: C.slate,
                    }}
                  >
                    Both ships, same side of the lighthouse.
                  </Interactive.Div>
                  <Interactive.Div
                    name="Quest Target Text"
                    style={{
                      opacity: qFindP,
                      fontSize: 34,
                      fontWeight: 900,
                      color: C.cyan,
                      textShadow: "0 0 14px rgba(6,182,212,0.6)",
                    }}
                  >
                    FIND: distance between the ships
                  </Interactive.Div>
                </Interactive.Div>
                {qAcceptP > 0 && (
                  <GameStamp opacity={qAcceptP} color={C.green} size={44}>
                    QUEST ACCEPTED!
                  </GameStamp>
                )}
              </>
            )}

            {variant === "intro" && (
              <>
                {chips.map((chip) => {
                  const chipP = p(frame, chip.f, chip.f + 25);
                  return (
                    <Interactive.Div
                      name={`Intro Topic ${chip.num}: ${chip.title}`}
                      key={chip.num}
                      style={{
                        opacity: chipP,
                        display: "flex",
                        alignItems: "center",
                        gap: 18,
                        border: `2px solid ${chip.color}`,
                        borderRadius: 16,
                        backgroundColor: "rgba(30,41,59,0.85)",
                        padding: "12px 20px",
                        boxShadow: `0 0 12px ${chip.color}55`,
                      }}
                    >
                      <div
                        style={{
                          width: 44,
                          height: 44,
                          borderRadius: 22,
                          backgroundColor: chip.color,
                          color: "#0F172A",
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          fontSize: 24,
                          fontWeight: 900,
                          flexShrink: 0,
                        }}
                      >
                        {chip.num}
                      </div>
                      <div>
                        <div style={{ fontSize: 27, fontWeight: 900 }}>
                          {chip.title}
                        </div>
                        <div
                          style={{
                            fontSize: 20,
                            fontWeight: 400,
                            color: C.slate,
                          }}
                        >
                          {chip.sub}
                        </div>
                      </div>
                    </Interactive.Div>
                  );
                })}
                {goP > 0 && (
                  <GameStamp opacity={goP} color={C.green} size={38}>
                    LET'S GO!
                  </GameStamp>
                )}
              </>
            )}

            {variant === "angle_definition" && (
              <>
                <PanelLine
                  opacity={p(frame, defHorizonF, defHorizonF + 20)}
                  accent={C.cyan}
                >
                  Look straight out — horizontal line of sight
                </PanelLine>
                <PanelLine
                  opacity={p(frame, defBoatF, defBoatF + 20)}
                  accent={C.white}
                >
                  Look DOWN at the boat below
                </PanelLine>
                <PanelLine
                  opacity={p(frame, defCalledF, defCalledF + 20)}
                  accent={C.cyan}
                  size={28}
                >
                  Angle between them = ANGLE OF DEPRESSION
                </PanelLine>
                {defGoldenP > 0 && (
                  <ChipCard
                    color={C.amber}
                    label="GOLDEN RULE"
                    opacity={defGoldenP}
                  >
                    Measure from HORIZONTAL — never from the vertical wall
                  </ChipCard>
                )}
              </>
            )}

            {variant === "lighthouse_real" && (
              <>
                <PanelLine
                  opacity={p(frame, meterF, meterF + 20)}
                  accent="#FFFFFF"
                >
                  75 m — lighthouse height
                </PanelLine>
                <PanelLine opacity={p(frame, sightF, sightF + 20)}>
                  Draw the horizontal line of sight first
                </PanelLine>
                <PanelLine
                  opacity={p(frame, steepF, steepF + 20)}
                  accent={C.red}
                >
                  Ship 1 · 60° — steep look down
                </PanelLine>
                <PanelLine
                  opacity={p(frame, ang30F, ang30F + 20)}
                  accent={C.green}
                >
                  Ship 2 · 30° — farther, smaller angle
                </PanelLine>
                <PanelLine
                  opacity={p(frame, distF, distF + 20)}
                  accent={C.cyan}
                  size={28}
                >
                  x → ship 1 , x + y → ship 2
                </PanelLine>
              </>
            )}

            {variant === "lighthouse_abstract" && (
              <>
                {impossibleP > 0 && (
                  <GameStamp opacity={impossibleP} color={C.red} size={42}>
                    IMPOSSIBLE TO SOLVE!
                  </GameStamp>
                )}
                {zDraw > 0.4 && (
                  <GameStamp
                    opacity={p(frame, zRuleF + 12, zRuleF + 32)}
                    color={C.cyan}
                    size={42}
                  >
                    Z-TRICK!
                  </GameStamp>
                )}
                {frame >= parallelF && (
                  <PanelLine
                    opacity={p(frame, parallelF, parallelF + 20)}
                    accent={C.amber}
                    size={27}
                  >
                    Line of sight ∥ sea floor → parallel lines
                  </PanelLine>
                )}
                {frame >= depressionF && (
                  <PanelLine opacity={1} accent={C.cyan} size={28}>
                    {frame < elevationF
                      ? "Depression (Outside) — drawn outside the triangle"
                      : "Elevation (Inside) — the angle slides down"}
                  </PanelLine>
                )}
                {identicalP > 0 && (
                  <PanelLine opacity={identicalP} accent={C.green} size={28}>
                    θ = θ — alternate interior angles are IDENTICAL
                  </PanelLine>
                )}
                {activatedP > 0 && (
                  <GameStamp opacity={activatedP} color={C.cyan} size={46}>
                    CHEAT CODE ACTIVATED!
                  </GameStamp>
                )}
              </>
            )}

            {variant === "lighthouse_proximity" && (
              <>
                {warningP > 0 && (
                  <GameStamp opacity={warningP} color={C.red} size={30}>
                    MISTAKE! 30° & 60° SWAPPED
                  </GameStamp>
                )}
                <PanelLine
                  opacity={p(frame, closerF, closerF + 20)}
                  accent={C.cyan}
                >
                  Closer you walk → more you crane your neck up
                </PanelLine>
                {biggerP > 0 && (
                  <ChipCard color={C.red} label="LEVEL UP!" opacity={biggerP}>
                    CLOSER = BIGGER ANGLE
                  </ChipCard>
                )}
                {cheatP > 0 && (
                  <ChipCard color={C.cyan} label="CHEAT CODE" opacity={cheatP}>
                    √3 = 60°, 1/√3 = 30°
                  </ChipCard>
                )}
              </>
            )}

            {variant === "lighthouse_solve" && (
              <>
                {step1P > 0 && (
                  <Interactive.Div
                    name="Step 1 - Near Ship Card"
                    style={{
                      opacity: step1P,
                      border: `2px solid ${C.cyan}`,
                      borderRadius: 16,
                      backgroundColor: "rgba(30,41,59,0.92)",
                      padding: "14px 20px",
                      display: "flex",
                      flexDirection: "column",
                      gap: 6,
                    }}
                  >
                    <div
                      style={{
                        fontSize: 17,
                        fontWeight: 900,
                        color: C.cyan,
                        letterSpacing: 1,
                      }}
                    >
                      STEP 1 - NEAR SHIP
                    </div>
                    <div style={{ fontSize: 26, fontWeight: 700 }}>
                      tan 60° = 75 / x
                    </div>
                    {xValP > 0 && (
                      <div
                        style={{
                          opacity: xValP,
                          fontSize: 22,
                          fontWeight: 900,
                          color: C.green,
                        }}
                      >
                        x = 25√3 ~ 43.3 m
                      </div>
                    )}
                  </Interactive.Div>
                )}
                {step2P > 0 && (
                  <Interactive.Div
                    name="Step 2 - Far Ship Card"
                    style={{
                      opacity: step2P,
                      border: `2px solid ${C.cyan}`,
                      borderRadius: 16,
                      backgroundColor: "rgba(30,41,59,0.92)",
                      padding: "14px 20px",
                      display: "flex",
                      flexDirection: "column",
                      gap: 6,
                    }}
                  >
                    <div
                      style={{
                        fontSize: 17,
                        fontWeight: 900,
                        color: C.cyan,
                        letterSpacing: 1,
                      }}
                    >
                      STEP 2 - FAR SHIP
                    </div>
                    <div style={{ fontSize: 24, fontWeight: 700 }}>
                      tan 30° = 75 / (x + y)
                    </div>
                    {xyValP > 0 && (
                      <div
                        style={{
                          opacity: xyValP,
                          fontSize: 22,
                          fontWeight: 900,
                          color: C.green,
                        }}
                      >
                        x + y = 75√3 ~ 129.9 m
                      </div>
                    )}
                  </Interactive.Div>
                )}
                {step3P > 0 && (
                  <Interactive.Div
                    name="Step 3 - Subtract Card"
                    style={{
                      opacity: step3P,
                      border: `2px solid ${C.cyan}`,
                      borderRadius: 16,
                      backgroundColor: "rgba(30,41,59,0.92)",
                      padding: "14px 20px",
                      display: "flex",
                      flexDirection: "column",
                      gap: 6,
                    }}
                  >
                    <div
                      style={{
                        fontSize: 17,
                        fontWeight: 900,
                        color: C.cyan,
                        letterSpacing: 1,
                      }}
                    >
                      STEP 3 - SUBTRACT
                    </div>
                    <div style={{ fontSize: 22, fontWeight: 700 }}>
                      y = (x + y) - x
                    </div>
                    {yValP > 0 && (
                      <div
                        style={{
                          opacity: yValP,
                          fontSize: 22,
                          fontWeight: 900,
                          color: C.green,
                        }}
                      >
                        y = 50√3 ~ 86.6 m
                      </div>
                    )}
                  </Interactive.Div>
                )}
                {answerP > 0 && (
                  <Interactive.Div
                    name="Final Answer Banner"
                    style={{
                      opacity: answerP,
                      border: `3px solid ${C.cyan}`,
                      borderRadius: 20,
                      backgroundColor: "rgba(6,182,212,0.12)",
                      padding: "18px 22px",
                      textAlign: "center",
                      boxShadow: "0 0 24px rgba(6,182,212,0.35)",
                    }}
                  >
                    <div
                      style={{ fontSize: 24, fontWeight: 700, color: C.slate }}
                    >
                      DISTANCE BETWEEN THE SHIPS
                    </div>
                    <div
                      style={{ fontSize: 42, fontWeight: 900, color: C.cyan }}
                    >
                      y = 50√3 m ~ 86.6 m
                    </div>
                  </Interactive.Div>
                )}
                {stampP > 0 && (
                  <GameStamp opacity={stampP} color={C.red} size={40}>
                    +5 MARKS SECURED
                  </GameStamp>
                )}
              </>
            )}
          </div>
        )}

        {/* ==================== RIGHT: VISUAL PANEL ==================== */}
        {variant !== "boss_end" && (
          <div
            style={{
              flex: 1,
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
              minWidth: 0,
              minHeight: 0,
            }}
          >
            <svg
              viewBox="0 0 800 600"
              width="100%"
              height="100%"
              preserveAspectRatio="xMidYMid meet"
              style={{ overflow: "visible" }}
            >
              {/* QUEST visual: the problem diagram */}
              {variant === "quest" && (
                <>
                  <SeaAndLighthouse beaconGlow={frame} />
                  {frame >= qLine1F && (
                    <g opacity={p(frame, qLine1F, qLine1F + 15)}>
                      <line
                        x1="26"
                        y1={B.y}
                        x2="26"
                        y2={SEA_Y}
                        stroke={C.white}
                        strokeWidth="3"
                        strokeDasharray="6 6"
                        opacity="0.8"
                      />
                      <text
                        x="20"
                        y="375"
                        textAnchor="end"
                        fontFamily={outfitFont}
                        fontSize="24"
                        fontWeight="900"
                        fill={C.white}
                      >
                        75 m
                      </text>
                    </g>
                  )}
                  {frame >= qLine2F && (
                    <g opacity={p(frame, qLine2F, qLine2F + 15)}>
                      <Ship
                        src="images/ship-boat-svgrepo-com.svg"
                        x={S1.x}
                        y={S1.y}
                        w={S1.w}
                        h={S1.h}
                      />
                      <Ship
                        src="images/ship-svgrepo-com.svg"
                        x={S2.x}
                        y={S2.y}
                        w={S2.w}
                        h={S2.h}
                      />
                      <line
                        x1={B.x}
                        y1={B.y}
                        x2={S1.x}
                        y2={SEA_Y}
                        stroke={C.red}
                        strokeWidth="4"
                        style={{ filter: "drop-shadow(0 0 5px #ef4444)" }}
                      />
                      <line
                        x1={B.x}
                        y1={B.y}
                        x2={S2.x}
                        y2={SEA_Y}
                        stroke={C.green}
                        strokeWidth="4"
                        style={{ filter: "drop-shadow(0 0 5px #84CC16)" }}
                      />
                      <BeaconArcs show60={1} show30={1} />
                    </g>
                  )}
                </>
              )}

              {/* INTRO visual: static lighthouse scene */}
              {variant === "intro" && (
                <>
                  <SeaAndLighthouse beaconGlow={frame} />
                  <Ship
                    src="images/ship-boat-svgrepo-com.svg"
                    x={S1.x}
                    y={S1.y}
                    w={S1.w}
                    h={S1.h}
                  />
                  <Ship
                    src="images/ship-svgrepo-com.svg"
                    x={S2.x}
                    y={S2.y}
                    w={S2.w}
                    h={S2.h}
                  />
                  <line
                    x1="50"
                    y1={B.y}
                    x2="650"
                    y2={B.y}
                    stroke={C.cyan}
                    strokeWidth="4"
                    strokeDasharray="10 10"
                    opacity="0.6"
                  />
                  <BeaconArcs show60={1} show30={1} />
                </>
              )}

              {/* ANGLE DEFINITION visual: what is angle of depression */}
              {variant === "angle_definition" && (
                <>
                  <SeaAndLighthouse beaconGlow={frame} />

                  {/* Horizontal line of sight draws at 'look straight out at the horizon' */}
                  {frame >= defHorizonF && (
                    <line
                      x1={B.x}
                      y1={B.y}
                      x2={lerp(B.x, 650, defHorizonP)}
                      y2={B.y}
                      stroke={C.cyan}
                      strokeWidth="4"
                      strokeDasharray="10 10"
                      strokeLinecap="round"
                    />
                  )}
                  {frame >= defHorizonF && (
                    <text
                      x="470"
                      y="138"
                      fontFamily={outfitFont}
                      fontSize="20"
                      fontWeight="700"
                      fill={C.cyan}
                      opacity={defHorizonP}
                    >
                      LINE OF SIGHT
                    </text>
                  )}

                  {/* Boat + downward gaze at 'look DOWN at a boat' */}
                  {defBoatP > 0 && (
                    <>
                      <Ship
                        src="images/ship-svgrepo-com.svg"
                        x={440}
                        y={410}
                        w={110}
                        h={80}
                        opacity={defBoatP}
                      />
                      <line
                        x1={B.x}
                        y1={B.y}
                        x2={lerp(B.x, 500, defBoatP)}
                        y2={lerp(B.y, SEA_Y, defBoatP)}
                        stroke={C.white}
                        strokeWidth="4"
                        opacity={defBoatP}
                      />
                    </>
                  )}

                  {/* The angle itself at 'is called the angle of depression' */}
                  {defArcP > 0 && (
                    <g opacity={defArcP}>
                      <path
                        d={arc(B.x, B.y, 90, 0, 37)}
                        fill="none"
                        stroke={C.cyan}
                        strokeWidth="5"
                      />
                      <text
                        x={B.x + 106}
                        y={B.y + 38}
                        fontFamily={outfitFont}
                        fontSize="30"
                        fontWeight="900"
                        fill={C.cyan}
                      >
                        θ
                      </text>

                      {/* Curved pointer connecting text to the angle */}
                      <path
                        d={`M ${B.x + 165} ${B.y + 70} Q ${B.x + 165} ${B.y + 25} ${B.x + 120} ${B.y + 25}`}
                        fill="none"
                        stroke={C.cyan}
                        strokeWidth="2"
                        strokeDasharray="4 4"
                      />
                      <polygon
                        points={`${B.x + 120},${B.y + 25} ${B.x + 128},${B.y + 20} ${B.x + 128},${B.y + 30}`}
                        fill={C.cyan}
                      />

                      {/* Styled pill background so it looks intentional, not like a broken debug box */}
                      <rect
                        x={B.x + 60}
                        y={B.y + 70}
                        width="210"
                        height="34"
                        fill="rgba(6,182,212,0.15)"
                        stroke={C.cyan}
                        strokeWidth="2"
                        rx="17"
                      />
                      <text
                        x={B.x + 165}
                        y={B.y + 93}
                        fontFamily={outfitFont}
                        fontSize="18"
                        fontWeight="900"
                        fill={C.cyan}
                        textAnchor="middle"
                      >
                        ANGLE OF DEPRESSION
                      </text>
                    </g>
                  )}

                  {/* Wrong way: measured from the vertical wall (crossed out) */}
                  {defWrongP > 0 && (
                    <g opacity={defWrongP}>
                      <path
                        d={arc(B.x, B.y, 70, 37, 90)}
                        fill="none"
                        stroke={C.red}
                        strokeWidth="4"
                        strokeDasharray="5 5"
                      />
                      <text
                        x={B.x - 34}
                        y={B.y + 60}
                        fontFamily={outfitFont}
                        fontSize="28"
                        fontWeight="900"
                        fill={C.red}
                      >
                        ✘
                      </text>
                    </g>
                  )}
                </>
              )}

              {/* LIGHTHOUSE REAL visual: honest 60°/30° setup */}
              {variant === "lighthouse_real" && (
                <>
                  <SeaAndLighthouse beaconGlow={frame} />

                  {/* 75 m height marker */}
                  {frame >= meterF && (
                    <g opacity={p(frame, meterF, meterF + 15)}>
                      <line
                        x1="26"
                        y1={B.y}
                        x2="26"
                        y2={SEA_Y}
                        stroke={C.white}
                        strokeWidth="3"
                        strokeDasharray="6 6"
                        opacity="0.8"
                      />
                      <text
                        x="20"
                        y="375"
                        textAnchor="end"
                        fontFamily={outfitFont}
                        fontSize="24"
                        fontWeight="900"
                        fill={C.white}
                      >
                        75 m
                      </text>
                    </g>
                  )}

                  {/* Line of sight */}
                  {frame >= sightF && (
                    <line
                      opacity={p(frame, sightF, sightF + 15)}
                      x1={B.x}
                      y1={B.y}
                      x2={B.x + 400 * sightDraw}
                      y2={B.y}
                      stroke={C.amber}
                      strokeWidth="4"
                      strokeDasharray="10 10"
                      strokeLinecap="round"
                    />
                  )}

                  {/* Ship 1 (near, 60°) — pops when mentioned */}
                  <g
                    style={{
                      filter:
                        ship1Pop > 0 ? "drop-shadow(0 0 12px #F59E0B)" : "none",
                    }}
                  >
                    <Ship
                      src="images/ship-boat-svgrepo-com.svg"
                      x={S1.x - ship1Pop * (S1.w * 0.15)}
                      y={S1.y - ship1Pop * (S1.h * 0.15)}
                      w={S1.w * (1 + ship1Pop * 0.3)}
                      h={S1.h * (1 + ship1Pop * 0.3)}
                    />
                  </g>
                  {frame >= steepF && (
                    <line
                      opacity={p(frame, steepF, steepF + 15)}
                      x1={B.x}
                      y1={B.y}
                      x2={lerp(B.x, S1.x, laser1P)}
                      y2={lerp(B.y, SEA_Y, laser1P)}
                      stroke={C.red}
                      strokeWidth="4"
                      style={{ filter: "drop-shadow(0 0 5px #ef4444)" }}
                    />
                  )}

                  {/* Ship 2 (far, 30°) — pops when mentioned */}
                  <g
                    style={{
                      filter:
                        ship2Pop > 0 ? "drop-shadow(0 0 12px #F59E0B)" : "none",
                    }}
                  >
                    <Ship
                      src="images/ship-svgrepo-com.svg"
                      x={S2.x - ship2Pop * (S2.w * 0.15)}
                      y={S2.y - ship2Pop * (S2.h * 0.15)}
                      w={S2.w * (1 + ship2Pop * 0.3)}
                      h={S2.h * (1 + ship2Pop * 0.3)}
                    />
                  </g>
                  {frame >= ang30F && (
                    <line
                      opacity={p(frame, ang30F, ang30F + 15)}
                      x1={B.x}
                      y1={B.y}
                      x2={lerp(B.x, S2.x, laser2P)}
                      y2={lerp(B.y, SEA_Y, laser2P)}
                      stroke={C.green}
                      strokeWidth="4"
                      style={{ filter: "drop-shadow(0 0 5px #84CC16)" }}
                    />
                  )}

                  <BeaconArcs show60={arcs60P} show30={arcs30P} />
                  <MeasurementLabels opacity={distP} />
                </>
              )}

              {/* ABSTRACT visual: Z-TRICK — grounded in the real lighthouse/ship diagram */}
              {variant === "lighthouse_abstract" && (
                <>
                  {/* Faint hidden triangle: lighthouse corner → sea floor → SHIP 1 (near, 60°) */}
                  <path
                    d={`M ${B.x} ${B.y} L ${B.x} ${SEA_Y} L ${S1.x} ${SEA_Y} Z`}
                    fill="none"
                    stroke="#334155"
                    strokeWidth="8"
                    strokeLinejoin="round"
                  />

                  {/* Horizontal line of sight: ONLY introduce when narrator explicitly calls out the parallel line trick */}
                  {frame >= parallelF && (
                    <line
                      opacity={p(frame, parallelF, parallelF + 15)}
                      x1="50"
                      y1={B.y}
                      x2="650"
                      y2={B.y}
                      stroke={C.amber}
                      strokeWidth="4"
                      strokeDasharray="10 10"
                      strokeLinecap="round"
                    />
                  )}

                  <SeaAndLighthouse beaconGlow={frame} />

                  {/* Persistent 75m height marker */}
                  <g opacity="0.8">
                    <line
                      x1="26"
                      y1={B.y}
                      x2="26"
                      y2={SEA_Y}
                      stroke={C.white}
                      strokeWidth="3"
                      strokeDasharray="6 6"
                    />
                    <text
                      x="20"
                      y="375"
                      textAnchor="end"
                      fontFamily={outfitFont}
                      fontSize="24"
                      fontWeight="900"
                      fill={C.white}
                    >
                      75 m
                    </text>
                  </g>

                  {/* The laser beam to Ship 1: introduced at 'trace the laser' instead of beginning! */}
                  {frame >= traceF && (
                    <line
                      opacity={p(frame, traceF, traceF + 15)}
                      x1={B.x}
                      y1={B.y}
                      x2={S1.x}
                      y2={SEA_Y}
                      stroke={C.red}
                      strokeWidth="4"
                      style={{ filter: "drop-shadow(0 0 5px #ef4444)" }}
                    />
                  )}

                  {/* Depression angle at the beacon (OUTSIDE the triangle, between horizontal + laser to ship 1) */}
                  {frame >= depressionF && (
                    <g
                      opacity={
                        identicalP > 0
                          ? 1 - landP
                          : p(frame, depressionF, depressionF + 15)
                      }
                    >
                      <path
                        d={arc(B.x, B.y, 60, 0, 60)}
                        fill="none"
                        stroke={C.cyan}
                        strokeWidth="4"
                      />
                      <text
                        x={B.x + 74}
                        y={B.y - 14}
                        fontFamily={outfitFont}
                        fontSize="30"
                        fontWeight="900"
                        fill={C.cyan}
                      >
                        θ
                      </text>
                      {frame < slidesF && (
                        <g opacity={p(frame, depressionF, depressionF + 15)}>
                          {/* Pointer */}
                          <path
                            d={`M ${B.x + 225} ${B.y - 30} Q ${B.x + 130} ${B.y - 30} ${B.x + 105} ${B.y - 15}`}
                            fill="none"
                            stroke={C.cyan}
                            strokeWidth="2"
                            strokeDasharray="4 4"
                          />
                          <polygon
                            points={`${B.x + 105},${B.y - 15} ${B.x + 115},${B.y - 20} ${B.x + 115},${B.y - 10}`}
                            fill={C.cyan}
                          />
                          {/* Pill */}
                          <rect
                            x={B.x + 120}
                            y={B.y - 47}
                            width="210"
                            height="34"
                            fill="rgba(6,182,212,0.15)"
                            stroke={C.cyan}
                            strokeWidth="2"
                            rx="17"
                          />
                          <text
                            x={B.x + 225}
                            y={B.y - 24}
                            fontFamily={outfitFont}
                            fontSize="18"
                            fontWeight="900"
                            fill={C.cyan}
                            textAnchor="middle"
                          >
                            ANGLE OF DEPRESSION
                          </text>
                        </g>
                      )}
                    </g>
                  )}

                  {/* Z shape drawn FROM THE BEAM ORIGIN: right line of sight → beacon → down the laser to ship 1 → right along waterline */}
                  {frame >= zRuleF && (
                    <path
                      d={`M 560 ${B.y} L ${B.x} ${B.y} L ${S1.x} ${SEA_Y} L 560 ${SEA_Y}`}
                      fill="none"
                      stroke={C.cyan}
                      strokeWidth="12"
                      strokeDasharray="1050"
                      strokeDashoffset={1050 - zDraw * 1050}
                      style={{ filter: "drop-shadow(0 0 10px #FBBF24)" }}
                      opacity={0.9}
                    />
                  )}

                  {/* Ships sit ON the waterline, in front of the Z's bottom segment */}
                  <g
                    style={{
                      filter:
                        zShipPop > 0 ? "drop-shadow(0 0 12px #F59E0B)" : "none",
                    }}
                  >
                    <Ship
                      src="images/ship-boat-svgrepo-com.svg"
                      x={S1.x - zShipPop * (S1.w * 0.15)}
                      y={S1.y - zShipPop * (S1.h * 0.15)}
                      w={S1.w * (1 + zShipPop * 0.3)}
                      h={S1.h * (1 + zShipPop * 0.3)}
                    />
                  </g>
                  <Ship
                    src="images/ship-svgrepo-com.svg"
                    x={S2.x}
                    y={S2.y}
                    w={S2.w}
                    h={S2.h}
                  />

                  {/* Parallel chevrons on line of sight + sea floor */}
                  {frame >= parallelF && (
                    <g opacity={p(frame, parallelF, parallelF + 20)}>
                      <polyline
                        points={`560,${B.y - 8} 580,${B.y} 560,${B.y + 8}`}
                        fill="none"
                        stroke={C.amber}
                        strokeWidth="4"
                        strokeLinecap="round"
                      />
                      <polyline
                        points={`590,${B.y - 8} 610,${B.y} 590,${B.y + 8}`}
                        fill="none"
                        stroke={C.amber}
                        strokeWidth="4"
                        strokeLinecap="round"
                      />
                      <polyline
                        points={`560,${SEA_Y - 8} 580,${SEA_Y} 560,${SEA_Y + 8}`}
                        fill="none"
                        stroke={C.amber}
                        strokeWidth="4"
                        strokeLinecap="round"
                      />
                      <polyline
                        points={`590,${SEA_Y - 8} 610,${SEA_Y} 590,${SEA_Y + 8}`}
                        fill="none"
                        stroke={C.amber}
                        strokeWidth="4"
                        strokeLinecap="round"
                      />
                    </g>
                  )}

                  {/* Laser tracer dot down the diagonal to ship 1 */}
                  {frame >= traceF && (
                    <circle
                      cx={lerp(B.x, S1.x, traceT)}
                      cy={lerp(B.y, SEA_Y, traceT)}
                      r="9"
                      fill={C.cyan}
                      style={{ filter: "drop-shadow(0 0 14px #FBBF24)" }}
                      opacity={traceT < 1 ? 1 : 0}
                    />
                  )}

                  {/* Alternate interior angles: both corners pulse (60° at beacon, 60° at ship 1) */}
                  {identicalP > 0 && (
                    <g opacity={identicalP}>
                      <path
                        d={arc(B.x, B.y, 60, 0, 60)}
                        fill="none"
                        stroke={C.green}
                        strokeWidth="5"
                        opacity={pulse}
                      />
                      <path
                        d={arc(S1.x, SEA_Y, 50, 180, 240, 1)}
                        fill="none"
                        stroke={C.green}
                        strokeWidth="5"
                        opacity={pulse}
                      />
                    </g>
                  )}

                  {/* Angle sliding down the laser (depression → elevation) */}
                  {frame >= slidesF && (
                    <g
                      transform={`translate(${thetaX}, ${thetaY})`}
                      opacity={1 - landP}
                    >
                      <path
                        d={arc(0, 0, 60, 0, 60)}
                        fill="none"
                        stroke={C.cyan}
                        strokeWidth="4"
                      />
                      <text
                        x="18"
                        y="-18"
                        fontFamily={outfitFont}
                        fontSize="26"
                        fontWeight="900"
                        fill={C.cyan}
                      >
                        θ
                      </text>
                    </g>
                  )}
                  {/* Final landed angle (elevation) */}
                  {landP > 0 && (
                    <g opacity={landP}>
                      <path
                        d={arc(S1.x, SEA_Y, 60, 180, 240)}
                        fill="none"
                        stroke={C.cyan}
                        strokeWidth="4"
                      />
                      <text
                        x={S1.x - 44}
                        y={SEA_Y - 24}
                        fontFamily={outfitFont}
                        fontSize="30"
                        fontWeight="900"
                        fill={C.cyan}
                      >
                        θ
                      </text>
                      {frame >= elevationF && (
                        <g opacity={p(frame, elevationF, elevationF + 15)}>
                          <path
                            d={`M ${S1.x - 170} ${SEA_Y - 60} Q ${S1.x - 70} ${SEA_Y - 60} ${S1.x - 55} ${SEA_Y - 45}`}
                            fill="none"
                            stroke={C.cyan}
                            strokeWidth="2"
                            strokeDasharray="4 4"
                          />
                          <polygon
                            points={`${S1.x - 55},${SEA_Y - 45} ${S1.x - 65},${SEA_Y - 50} ${S1.x - 65},${SEA_Y - 40}`}
                            fill={C.cyan}
                          />
                          <rect
                            x={S1.x - 275}
                            y={SEA_Y - 77}
                            width="210"
                            height="34"
                            fill="rgba(6,182,212,0.15)"
                            stroke={C.cyan}
                            strokeWidth="2"
                            rx="17"
                          />
                          <text
                            x={S1.x - 170}
                            y={SEA_Y - 54}
                            fontFamily={outfitFont}
                            fontSize="18"
                            fontWeight="900"
                            fill={C.cyan}
                            textAnchor="middle"
                          >
                            ANGLE OF ELEVATION
                          </text>
                        </g>
                      )}
                    </g>
                  )}
                </>
              )}

              {/* PROXIMITY visual: closer = bigger angle */}
              {variant === "lighthouse_proximity" && (
                <>
                  <SeaAndLighthouse beaconGlow={frame} />

                  {/* Persistent 75m height marker */}
                  <g opacity="0.8">
                    <line
                      x1="26"
                      y1={B.y}
                      x2="26"
                      y2={SEA_Y}
                      stroke={C.white}
                      strokeWidth="3"
                      strokeDasharray="6 6"
                    />
                    <text
                      x="20"
                      y="375"
                      textAnchor="end"
                      fontFamily={outfitFont}
                      fontSize="24"
                      fontWeight="900"
                      fill={C.white}
                    >
                      75 m
                    </text>
                  </g>

                  {/* Line of sight */}
                  <line
                    x1="50"
                    y1={B.y}
                    x2="650"
                    y2={B.y}
                    stroke={C.cyan}
                    strokeWidth="3"
                    strokeDasharray="10 10"
                    opacity="0.6"
                  />

                  {/* Gliding ship: far (30°) → near (60°) */}
                  <Ship
                    src="images/ship-svgrepo-com.svg"
                    x={shipX - S2.w / 2}
                    y={S2.y}
                    w={S2.w}
                    h={S2.h}
                    opacity={readoutP}
                  />
                  <line
                    x1={B.x}
                    y1={B.y}
                    x2={shipX}
                    y2={SEA_Y}
                    stroke={C.cyan}
                    strokeWidth="4"
                    style={{ filter: "drop-shadow(0 0 6px #FBBF24)" }}
                    opacity={readoutP}
                  />
                  <path
                    d={arc(B.x, B.y, 45, 0, angleNow)}
                    fill="none"
                    stroke={C.cyan}
                    strokeWidth="4"
                    opacity={readoutP}
                  />
                  {/* Far ghost ship for contrast */}
                  {glideT > 0.15 && (
                    <Ship
                      src="images/ship-svgrepo-com.svg"
                      x={S2.x}
                      y={S2.y}
                      w={S2.w}
                      h={S2.h}
                      opacity={0.25 * readoutP}
                    />
                  )}
                  <text
                    x={B.x + 58}
                    y={B.y + 32}
                    fontFamily={outfitFont}
                    fontSize="20"
                    fontWeight="900"
                    fill={C.cyan}
                    opacity={readoutP}
                  >
                    {Math.round(angleNow)}°
                  </text>

                  {/* Live angle readout */}
                  {readoutP > 0 && (
                    <g opacity={readoutP}>
                      <text
                        x="400"
                        y="70"
                        fontFamily={outfitFont}
                        fontSize="56"
                        fontWeight="900"
                        fill={C.cyan}
                        textAnchor="middle"
                        transform={`translate(400 70) scale(${1 + 0.12 * craneP * Math.abs(Math.sin(frame * 0.3))}) translate(-400 -70)`}
                        style={{ filter: "drop-shadow(0 0 18px #FBBF24)" }}
                      >
                        {Math.round(angleNow)}°
                      </text>
                      <text
                        x="400"
                        y="100"
                        fontFamily={outfitFont}
                        fontSize="20"
                        fontWeight="700"
                        fill={C.slate}
                        textAnchor="middle"
                      >
                        ANGLE OF DEPRESSION
                      </text>
                    </g>
                  )}
                </>
              )}

              {/* SOLVE visual: diagram + segment highlights */}
              {variant === "lighthouse_solve" && (
                <>
                  <SeaAndLighthouse beaconGlow={frame} />
                  <line
                    x1={B.x}
                    y1={B.y}
                    x2={B.x + 573}
                    y2={B.y}
                    stroke={C.cyan}
                    strokeWidth="4"
                    strokeDasharray="10 10"
                    opacity="0.7"
                  />
                  <line
                    x1="226"
                    y1={B.y}
                    x2="226"
                    y2={SEA_Y}
                    stroke={C.white}
                    strokeWidth="3"
                    strokeDasharray="6 6"
                    opacity="0.8"
                  />
                  <text
                    x="218"
                    y="316"
                    textAnchor="end"
                    fontFamily={outfitFont}
                    fontSize="24"
                    fontWeight="900"
                    fill={C.white}
                  >
                    75 m
                  </text>
                  <Ship
                    src="images/ship-boat-svgrepo-com.svg"
                    x={S1.x}
                    y={S1.y}
                    w={S1.w}
                    h={S1.h}
                  />
                  <Ship
                    src="images/ship-svgrepo-com.svg"
                    x={S2.x}
                    y={S2.y}
                    w={S2.w}
                    h={S2.h}
                  />
                  <line
                    x1={B.x}
                    y1={B.y}
                    x2={S1.x}
                    y2={SEA_Y}
                    stroke={C.red}
                    strokeWidth="4"
                    style={{ filter: "drop-shadow(0 0 5px #ef4444)" }}
                  />
                  <line
                    x1={B.x}
                    y1={B.y}
                    x2={S2.x}
                    y2={SEA_Y}
                    stroke={C.green}
                    strokeWidth="4"
                    style={{ filter: "drop-shadow(0 0 5px #84CC16)" }}
                  />
                  <BeaconArcs show60={1} show30={1} />
                  <MeasurementLabels opacity={1} />

                  {/* segment highlights as values are computed */}
                  {xValP > 0 && (
                    <line
                      x1={B.x}
                      y1="502"
                      x2={S1.x}
                      y2="502"
                      stroke={C.cyan}
                      strokeWidth="7"
                      opacity={xValP}
                      style={{ filter: "drop-shadow(0 0 8px #FBBF24)" }}
                    />
                  )}
                  {xyValP > 0 && (
                    <line
                      x1={B.x}
                      y1="502"
                      x2={S2.x}
                      y2="502"
                      stroke={C.cyan}
                      strokeWidth="7"
                      opacity={xyValP}
                      style={{ filter: "drop-shadow(0 0 8px #FBBF24)" }}
                    />
                  )}
                  {yValP > 0 && (
                    <line
                      x1={S1.x}
                      y1="502"
                      x2={S2.x}
                      y2="502"
                      stroke={C.green}
                      strokeWidth="9"
                      opacity={yValP}
                      style={{ filter: "drop-shadow(0 0 10px #84CC16)" }}
                    />
                  )}
                </>
              )}
            </svg>
          </div>
        )}

        {/* ==================== BOSS END: full-width recap ==================== */}
        {variant === "boss_end" && (
          <div
            style={{
              flex: 1,
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
            }}
          >
            <svg
              width="800"
              height="600"
              viewBox="0 0 800 600"
              style={{ overflow: "visible" }}
            >
              {defeatedP > 0 && (
                <text
                  x="400"
                  y="160"
                  fontFamily={animeFont}
                  fontSize="90"
                  letterSpacing="4px"
                  fill={C.cyan}
                  textAnchor="middle"
                  opacity={defeatedP}
                  transform={`translate(400 160) scale(${0.5 + 0.5 * defeatedP}) translate(-400 -160)`}
                  style={{ filter: "drop-shadow(0 0 30px #FBBF24)" }}
                >
                  BOSS DEFEATED!
                </text>
              )}
              {marksP > 0 && (
                <text
                  x="400"
                  y="225"
                  fontFamily={outfitFont}
                  fontSize="36"
                  fontWeight="900"
                  fill={C.red}
                  textAnchor="middle"
                  opacity={marksP}
                  style={{ filter: "drop-shadow(0 0 14px #ef4444)" }}
                >
                  +5 MARKS SECURED ON YOUR BOARD EXAM
                </text>
              )}

              {rec1P > 0 && (
                <g opacity={rec1P} transform="translate(60, 300)">
                  <rect
                    x="0"
                    y="0"
                    width="330"
                    height="72"
                    rx="14"
                    fill="rgba(30,41,59,0.85)"
                    stroke={C.cyan}
                    strokeWidth="2"
                  />
                  <circle cx="30" cy="36" r="15" fill={C.cyan} />
                  <text
                    x="30"
                    y="42"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill="#0F172A"
                    textAnchor="middle"
                  >
                    1
                  </text>
                  <text
                    x="58"
                    y="32"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill={C.white}
                  >
                    Draw the invisible line
                  </text>
                  <text
                    x="58"
                    y="56"
                    fontFamily={outfitFont}
                    fontSize="14"
                    fontWeight="400"
                    fill={C.slate}
                  >
                    horizontal line of sight first
                  </text>
                </g>
              )}
              {rec2P > 0 && (
                <g opacity={rec2P} transform="translate(410, 300)">
                  <rect
                    x="0"
                    y="0"
                    width="330"
                    height="72"
                    rx="14"
                    fill="rgba(30,41,59,0.85)"
                    stroke={C.red}
                    strokeWidth="2"
                  />
                  <circle cx="30" cy="36" r="15" fill={C.red} />
                  <text
                    x="30"
                    y="42"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill="#0F172A"
                    textAnchor="middle"
                  >
                    2
                  </text>
                  <text
                    x="58"
                    y="32"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill={C.white}
                  >
                    Z-Trick
                  </text>
                  <text
                    x="58"
                    y="56"
                    fontFamily={outfitFont}
                    fontSize="14"
                    fontWeight="400"
                    fill={C.slate}
                  >
                    slide the angle inside
                  </text>
                </g>
              )}
              {rec3P > 0 && (
                <g opacity={rec3P} transform="translate(60, 392)">
                  <rect
                    x="0"
                    y="0"
                    width="330"
                    height="72"
                    rx="14"
                    fill="rgba(30,41,59,0.85)"
                    stroke={C.green}
                    strokeWidth="2"
                  />
                  <circle cx="30" cy="36" r="15" fill={C.green} />
                  <text
                    x="30"
                    y="42"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill="#0F172A"
                    textAnchor="middle"
                  >
                    3
                  </text>
                  <text
                    x="58"
                    y="32"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill={C.white}
                  >
                    âˆš3 = 60Â°, 1/âˆš3 = 30Â°
                  </text>
                  <text
                    x="58"
                    y="56"
                    fontFamily={outfitFont}
                    fontSize="14"
                    fontWeight="400"
                    fill={C.slate}
                  >
                    root 3 belongs to 60 degrees
                  </text>
                </g>
              )}
              {rec4P > 0 && (
                <g opacity={rec4P} transform="translate(410, 392)">
                  <rect
                    x="0"
                    y="0"
                    width="330"
                    height="72"
                    rx="14"
                    fill="rgba(30,41,59,0.85)"
                    stroke={C.amber}
                    strokeWidth="2"
                  />
                  <circle cx="30" cy="36" r="15" fill={C.amber} />
                  <text
                    x="30"
                    y="42"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill="#0F172A"
                    textAnchor="middle"
                  >
                    4
                  </text>
                  <text
                    x="58"
                    y="32"
                    fontFamily={outfitFont}
                    fontSize="18"
                    fontWeight="900"
                    fill={C.white}
                  >
                    Closer = bigger angle
                  </text>
                  <text
                    x="58"
                    y="56"
                    fontFamily={outfitFont}
                    fontSize="14"
                    fontWeight="400"
                    fill={C.slate}
                  >
                    closer ship wins 60 degrees
                  </text>
                </g>
              )}

              {nextP > 0 && (
                <text
                  x="400"
                  y="540"
                  fontFamily={outfitFont}
                  fontSize="26"
                  fontWeight="700"
                  fill={C.slate}
                  textAnchor="middle"
                  opacity={nextP}
                >
                  SEE YOU IN THE NEXT BOSS FIGHT!
                </text>
              )}
            </svg>
          </div>
        )}
      </div>
    </AbsoluteFill>
  );
};

// ---------- Two-panel helpers (defined at top level, outside the component) ----------
const PanelLine: React.FC<{
  opacity: number;
  accent?: string;
  size?: number;
  color?: string;
  children: React.ReactNode;
  name?: string;
}> = ({
  opacity,
  accent = "#FBBF24",
  size = 30,
  color = "#F8FAFC",
  children,
  name = "Panel Text Line",
}) => (
  <Interactive.Div
    name={name}
    style={{ opacity, display: "flex", alignItems: "center", gap: 16 }}
  >
    <div
      style={{
        width: 6,
        height: size + 10,
        borderRadius: 3,
        backgroundColor: accent,
        flexShrink: 0,
        boxShadow: `0 0 8px ${accent}88`,
      }}
    />
    <div style={{ fontSize: size, fontWeight: 700, color, lineHeight: 1.25 }}>
      {children}
    </div>
  </Interactive.Div>
);

const GameStamp: React.FC<{
  opacity: number;
  color: string;
  size?: number;
  children: React.ReactNode;
  name?: string;
}> = ({ opacity, color, size = 40, children, name = "Badge / Game Stamp" }) => (
  <Interactive.Div
    name={name}
    style={{
      opacity,
      fontFamily: animeFont,
      fontSize: size,
      letterSpacing: 2,
      color,
      textAlign: "center",
      transform: "rotate(-3deg)",
      textShadow: `0 0 16px ${color}`,
    }}
  >
    {children}
  </Interactive.Div>
);

const ChipCard: React.FC<{
  color: string;
  label: string;
  opacity?: number;
  children: React.ReactNode;
  name?: string;
}> = ({ color, label, opacity = 1, children, name = "Rule / Chip Card" }) => (
  <Interactive.Div
    name={name}
    style={{
      opacity,
      border: `2px solid ${color}`,
      borderRadius: 16,
      backgroundColor: "rgba(255,255,255,0.05)",
      padding: "14px 18px",
      display: "flex",
      flexDirection: "column",
      gap: 6,
    }}
  >
    <div
      style={{
        alignSelf: "flex-start",
        backgroundColor: color,
        color: "#0F172A",
        fontFamily: animeFont,
        fontSize: 20,
        letterSpacing: 2,
        padding: "4px 12px",
        borderRadius: 8,
      }}
    >
      {label}
    </div>
    <div style={{ fontSize: 24, fontWeight: 900, color: "#FFFFFF" }}>
      {children}
    </div>
  </Interactive.Div>
);
