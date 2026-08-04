import React from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, staticFile } from "remotion";
import { PaperBackground } from "./PaperBackground";
import { AppColors, outfitFont, serifFont } from "../theme";
import { WordAlignment } from "../data/schema";

type Variant =
  | "full"
  | "focus_convergence"
  | "shortcut1"
  | "shortcut2"
  | "shortcut3"
  | "inversion"
  | "converging"
  | "guides";

interface RayDiagramSceneProps {
  title: string;
  subtitle?: string;
  audio?: string;
  objectPosition?: "beyond_2f" | "at_2f" | "between_f_2f" | "at_f" | "between_f_o";
  // Animation program; each variant draws exactly the rays described by the
  // scene's teacherScript narration. Defaults to "full" (backward compatible).
  variant?: Variant;
  alignments?: WordAlignment[];
  teacherScript?: string;
}

const lerp = (a: number, b: number, p: number) => a + (b - a) * p;

const cleanWord = (w: string) => w.toLowerCase().replace(/[^a-z0-9]/g, "");

export const RayDiagramScene: React.FC<RayDiagramSceneProps> = ({
  title,
  subtitle,
  audio,
  objectPosition = "beyond_2f",
  variant = "full",
  alignments,
  teacherScript,
}) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const entrance = spring({ frame, fps, config: { damping: 14 } });
  const textOpacity = interpolate(entrance, [0, 1], [0, 1]);
  const textTranslateX = interpolate(entrance, [0, 1], [-40, 0]);
  const diagramScale = interpolate(entrance, [0, 1], [0.85, 1]);
  const diagramOpacity = interpolate(entrance, [0, 1], [0, 1]);

  // Narration-synchronized timing: match spoken phrases against the word-level
  // alignments and convert to frames. Falls back to a fixed timeline when no
  // script/alignments are provided (e.g. reel compositions).
  const scriptWords = (teacherScript ?? "").split(/\s+/).map(cleanWord);
  const phraseAt = (phrase: string): { start?: number; end?: number } | undefined => {
    const tokens = phrase.toLowerCase().split(/\s+/).map(cleanWord);
    if (!tokens.length || !alignments || tokens.length > scriptWords.length) return undefined;
    for (let i = 0; i + tokens.length <= scriptWords.length; i++) {
      if (tokens.every((tok, j) => scriptWords[i + j] === tok)) {
        return { start: alignments[i]?.start, end: alignments[i + tokens.length - 1]?.end };
      }
    }
    return undefined;
  };
  const t = (phrase: string, fallback: number) => (phraseAt(phrase)?.start ?? fallback) * fps;
  const te = (phrase: string, fallback: number) => (phraseAt(phrase)?.end ?? fallback) * fps;

  const p = (frame: number, start: number, end: number) =>
    end <= start ? (frame >= start ? 1 : 0) :
    interpolate(frame, [start, end], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

  // ---- Scene geometry ----------------------------------------------------
  const OX = 240; // Optical center x
  const OY = 170; // Principal axis y
  const F = 70; // Focal distance in px

  let objX = OX - 2.4 * F; // beyond 2F1
  let objH = 60;
  let imgX = OX + 1.7 * F; // ray crossing point for beyond_2f
  let imgH = -45; // inverted

  if (objectPosition === "between_f_2f") {
    objX = OX - 1.4 * F;
    objH = variant === "shortcut3" ? 45 : 60; // shorter object keeps the F1-ray inside the lens
    imgX = OX + 2.5 * F;
    imgH = -90;
  } else if (objectPosition === "at_2f") {
    objX = OX - 2 * F;
    imgX = OX + 2 * F;
    imgH = -60;
  }

  const objTopY = OY - objH;
  const imgTopY = OY - imgH;

  // ---- Narration phase markers (seconds -> frames) -----------------------
  // focus_convergence (scene-04)
  const fLook = t("Look at the shape", 2.3);
  const fTop = t("Top rays get bent", 7.3);
  const fTopEnd = te("Top rays get bent", 9.0);
  const fBottom = t("Bottom rays get bent", 9.4);
  const fBottomEnd = te("Bottom rays get bent", 11.0);
  const fGather = t("all these bent rays gather", 13.7);
  const fGatherEnd = te("all these bent rays gather", 15.0);
  const fFocus = t("FOCUS F 2", 15.6);

  // shortcut1 (scene-05)
  const fRayIn = t("ray traveling parallel to the ground line", 1.6);
  const fRayInEnd = te("ray traveling parallel to the ground line", 3.5);
  const fBend = t("MUST bend", 4.1);
  const fPass = t("pass right through Focus F 2", 5.3);
  const fPassEnd = te("pass right through Focus F 2", 7.0);
  const fMagnet = t("Think of the Focus as a magnet", 7.5);

  // shortcut2 (scene-06)
  const fAimed = t("ray aimed straight at the Optical Center O", 2.9);
  const fAimedEnd = te("ray aimed straight at the Optical Center O", 5.6);
  const fPasses = t("passes straight through without bending", 5.7);
  const fPassesEnd = te("passes straight through without bending", 7.7);
  const fDart = t("like a dart", 12.5);

  // shortcut3 (scene-07)
  const fIf = t("If a ray passes through Focus F 1 FIRST", 4.0);
  const fIfEnd = te("If a ray passes through Focus F 1 FIRST", 6.7);
  const fLeaves = t("leaves the lens traveling completely flat", 6.9);
  const fLeavesEnd = te("leaves the lens traveling completely flat and parallel to the ground line", 11.0);

  // inversion (scene-08): slow step-by-step explanation, phrase-paced
  const fStep1 = t("step by step", 4.0);
  const fFlameIn = t("ray from the top of the flame travels parallel", 7.5);
  const fFlameBend = t("bends it DOWN", 11.3);
  const fFlameKeep = t("keeps going DOWN", 16.3);
  const fBelowAxis = t("now BELOW the axis", 20.1);
  const fBottomLabel = t("lands at the BOTTOM", 22.8);
  const fBaseGlow = t("base of the candle is below the axis", 26.4);
  const fBaseIn = t("Its ray also travels parallel", 28.8);
  const fBaseBend = t("bends it UP", 32.8);
  const fBaseKeep = t("keeps going UP", 36.4);
  const fAboveAxis = t("now ABOVE the axis", 39.8);
  const fTopLabel = t("lands at the TOP", 42.8);
  const fSwap = t("went from TOP to BOTTOM", 45.0);
  const fSwapped = t("swapped places", 50.2);
  const fUpsideDown = t("image is UPSIDE DOWN", 55.9);
  const fInverted = t("always inverted", 58.2);

  // converging intro (scene-01) + lens shape (scene-04)
  const fConvCap = t("CONVERGING", 5.3);
  const fConvIn = t("Converge", 6.8);
  const fConvInEnd = t("scattered", 9.5);
  const fConvBend = t("bends", 11.0);
  const fConvBendEnd = t("single", 12.8);
  const fConvSpot = t("single spot", 12.8);
  const fConvLabel = te("single spot", 13.9);
  const fLensShapeEnd = te("thin at the edges", 6.9);
  const fFatMid = t("fat in the middle", 4.9);
  const fFatMidEnd = te("fat in the middle", 5.7);

  // guides (scene-03): live-draw the two fundamental guides with the narration
  const fGAxis = t("Draw a straight horizontal line", 5.9);
  const fGAxisEnd = te("middlethat", 9.6);
  const fGAxisLabel = t("your Principal Axis", 9.9);
  const fGGround = t("as the ground line", 12.1);
  const fGLens = t("Mark the exact bullseye center of the", 14.9);
  const fGLensEnd = te("center of the", 17.1);
  const fGO = t("the Optical Center O", 18.3);
  const fGF1Dot = t("one on the left of O", 22.0);
  const fGF2Dot = t("one on the right", 24.5);
  const fGF1Label = t("These two points are called F 1 and F 2", 29.6);
  const fGFaxis = t("sit right on the Principal Axis", 37.0);

  // full (scene-09); fallbacks in SECONDS reproduce the original fixed-frame
  // timeline (0.5s/1.5s/2.83s/4.33s/5.33s) for compositions without alignments
  const fPlace = t("Place your object beyond", 0);
  const fPlaceEnd = te("Place your object beyond 2 F 1", 5.5);
  const fS1 = t("Let us pick Shortcut 1", 0.5);
  const fS1Parallel = t("parallel through F 2", 1.5);
  const fS1End = te("parallel through F 2", 2.83);
  const fS2 = t("and Shortcut 2", 2.83);
  const fS2End = te("straight through O", 4.33);
  const fCross9 = t("Where those two lines", 4.33);
  const fBam = t("Draw your inverted arrow", 5.33);
  const fImage = t("Draw your inverted arrow", 4.33);
  const fImageEnd = te("Draw your inverted arrow", 5.33);
  const fReal = t("That is your Real", 6.0);
  const fBetween = te("image between F 2 and 2 F 2", 8.0);

  // ---- Per-variant animation state ---------------------------------------
  const rayColors = { red: "#EF4444", yellow: "#EAB308", green: "#22C55E", slate: "#94A3B8" };
  const pulseRadius = 6 + Math.sin(frame * 0.2) * 5;
  const pulseOpacity = 0.5 + Math.sin(frame * 0.2) * 0.3;
  const flashPulse = 10 + Math.sin(frame * 0.5) * 6;

  // focus_convergence rays: heights above/below the axis, all converging at F2
  const convRays = [-90, -45, 0, 45, 90].map((h) => ({
    h,
    color: h < 0 ? rayColors.red : h > 0 ? rayColors.yellow : rayColors.slate,
  }));
  const convInP = p(frame, fLook, fTop);
  const convTopP = p(frame, fTop, fTopEnd);
  const convBottomP = p(frame, fBottom, fBottomEnd);
  const convGatherP = p(frame, fGather, fGatherEnd);

  // shortcut1 (scene-05)
  const s1InP = p(frame, fRayIn, fRayInEnd);
  const s1BendP = p(frame, fBend, fPassEnd);
  const s1F2Pulse = p(frame, fPass, fPassEnd);
  const s1MagnetP = p(frame, fMagnet, fMagnet + (fMagnet - fPass) + 60);

  // shortcut2 (scene-06)
  const s2InP = p(frame, fAimed, fAimedEnd);
  const s2OutP = p(frame, fPasses, fPassesEnd);
  const s2OPulse = p(frame, fPasses, fPassesEnd);
  const s2DartP = p(frame, fDart, fDart + 45);

  // shortcut3 (scene-07)
  const s3InP = p(frame, fIf, fIfEnd);
  const s3F1Pulse = p(frame, fIf, fIfEnd);
  const s3OutP = p(frame, fLeaves, fLeavesEnd);

  // inversion (scene-08)
  const flameY = OY - 50; // candle flame tip (above axis)
  const baseY = OY + 50; // candle base (below axis)
  const invImgX = OX + 1.6 * F; // 352
  const invFlameImgY = OY + 30; // red ray (flame) ends below the axis
  const invBaseImgY = OY - 30; // yellow ray (base) ends above the axis
  const invTopInP = p(frame, fFlameIn, fFlameBend);
  const invTopOutP = p(frame, fFlameBend, fFlameKeep);
  const invBaseInP = p(frame, fBaseIn, fBaseBend);
  const invBaseOutP = p(frame, fBaseBend, fBaseKeep);
  const invStep1P = p(frame, fStep1, fStep1 + 30) * (1 - p(frame, fBaseGlow, fBaseGlow + 30));
  const invStep2P = p(frame, fBaseGlow, fBaseGlow + 30) * (1 - p(frame, fSwap, fSwap + 30));
  const invStep3P = p(frame, fSwap, fSwap + 30);
  const invBaseGlowP = p(frame, fBaseGlow, fBaseIn);
  const invBelowP = p(frame, fBelowAxis, fBelowAxis + 40);
  const invBottomP = p(frame, fBottomLabel, fBottomLabel + 40);
  const invAboveP = p(frame, fAboveAxis, fAboveAxis + 40);
  const invTopP = p(frame, fTopLabel, fTopLabel + 40);
  const invSwapP = p(frame, fSwap, fSwapped);
  const invImageP = p(frame, fSwap, fSwapped);
  const invStampP = p(frame, fUpsideDown, fUpsideDown + 45);
  const invInvertedP = p(frame, fInverted, fInverted + 45);

  // converging (scene-01)
  const cvInP = p(frame, fConvIn, fConvInEnd);
  const cvBendP = p(frame, fConvBend, fConvBendEnd);
  const cvCapP = p(frame, fConvCap, fConvCap + 45);
  const cvSpotP = p(frame, fConvSpot, fConvLabel);

  // lens bulge (scene-04): thin -> fat while the shape is narrated
  const lensBulgeP = variant === "focus_convergence" ? p(frame, fLook, fLensShapeEnd) : 1;
  const lensK = lerp(3, 30, lensBulgeP);
  const fatGlowP = variant === "focus_convergence" ? p(frame, fFatMid, fFatMidEnd) : 0;

  // guides (scene-03)
  const gAxisP = p(frame, fGAxis, fGAxisEnd);
  const gAxisLabelP = p(frame, fGAxisLabel, fGAxisLabel + 30);
  const gGroundP = p(frame, fGGround, fGGround + 40);
  const gLensP = p(frame, fGLens, fGLensEnd);
  const gOP = p(frame, fGO, fGO + 30);
  const gF1P = p(frame, fGF1Dot, fGF1Dot + 30);
  const gF2P = p(frame, fGF2Dot, fGF2Dot + 30);
  const gFocalP = p(frame, fGF1Label, fGF1Label + 40);
  const gAxisPulseP = p(frame, fGFaxis, fGFaxis + 60);
  const gGuide1P = p(frame, fGAxis, fGAxis + 30);
  const gGuide2P = p(frame, fGLens, fGLens + 30);

  // full (scene-09)
  const f9ObjectP = p(frame, fPlace, fPlaceEnd);
  const f9InP = p(frame, fS1, fS1Parallel);
  const f9BendP = p(frame, fS1Parallel, fS1End);
  const f9S2P = p(frame, fS2, fS2End);
  const f9CrossP = p(frame, fCross9, fBam);
  const f9ImageP = p(frame, fImage, fImageEnd);
  const f9RealP = p(frame, fReal, fBetween);

  // ---- Common ray endpoint math ------------------------------------------
  // Red ray (parallel -> F2): refracts from (OX, objTopY) THROUGH F2 and out.
  // Endpoint is computed from F2 so the ray passes EXACTLY through (OX+F, OY).
  const rayEndX = OX + 1.6 * F;
  const redOutY = OY + (OY - objTopY) * ((rayEndX - OX - F) / F);
  // Yellow ray (through O): straight line from object top through O
  const yellowOutY = OY + (OY - objTopY) * ((rayEndX - OX) / (OX - objX));

  // F1-ray for shortcut3: (objX, objTopY) -> F1 -> (OX, yAtLens), then horizontal
  const f1X = OX - F;
  const s3LensY = objTopY + (OY - objTopY) * ((OX - objX) / (f1X - objX));

  const showObject = variant !== "focus_convergence" && variant !== "inversion" && variant !== "converging" && variant !== "guides";

  return (
    <div style={{ flex: 1, position: "relative", width: "100%", height: "100%" }}>
      <PaperBackground />
      {audio && <Audio src={staticFile(audio)} />}

      <div
        style={{
          position: "absolute",
          top: "80px",
          left: "120px",
          right: "80px",
          bottom: "80px",
          display: "grid",
          gridTemplateColumns: "1fr 1.2fr",
          alignItems: "center",
          gap: "40px",
        }}
      >
        {/* Left Column: Text */}
        <div style={{ opacity: textOpacity, transform: `translateX(${textTranslateX}px)`, fontFamily: outfitFont }}>
          <h2 style={{ fontSize: "44px", fontWeight: 800, color: AppColors.blue, margin: "0 0 16px 0", lineHeight: 1.2 }}>
            {title}
          </h2>
          {subtitle && (
            <p style={{ fontFamily: serifFont, fontSize: "24px", lineHeight: "36px", color: AppColors.textLightSecondary, margin: 0 }}>
              {subtitle}
            </p>
          )}
        </div>

        {/* Right Column: Dynamic SVG Ray Tracing Canvas */}
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            opacity: diagramOpacity,
            transform: `scale(${diagramScale})`,
            height: "100%",
          }}
        >
          <svg
            width="480"
            height="340"
            viewBox="0 0 480 340"
            style={{
              backgroundColor: "#0F172A",
              border: `2px solid #334155`,
              borderRadius: "16px",
              boxShadow: "0 12px 32px rgba(0, 0, 0, 0.25)",
            }}
          >
            {/* Principal Axis (the guides variant draws it live while narrated) */}
            {variant !== "guides" && (
              <>
                <line x1="20" y1={OY} x2="460" y2={OY} stroke="#64748B" strokeWidth="2" strokeDasharray="4 4" />
                <text x="25" y={OY - 8} fontFamily={outfitFont} fontSize="11" fill="#64748B" fontWeight="bold">
                  Principal Axis (Ground Line)
                </text>
              </>
            )}

            {/* Focal Points Labels (the guides variant pops in F1/F2 at the end) */}
            {variant !== "guides" && (
              <>
                <circle cx={OX - 2 * F} cy={OY} r="4" fill="#38BDF8" />
                <text x={OX - 2 * F - 12} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#94A3B8">2F₁</text>
                <circle cx={OX - F} cy={OY} r="4" fill="#38BDF8" />
                <text x={OX - F - 8} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#94A3B8">F₁</text>
                <circle cx={OX} cy={OY} r="5" fill="#F8FAFC" />
                <text x={OX - 6} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#F8FAFC">O</text>
                <circle cx={OX + F} cy={OY} r="5" fill="#38BDF8" />
                <text x={OX + F - 8} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#38BDF8">F₂</text>
                <circle cx={OX + 2 * F} cy={OY} r="4" fill="#38BDF8" />
                <text x={OX + 2 * F - 12} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#94A3B8">2F₂</text>
              </>
            )}

            {/* Convex Lens Shape (the guides variant pops it in during guide 2) */}
            {variant !== "guides" && (
              <>
                <path
                  d={`M ${OX} ${OY - 120} Q ${OX + lensK} ${OY} ${OX} ${OY + 120} Q ${OX - lensK} ${OY} ${OX} ${OY - 120}`}
                  fill="rgba(56, 189, 248, 0.15)"
                  stroke="#38BDF8"
                  strokeWidth="3"
                />
                <line x1={OX} y1={OY - 120} x2={OX} y2={OY + 120} stroke="#38BDF8" strokeWidth="1" strokeDasharray="3 3" opacity="0.6" />
              </>
            )}
            {/* Glow on the fat middle while "fat in the middle" is spoken (scene-04) */}
            {fatGlowP > 0 && (
              <circle cx={OX} cy={OY} r={16 + fatGlowP * 12} fill="rgba(56, 189, 248, 0.25)" opacity={fatGlowP * 0.9} />
            )}

            {/* Object Arrow (hidden for focus_convergence / inversion which draw their own scene) */}
            {showObject && (
              <g opacity={variant === "full" ? f9ObjectP : 1}>
                <line x1={objX} y1={OY} x2={objX} y2={objTopY} stroke="#F97316" strokeWidth="5" strokeLinecap="round" />
                <polygon
                  points={`${objX},${objTopY - 8} ${objX - 6},${objTopY + 4} ${objX + 6},${objTopY + 4}`}
                  fill="#F97316"
                />
                <text x={objX - 20} y={objTopY - 14} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#F97316">
                  Object
                </text>
              </g>
            )}

            {/* ============ VARIANT: guides (scene-03) ============ */}
            {variant === "guides" && (
              <>
                {/* Guide badges */}
                <g opacity={gGuide1P}>
                  <rect x={36} y={30} width="200" height="36" rx="8" fill="#1E293B" stroke="#94A3B8" strokeWidth="1.5" />
                  <text x={52} y={54} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill="#CBD5E1">
                    GUIDE 1 — Principal Axis
                  </text>
                </g>
                <g opacity={gGuide2P}>
                  <rect x={36} y={30} width="212" height="36" rx="8" fill="#1E293B" stroke="#38BDF8" strokeWidth="1.5" />
                  <text x={52} y={54} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill="#38BDF8">
                    GUIDE 2 — Optical Center O
                  </text>
                </g>

                {/* 1. Principal Axis draws live while narrated */}
                {gAxisP > 0 && (
                  <line x1={20} y1={OY} x2={lerp(20, 460, gAxisP)} y2={OY} stroke="#94A3B8" strokeWidth="2.5" strokeDasharray="4 4" />
                )}
                <g opacity={gAxisLabelP}>
                  <text x={25} y={OY - 10} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#CBD5E1">
                    Principal Axis (Ground Line)
                  </text>
                </g>
                <g opacity={gGroundP}>
                  <text x={25} y={OY + 26} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FBBF24">
                    Think of it as the GROUND LINE!
                  </text>
                </g>

                {/* 2. Lens appears, then the bullseye Optical Center O */}
                <g opacity={gLensP}>
                  <path
                    d={`M ${OX} ${OY - 120} Q ${OX + 25} ${OY} ${OX} ${OY + 120} Q ${OX - 25} ${OY} ${OX} ${OY - 120}`}
                    fill="rgba(56, 189, 248, 0.15)"
                    stroke="#38BDF8"
                    strokeWidth="3"
                  />
                  <line x1={OX} y1={OY - 120} x2={OX} y2={OY + 120} stroke="#38BDF8" strokeWidth="1" strokeDasharray="3 3" opacity="0.6" />
                </g>
                {gOP > 0 && (
                  <g opacity={gOP}>
                    <circle cx={OX} cy={OY} r="13" fill="none" stroke="#F8FAFC" strokeWidth="1.5" />
                    <line x1={OX - 17} y1={OY} x2={OX + 17} y2={OY} stroke="#F8FAFC" strokeWidth="1.5" />
                    <line x1={OX} y1={OY - 17} x2={OX} y2={OY + 17} stroke="#F8FAFC" strokeWidth="1.5" />
                    <circle cx={OX} cy={OY} r="5" fill="#F8FAFC" />
                    <text x={OX - 8} y={OY - 22} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#F8FAFC">
                      O — Optical Center
                    </text>
                  </g>
                )}

                {/* Focal Points F1 F2: dots appear while narrated, then labelled */}
                {gF1P > 0 && <circle cx={OX - F} cy={OY} r="4" fill="#38BDF8" opacity={gF1P} />}
                {gF2P > 0 && <circle cx={OX + F} cy={OY} r="4" fill="#38BDF8" opacity={gF2P} />}
                <g opacity={gFocalP}>
                  <text x={OX - F - 8} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#38BDF8">F₁</text>
                  <text x={OX + F - 8} y={OY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#38BDF8">F₂</text>
                  <text x={36} y={OY - 74} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#7DD3FC">
                    These are the Focal Points!
                  </text>
                </g>

                {/* Axis pulse while "sit right on the Principal Axis" is spoken */}
                {gAxisPulseP > 0 && (
                  <line x1={OX - F - 20} y1={OY} x2={OX + F + 20} y2={OY} stroke="#7DD3FC" strokeWidth="5" opacity={gAxisPulseP * 0.6} />
                )}
                <text x={36} y={OY + 52} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#FBBF24" opacity={gAxisPulseP}>
                  Focal Points sit right ON the Principal Axis!
                </text>
              </>
            )}

            {/* ============ VARIANT: focus_convergence (scene-04) ============ */}
            {variant === "focus_convergence" && (
              <>
                {convRays.map((ray, i) => {
                  const lensY = OY + ray.h;
                  const refractedEndY = OY - ray.h * ((rayEndX - OX - F) / F); // line passes EXACTLY through F2
                  const inX = 60 + (OX - 60) * convInP;
                  // Axis ray (h=0) passes straight through O; others bend toward F2
                  const bend = ray.h < 0 ? convTopP : ray.h > 0 ? convBottomP : convInP;
                  const outX = OX + (rayEndX - OX) * bend;
                  const outY = lensY + (refractedEndY - lensY) * bend;
                  return (
                    <g key={i}>
                      {convInP > 0 && (
                        <line x1={60} y1={lensY} x2={inX} y2={lensY} stroke={ray.color} strokeWidth="3" strokeLinecap="round" />
                      )}
                      {bend > 0 && (
                        <line x1={OX} y1={lensY} x2={outX} y2={outY} stroke={ray.color} strokeWidth="3" strokeLinecap="round" />
                      )}
                    </g>
                  );
                })}
                {/* F2 convergence halo + FOCUS label */}
                <circle
                  cx={OX + F}
                  cy={OY}
                  r={pulseRadius + convGatherP * 14}
                  fill="none"
                  stroke="#38BDF8"
                  strokeWidth="3"
                  opacity={0.4 + convGatherP * 0.6}
                />
                <g opacity={p(frame, fFocus, fFocus + 30)}>
                  <circle cx={OX + F} cy={OY} r="9" fill="#38BDF8" />
                  <text x={OX + F - 8} y={OY - 16} fontFamily={outfitFont} fontSize="16" fontWeight="bold" fill="#7DD3FC">
                    F₂ = FOCUS
                  </text>
                </g>
                <text x={70} y={OY - 95} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={rayColors.red} opacity={convTopP + 0.15}>
                  Top rays — bent DOWN
                </text>
                <text x={70} y={OY + 110} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={rayColors.yellow} opacity={convBottomP + 0.15}>
                  Bottom rays — bent UP
                </text>
              </>
            )}

            {/* ============ VARIANT: converging intro (scene-01) ============ */}
            {variant === "converging" && (
              <>
                {convRays.map((ray, i) => {
                  const lensY = OY + ray.h;
                  const refractedEndY = OY - ray.h * ((rayEndX - OX - F) / F); // line through F2
                  const inX = 60 + (OX - 60) * cvInP;
                  const bend = ray.h === 0 ? cvInP : cvBendP; // axis ray stays straight
                  const outX = OX + (rayEndX - OX) * bend;
                  const outY = lensY + (refractedEndY - lensY) * bend;
                  return (
                    <g key={i}>
                      {cvInP > 0 && (
                        <line x1={60} y1={lensY} x2={inX} y2={lensY} stroke={ray.color} strokeWidth="3" strokeLinecap="round" />
                      )}
                      {bend > 0 && (
                        <line x1={OX} y1={lensY} x2={outX} y2={outY} stroke={ray.color} strokeWidth="3" strokeLinecap="round" />
                      )}
                    </g>
                  );
                })}

                {/* Caption while CONVERGING is being defined */}
                <text x={OX - 130} y={OY - 140} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill="#FBBF24" opacity={cvCapP}>
                  CONVERGING lens = brings scattered rays together
                </text>

                {/* The ONE glowing spot at F2 where all rays meet */}
                <g opacity={cvSpotP}>
                  <circle cx={OX + F} cy={OY} r={10 + Math.sin(frame * 0.4) * 4} fill="#F8FAFC" opacity={0.95} />
                  <circle cx={OX + F} cy={OY} r={18 + Math.sin(frame * 0.4) * 6} fill="none" stroke="#FBBF24" strokeWidth="3" opacity={0.7} />
                </g>
                <text x={OX + F - 74} y={OY - 24} fontFamily={outfitFont} fontSize="16" fontWeight="bold" fill="#F8FAFC" opacity={cvSpotP}>
                  ONE SPOT = the FOCUS (F₂)!
                </text>
              </>
            )}

            {/* ============ VARIANT: shortcut1 (scene-05) ============ */}
            {variant === "shortcut1" && (
              <>
                {s1InP > 0 && (
                  <line x1={objX} y1={objTopY} x2={lerp(objX, OX, s1InP)} y2={objTopY} stroke={rayColors.red} strokeWidth="3" strokeLinecap="round" />
                )}
                {s1BendP > 0 && (
                  <>
                    <line
                      x1={OX}
                      y1={objTopY}
                      x2={lerp(OX, rayEndX, s1BendP)}
                      y2={lerp(objTopY, redOutY, s1BendP)}
                      stroke={rayColors.red}
                      strokeWidth="3"
                      strokeLinecap="round"
                    />
                    <circle
                      cx={OX + F}
                      cy={OY}
                      r={pulseRadius + s1F2Pulse * 6}
                      fill="none"
                      stroke="#EF4444"
                      strokeWidth="2"
                      opacity={pulseOpacity * (0.3 + s1F2Pulse)}
                    />
                  </>
                )}
                <g opacity={s1MagnetP}>
                  <text x={OX + F - 78} y={OY - 30} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FBBF24">
                    Focus = magnet pulling parallel rays inward
                  </text>
                </g>
              </>
            )}

            {/* ============ VARIANT: shortcut2 (scene-06) ============ */}
            {variant === "shortcut2" && (
              <>
                {s2InP > 0 && (
                  <line x1={objX} y1={objTopY} x2={lerp(objX, OX, s2InP)} y2={lerp(objTopY, OY, s2InP)} stroke={rayColors.yellow} strokeWidth="3" strokeLinecap="round" />
                )}
                {s2OutP > 0 && (
                  <>
                    <line
                      x1={OX}
                      y1={OY}
                      x2={lerp(OX, rayEndX, s2OutP)}
                      y2={lerp(OY, yellowOutY, s2OutP)}
                      stroke={rayColors.yellow}
                      strokeWidth="3"
                      strokeLinecap="round"
                    />
                    <circle
                      cx={OX}
                      cy={OY}
                      r={pulseRadius + s2OPulse * 6}
                      fill="none"
                      stroke="#EAB308"
                      strokeWidth="2"
                      opacity={pulseOpacity * (0.3 + s2OPulse)}
                    />
                  </>
                )}
                <g opacity={s2DartP}>
                  <text x={OX - 150} y={OY - 30} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FBBF24">
                    Flat center: ray shoots straight through like a dart
                  </text>
                </g>
              </>
            )}

            {/* ============ VARIANT: shortcut3 (scene-07) ============ */}
            {variant === "shortcut3" && (
              <>
                {s3InP > 0 && (
                  <line
                    x1={objX}
                    y1={objTopY}
                    x2={lerp(objX, OX, s3InP)}
                    y2={lerp(objTopY, s3LensY, s3InP)}
                    stroke={rayColors.red}
                    strokeWidth="3"
                    strokeLinecap="round"
                  />
                )}
                {s3InP > 0 && (
                  <circle
                    cx={f1X}
                    cy={OY}
                    r={pulseRadius + s3F1Pulse * 6}
                    fill="none"
                    stroke="#EF4444"
                    strokeWidth="2"
                    opacity={pulseOpacity * (0.3 + s3F1Pulse)}
                  />
                )}
                {s3OutP > 0 && (
                  <>
                    <line
                      x1={OX}
                      y1={s3LensY}
                      x2={lerp(OX, 460, s3OutP)}
                      y2={s3LensY}
                      stroke={rayColors.red}
                      strokeWidth="3"
                      strokeLinecap="round"
                    />
                    <text x={OX + 8} y={s3LensY - 12} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#7DD3FC" opacity={s3OutP}>
                      Exits flat & parallel to the axis
                    </text>
                  </>
                )}
              </>
            )}

            {/* ============ VARIANT: inversion (scene-08) ============ */}
            {variant === "inversion" && (
              <>
                {/* Candle spanning the axis: flame above, base below */}
                <rect x={objX - 9} y={baseY - 76} width="18" height="76" rx="3" fill="#F97316" opacity="0.9" />
                <rect x={objX - 12} y={baseY - 78} width="24" height="6" rx="2" fill="#FDBA74" />
                <path
                  d={`M ${objX} ${flameY} Q ${objX + 12} ${flameY + 18} ${objX} ${flameY + 34} Q ${objX - 12} ${flameY + 18} ${objX} ${flameY}`}
                  fill="#FBBF24"
                />
                <text x={objX - 16} y={baseY + 24} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#F97316">
                  Candle
                </text>

                {/* Step badges (mutually exclusive) */}
                <g opacity={invStep1P}>
                  <rect x={36} y={30} width="212" height="36" rx="8" fill="#1E293B" stroke="#38BDF8" strokeWidth="1.5" />
                  <text x={52} y={54} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill="#38BDF8">
                    STEP 1 — follow the FLAME ray
                  </text>
                </g>
                <g opacity={invStep2P}>
                  <rect x={36} y={30} width="210" height="36" rx="8" fill="#1E293B" stroke="#FBBF24" strokeWidth="1.5" />
                  <text x={52} y={54} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill="#FBBF24">
                    STEP 2 — follow the BASE ray
                  </text>
                </g>
                <g opacity={invStep3P}>
                  <rect x={36} y={30} width="210" height="36" rx="8" fill="#1E293B" stroke="#22C55E" strokeWidth="1.5" />
                  <text x={52} y={54} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill="#22C55E">
                    STEP 3 — they SWAP places!
                  </text>
                </g>

                {/* Base glow while "the base of the candle is below the axis" */}
                {invBaseGlowP > 0 && (
                  <circle
                    cx={objX}
                    cy={baseY}
                    r={18 + Math.sin(frame * 0.3) * 6}
                    fill="none"
                    stroke="#FBBF24"
                    strokeWidth="3"
                    opacity={0.5 + Math.sin(frame * 0.3) * 0.3}
                  />
                )}

                {/* Red ray: from flame tip, parallel, bends DOWN through F2 */}
                {invTopInP > 0 && (
                  <line x1={objX} y1={flameY} x2={lerp(objX, OX, invTopInP)} y2={flameY} stroke={rayColors.red} strokeWidth="3" strokeLinecap="round" />
                )}
                {invTopOutP > 0 && (
                  <line
                    x1={OX}
                    y1={flameY}
                    x2={lerp(OX, invImgX, invTopOutP)}
                    y2={lerp(flameY, invFlameImgY, invTopOutP)}
                    stroke={rayColors.red}
                    strokeWidth="3"
                    strokeLinecap="round"
                  />
                )}

                {/* Yellow ray: from candle base, bends UP through F2 */}
                {invBaseInP > 0 && (
                  <line x1={objX} y1={baseY} x2={lerp(objX, OX, invBaseInP)} y2={baseY} stroke={rayColors.yellow} strokeWidth="3" strokeLinecap="round" />
                )}
                {invBaseOutP > 0 && (
                  <line
                    x1={OX}
                    y1={baseY}
                    x2={lerp(OX, invImgX, invBaseOutP)}
                    y2={lerp(baseY, invBaseImgY, invBaseOutP)}
                    stroke={rayColors.yellow}
                    strokeWidth="3"
                    strokeLinecap="round"
                  />
                )}

                {/* F2 pulse while either ray bends through the focus */}
                {(invTopOutP > 0 || invBaseOutP > 0) && (
                  <circle
                    cx={OX + F}
                    cy={OY}
                    r={pulseRadius + 4}
                    fill="none"
                    stroke="#F8FAFC"
                    strokeWidth="2.5"
                    opacity={pulseOpacity}
                  />
                )}

                {/* Ray-path labels spelling out each step */}
                <g opacity={invAboveP}>
                  <rect x={OX + 12} y={OY - 92} width="156" height="30" rx="7" fill="#1E293B" stroke="#EAB308" strokeWidth="1.5" />
                  <text x={OX + 24} y={OY - 72} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FDE047">
                    BASE ray → ABOVE axis
                  </text>
                </g>
                <g opacity={invTopP}>
                  <rect x={OX + 12} y={OY - 128} width="150" height="30" rx="7" fill="#1E293B" stroke="#EAB308" strokeWidth="1.5" />
                  <text x={OX + 24} y={OY - 108} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FDE047">
                    BASE ends at TOP!
                  </text>
                </g>
                <g opacity={invBelowP}>
                  <rect x={OX + 12} y={OY + 34} width="156" height="30" rx="7" fill="#1E293B" stroke="#EF4444" strokeWidth="1.5" />
                  <text x={OX + 24} y={OY + 54} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#F87171">
                    FLAME ray → BELOW axis
                  </text>
                </g>
                <g opacity={invBottomP}>
                  <rect x={OX + 12} y={OY + 68} width="160" height="30" rx="7" fill="#1E293B" stroke="#F97316" strokeWidth="1.5" />
                  <text x={OX + 24} y={OY + 88} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FDBA74">
                    FLAME ends at BOTTOM!
                  </text>
                </g>

                {/* Swap arrows: flame TOP -> image BOTTOM, base BOTTOM -> image TOP */}
                {invSwapP > 0 && (
                  <>
                    <line x1={objX + 24} y1={flameY} x2={invImgX - 18} y2={invFlameImgY} stroke="#F97316" strokeWidth="3" strokeDasharray="7 6" />
                    <polygon points={`${invImgX - 12},${invFlameImgY + 6} ${invImgX - 28},${invFlameImgY - 4} ${invImgX - 26},${invFlameImgY + 10}`} fill="#F97316" />
                    <text x={148} y={148} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FDBA74">
                      TOP → bottom
                    </text>
                    <line x1={objX + 24} y1={baseY} x2={invImgX - 18} y2={invBaseImgY} stroke="#EAB308" strokeWidth="3" strokeDasharray="7 6" />
                    <polygon points={`${invImgX - 12},${invBaseImgY - 6} ${invImgX - 28},${invBaseImgY + 4} ${invImgX - 26},${invBaseImgY - 10}`} fill="#EAB308" />
                    <text x={143} y={200} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#FDE047">
                      bottom → TOP
                    </text>
                  </>
                )}

                {/* Inverted image: flame at BOTTOM, base at TOP */}
                {invImageP > 0 && (
                  <g opacity={invImageP}>
                    <line x1={invImgX} y1={invBaseImgY} x2={invImgX} y2={lerp(invBaseImgY, invFlameImgY, invImageP)} stroke={rayColors.green} strokeWidth="5" strokeLinecap="round" />
                    <polygon
                      points={`${invImgX},${lerp(invBaseImgY, invFlameImgY, invImageP) + 8} ${invImgX - 6},${lerp(invBaseImgY, invFlameImgY, invImageP) - 4} ${invImgX + 6},${lerp(invBaseImgY, invFlameImgY, invImageP) - 4}`}
                      fill={rayColors.green}
                    />
                    <text x={invImgX - 14} y={invBaseImgY - 10} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={rayColors.green}>
                      Real Image
                    </text>
                  </g>
                )}

                {/* UPSIDE DOWN stamp under the image */}
                <g opacity={invStampP}>
                  <text
                    x={invImgX - 60}
                    y={invFlameImgY + 28}
                    fontFamily={outfitFont}
                    fontSize="22"
                    fontWeight="800"
                    fill="#F87171"
                    transform={`rotate(-4 ${invImgX} ${invFlameImgY + 28})`}
                  >
                    UPSIDE DOWN!
                  </text>
                </g>

                {/* Closing takeaway when narration says images are inverted */}
                <text x={40} y={OY + 122} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill="#7DD3FC" opacity={invInvertedP}>
                  Real images are ALWAYS inverted!
                </text>
              </>
            )}

            {/* ============ VARIANT: full (scene-09 + reel default) ============ */}
            {variant === "full" && (
              <>
                {/* Ray 1: Red parallel ray -> refracts through F2 */}
                {f9InP > 0 && (
                  <line x1={objX} y1={objTopY} x2={lerp(objX, OX, f9InP)} y2={objTopY} stroke={rayColors.red} strokeWidth="3" strokeLinecap="round" />
                )}
                {f9BendP > 0 && (
                  <>
                    <line
                      x1={OX}
                      y1={objTopY}
                      x2={lerp(OX, rayEndX, f9BendP)}
                      y2={lerp(objTopY, redOutY, f9BendP)}
                      stroke={rayColors.red}
                      strokeWidth="3"
                      strokeLinecap="round"
                    />
                    <circle
                      cx={OX + F}
                      cy={OY}
                      r={pulseRadius}
                      fill="none"
                      stroke="#EF4444"
                      strokeWidth="2"
                      opacity={pulseOpacity}
                    />
                  </>
                )}

                {/* Ray 2: Yellow ray through Optical Center O */}
                {f9S2P > 0 && (
                  <>
                    <line
                      x1={objX}
                      y1={objTopY}
                      x2={lerp(objX, rayEndX, f9S2P)}
                      y2={lerp(objTopY, yellowOutY, f9S2P)}
                      stroke={rayColors.yellow}
                      strokeWidth="3"
                      strokeLinecap="round"
                    />
                    <circle
                      cx={OX}
                      cy={OY}
                      r={pulseRadius}
                      fill="none"
                      stroke="#EAB308"
                      strokeWidth="2"
                      opacity={pulseOpacity}
                    />
                  </>
                )}

                {/* Crossing flash where the two rays meet (x = ray crossing) */}
                <circle
                  cx={imgX}
                  cy={imgTopY}
                  r={8 + f9CrossP * flashPulse}
                  fill="#F8FAFC"
                  opacity={0.2 + f9CrossP * 0.6}
                />

                {/* Inverted Real Image */}
                {f9ImageP > 0 && (
                  <g opacity={f9ImageP}>
                    <line x1={imgX} y1={OY} x2={imgX} y2={lerp(OY, imgTopY, f9ImageP)} stroke={rayColors.green} strokeWidth="5" strokeLinecap="round" />
                    <polygon
                      points={`${imgX},${lerp(OY, imgTopY, f9ImageP) + 8} ${imgX - 6},${lerp(OY, imgTopY, f9ImageP) - 4} ${imgX + 6},${lerp(OY, imgTopY, f9ImageP) - 4}`}
                      fill={rayColors.green}
                    />
                    <text x={imgX - 22} y={imgTopY + 26} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={rayColors.green}>
                      Real Image
                    </text>
                  </g>
                )}

                {/* Summary chip: Real, Inverted, Diminished, between F2 and 2F2 */}
                <g opacity={f9RealP}>
                  <rect x={OX + F - 60} y={OY + 44} width="150" height="64" rx="10" fill="#1E293B" stroke="#334155" strokeWidth="1.5" />
                  <text x={OX + F - 45} y={OY + 66} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={rayColors.green}>
                    Real • Inverted
                  </text>
                  <text x={OX + F - 45} y={OY + 88} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill="#7DD3FC">
                    Diminished • between F₂ & 2F₂
                  </text>
                </g>
              </>
            )}
          </svg>
        </div>
      </div>
    </div>
  );
};
