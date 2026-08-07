import React from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, staticFile } from "remotion";
import { PaperBackground } from "./PaperBackground";
import { AppColors, outfitFont, serifFont } from "../theme";
import { WordAlignment } from "../data/schema";

type Variant =
  | "intro"
  | "oersted"
  | "bar_magnet"
  | "straight_conductor"
  | "solenoid"
  | "electromagnet"
  | "fleming"
  | "induction"
  | "motor_generator"
  | "electron_trick"
  | "arrows_rule";

interface MagneticSceneProps {
  title: string;
  subtitle?: string;
  audio?: string;
  variant?: Variant;
  alignments?: WordAlignment[];
  teacherScript?: string;
}

const lerp = (a: number, b: number, p: number) => a + (b - a) * p;

const cleanWord = (w: string) => w.toLowerCase().replace(/[^a-z0-9]/g, "");

const C = {
  red: "#EF4444",
  blue: "#3B82F6",
  amber: "#FBBF24",
  green: "#22C55E",
  sky: "#7DD3FC",
  slate: "#94A3B8",
  white: "#F8FAFC",
  orange: "#F97316",
  dark: "#0F172A",
};

// Real right-hand thumbs-up: mirrored from public/left-thumb-up-svgrepo-com.svg
// (left hand flipped horizontally = right hand), filled with a skin tone.
const RIGHT_HAND_D =
  "M302.344 28.514c-2.386 1.354-4.334 3.497-6.273 7.182-2.335 4.438-4.28 10.836-5.94 18.29-3.316 14.91-5.51 33.828-12.098 51.26l-.54 1.43-.982 1.17c-53.308 63.59-92.07 98.36-119.014 148.817l-2.46 4.605-5.22.15s-10.63.322-22.607 2.46c-11.978 2.137-43.225 3.316-46.132 7.017-13.33 16.97-23.48 45.76-25.072 70.46-1.592 24.697 3.872 48.986 16.676 65.568.858 1.11 29.53 4.57 38.22 5.302 8.693.73 16.52.162 16.52.162l6.08-.457 2.678 5.48c14.83 30.325 61.456 50.595 110.937 66.056 4.384.248 11.962-1.82 20.852-6.295-19.818-7.57-35.37-14.03-52.5-23.087l-4.423-2.338-.347-4.99c-.896-12.814 5.672-23.273 13.61-30.256 2.54-2.237 5.24-4.216 7.985-6.038-1.54-.685-3.074-1.38-4.62-2.053l-4.698-2.05-.635-5.086c-1.752-14.04 2.566-27.897 11.664-37.728 1.852-2 3.932-3.81 6.19-5.405l-.23-.1-.438-5.31c-1.313-15.828 8.72-29.44 20.295-39.02 2.13-1.764 4.347-3.44 6.623-4.985l-.91-2.148c-4.49-10.608-2.336-21.785 3.01-29.815 5.35-8.03 13.357-13.657 21.92-16.79l.232-.086.236-.073c16.656-5.078 32.616-1.007 47.756 3.03 15.14 4.036 29.842 8.22 45.14 6.923 9.286 15.502 8.095 12.523 10.49 17.176l-8.966.76c-19.417 1.647-36.48-3.515-51.3-7.467-14.71-3.92-26.832-6.456-37.616-3.264-5.132 1.933-10.21 5.715-12.908 9.77-2.15 3.226-3.06 6.18-2.338 9.75 21.768 9.268 38.374 19.347 57.04 24.798 19.682 5.746 42.49 7.06 79.325-3.035 5.858-2.842 11.615-7.678 15.014-12.946 3.503-5.427 4.637-10.646 2.87-16-6.415-19.43-15.202-36.684-33.028-48.515-40.155-16.703-65.958-16.832-101.275-13.336-.627-5.215-.437-10.644.022-18.09 2.066-15.153 8.845-33.844 16.745-55.096 9.792-26.342 21.692-55.157 30.416-78.892-2.042-19.79-7.618-30.87-15.044-37.3-7.295-6.315-17.56-9.054-30.932-9.564zm-14.53 290.698c-4.52 1.1-10.952 3.76-16.513 8.363-6.763 5.6-11.67 12.988-13.268 18.99 24.578 11.48 43.09 22.944 74.63 33.086l66.92-3.794c11.996-4.2 19.78-8.523 24.07-12.197 4.42-3.79 5.292-6.294 5.45-8.77.265-4.15-3.83-11.11-9.88-18.43-37.514 9.835-63.92 8.562-86.034 2.105-16.627-4.855-30.524-12.225-45.375-19.353zm-25.398 49.41c-6.38.195-11.287 2.923-15.2 7.15-4.27 4.616-6.853 11.327-7.09 18.49 23.313 10.374 45.08 21.135 74.69 30.407l56.54-1.095c21.862-.903 27.79-9.79 28.918-17.854.6-4.28-.493-8.504-2.71-11.72l-67.27 3.815-1.57-.496c-28.61-9.035-47.056-19.095-66.265-28.698h-.044zm-9.96 50.937c-6.14 3.332-12.053 6.753-16.258 10.452-4.005 3.523-6.404 6.67-7.237 10.69 17.396 8.825 33.933 15.363 57.386 24.162l46.51 1.596c8.015-3.427 12.8-6.69 15.08-9.11 2.44-2.59 2.637-3.797 2.603-5.873-.035-2.12-1.344-5.413-3-9.437l-35.403.685-1.385-.427c-22.878-7.07-41.16-14.99-58.295-22.74z";

// Crane truck icon path (from public/assets/crane-truck.svg, recolored for dark canvas)
const CRANE_D =
  "M471.5,0H350.127c-6.277,0-12.179,2.444-16.617,6.883l-27.313,27.313L60.394,280H47.5c-8.547,0-15.5,6.953-15.5,15.5V320" +
  "h-0.5c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5h4.894L80,378.606V384h-8.5c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5H72v97" +
  "h-0.5c-4.142,0-7.5,3.357-7.5,7.5s3.358,7.5,7.5,7.5h112c4.142,0,7.5-3.357,7.5-7.5s-3.358-7.5-7.5-7.5H183v-97h0.5" +
  "c4.142,0,7.5-3.358,7.5-7.5s-3.358-7.5-7.5-7.5H175v-69.809L395.039,47H424v120.5c0,10.336,6.71,19.128,16,22.266V215.5" +
  "c0,4.142,3.358,7.5,7.5,7.5c4.687,0,8.5,3.813,8.5,8.5s-3.813,8.5-8.5,8.5s-8.5-3.813-8.5-8.5c0-4.142-3.358-7.5-7.5-7.5" +
  "s-7.5,3.358-7.5,7.5c0,12.958,10.542,23.5,23.5,23.5s23.5-10.542,23.5-23.5c0-10.337-6.708-19.136-16-22.273v-19.461" +
  "c9.29-3.138,16-11.93,16-22.266V47h8.5c4.142,0,7.5-3.358,7.5-7.5v-24C487,6.953,480.047,0,471.5,0z M314.606,47h10.787" +
  "L91.332,281.061c-1.123-0.67-2.43-1.061-3.832-1.061h-5.894L314.606,47z M47,295.5c0-0.276,0.224-0.5,0.5-0.5h32.525" +
  "c-0.011,0.166-0.025,0.332-0.025,0.5V320H47V295.5z M57.606,335H80v22.394L57.606,335z M168,496H87v-97h81V496z M161.71,306.732" +
  "c-1.106,1.343-1.71,3.028-1.71,4.768V384H95v-8.497c0-0.002,0-0.003,0-0.005v-76.891L346.606,47h29.001L161.71,306.732z M447.5,176" +
  "c-4.687,0-8.5-3.813-8.5-8.5s3.813-8.5,8.5-8.5s8.5,3.813,8.5,8.5S452.187,176,447.5,176z M456,145.597" +
  "c-2.638-1.027-5.503-1.597-8.5-1.597s-5.862,0.57-8.5,1.597V47h17V145.597z M472,32h-80.496c-0.005,0-0.01,0-0.015,0h-61.882" +
  "l14.51-14.51c1.605-1.605,3.74-2.49,6.011-2.49H471.5c0.276,0,0.5,0.224,0.5,0.5V32z";

// Doorbell icon paths (from public/assets/door-bell.svg)
const DOORBELL_PATHS: Array<[string, string]> = [
  [
    "M687.5 154.6c-102.2-82.8-249.1-82.8-351.2 0 0 0-19.9 21.7-33.9 21.7s-7.8-21.7-7.8-21.7c120-120 314.6-120 434.6 0 0 0 6.2 21.7-7.8 21.7s-33.9-21.7-33.9-21.7z",
    "#5E676F",
  ],
  [
    "M358.2 232.2c-14 0-4.4-18.4-4.4-18.4 87.3-87.3 228.8-87.3 316.1 0 0 0 9.6 18.4-4.4 18.4s-38.4-18.4-38.4-18.4c-68.4-50-162-50-230.5 0 0 0-24.4 18.4-38.4 18.4z",
    "#5E676F",
  ],
  [
    "M413.1 288.1c-15 0 0-15 0-15 54.6-54.6 143-54.6 197.6 0 0 0 15 15 0 15s-46.4-15-46.4-15c-32.6-17.3-72-17.3-104.7 0 0 0-31.5 15-46.5 15zM260.4 483.6c0-30.9 23.4-64.9 52.4-74.8 0 0 81-37 202.9-37S711.2 408 711.2 408c28.8 10.9 52.1 44.6 52.1 75.6v363.2c0 30.9-23.2 65.2-52.1 75.6 0 0-73.6 36.2-195.5 36.2s-202.9-37-202.9-37c-29-10.4-52.4-43.8-52.4-74.8V483.6z",
    "#5E676F",
  ],
  [
    "M316.3 483.6v363.2c0 7.4 8.7 19.8 15.5 22.2l4.2 1.7c1.2 0.6 4.8 2 10.5 4.1 10.2 3.7 22.3 7.5 36.1 11.1 39.9 10.4 84.7 16.7 133 16.7 48.2 0 91.5-6.1 128.9-16.2 21.6-5.8 35.8-11.3 41.9-14.3l2.9-1.4 3-1.1c6.2-2.2 15.1-15.2 15.1-23v-363c0-7.7-8.9-20.6-16-23.3l-4.9-2.1c-6.1-3-20.3-8.5-41.9-14.3-37.5-10.1-80.7-16.2-128.9-16.2-48.3 0-93.1 6.3-133 16.7-13.8 3.6-25.9 7.4-36.1 11.1-5.7 2.1-9.3 3.6-10.5 4.1l-5.1 2c-6 2.2-14.7 14.6-14.7 22z",
    "#FFFFFF",
  ],
  [
    "M595.7 623.3c-30.9 0-55.9-25-55.9-55.9s25-55.9 55.9-55.9 55.9 25 55.9 55.9-25 55.9-55.9 55.9zM428.1 623.3c-30.9 0-55.9-25-55.9-55.9s25-55.9 55.9-55.9 55.9 25 55.9 55.9c-0.1 30.9-25.1 55.9-55.9 55.9zM511.9 846.8c-46.3 0-83.8-37.5-83.8-83.8s37.5-83.8 83.8-83.8 83.8 37.5 83.8 83.8-37.5 83.8-83.8 83.8z",
    "#5E676F",
  ],
  [
    "M595.7 595.4c15.4 0 27.9-12.5 27.9-27.9s-12.5-27.9-27.9-27.9-27.9 12.5-27.9 27.9 12.5 27.9 27.9 27.9zM428.1 595.4c15.4 0 27.9-12.5 27.9-27.9s-12.5-27.9-27.9-27.9c-15.4 0-27.9 12.5-27.9 27.9-0.1 15.4 12.4 27.9 27.9 27.9zM511.9 818.9c30.9 0 55.9-25 55.9-55.9s-25-55.9-55.9-55.9-55.9 25-55.9 55.9 25 55.9 55.9 55.9z",
    "#FFFFFF",
  ],
];

// Tiny roadmap icons for the intro variant (drawn centered at 0,0)
const MiniIcon: React.FC<{ type: string; color: string }> = ({ type, color }) => {
  switch (type) {
    case "compass":
      return (
        <g>
          <circle r="9" fill="none" stroke={C.slate} strokeWidth="1.5" />
          <line y1="0" y2="-7" stroke={C.red} strokeWidth="2.5" />
          <line y1="0" y2="7" stroke={C.slate} strokeWidth="2.5" />
          <circle r="1.5" fill={C.white} />
        </g>
      );
    case "magnet":
      return (
        <g>
          <rect x="-10" y="-5" width="10" height="10" rx="2" fill={C.red} />
          <rect x="0" y="-5" width="10" height="10" rx="2" fill={C.blue} />
          <path d="M -10 -5 Q -14 -12 -6 -13" fill="none" stroke={color} strokeWidth="1.5" />
          <path d="M -10 5 Q -14 12 -6 13" fill="none" stroke={color} strokeWidth="1.5" />
        </g>
      );
    case "coil":
      return (
        <g>
          {[-6, 0, 6].map((x) => (
            <ellipse key={x} cx={x} cy="0" rx="3.5" ry="8" fill="none" stroke={C.amber} strokeWidth="1.8" />
          ))}
        </g>
      );
    case "hand":
      return (
        <g>
          <circle r="6" fill="#334155" />
          <line x1="-2" y1="-4" x2="-9" y2="-12" stroke={C.green} strokeWidth="3" strokeLinecap="round" />
          <line x1="3" y1="-4" x2="10" y2="-11" stroke={C.blue} strokeWidth="3" strokeLinecap="round" />
          <line x1="0" y1="5" x2="0" y2="11" stroke={C.amber} strokeWidth="3" strokeLinecap="round" />
        </g>
      );
    case "induction":
      return (
        <g>
          <ellipse cx="-5" cy="0" rx="3" ry="8" fill="none" stroke={C.amber} strokeWidth="1.8" />
          <ellipse cx="1" cy="0" rx="3" ry="8" fill="none" stroke={C.amber} strokeWidth="1.8" />
          <rect x="7" y="-4" width="7" height="8" rx="1.5" fill={C.red} />
        </g>
      );
    case "motor":
      return (
        <g>
          <rect x="-8" y="-6" width="16" height="12" rx="2" fill="none" stroke={C.orange} strokeWidth="2" />
          <rect x="-12" y="-8" width="3" height="16" rx="1" fill={C.red} />
          <rect x="9" y="-8" width="3" height="16" rx="1" fill={C.blue} />
          <path d="M 0 -10 A 6 6 0 1 1 -1 -10" fill="none" stroke={color} strokeWidth="1.8" />
          <polygon points={`3,-13 8,-10 3,-7`} fill={color} />
        </g>
      );
    default:
      return null;
  }
};

export const MagneticScene: React.FC<MagneticSceneProps> = ({
  title,
  subtitle,
  audio,
  variant = "oersted",
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

  // Narration-synchronized timing (same pattern as RayDiagramScene)
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

  // ---- Narration phase markers (seconds -> frames) -----------------------
  // intro (scene-00)
  const fIntroCap = t("Here is what this video covers", 3.7);
  const fChip1 = t("compass needle move", 8.2);
  const fChip2 = t("magnetic field lines around a magnet", 10.8);
  const fChip3 = t("solenoid and the electromagnet", 15.2);
  const fChip4 = t("left hand rule for force", 20.1);
  const fChip5 = t("electromagnetic induction with a magnet and a coil", 24.7);
  const fChip6 = t("motor versus the generator", 31.9);
  const fGo = t("Let us get started", 35.4);

  // oersted (scene-01)
  const fWire = t("placed a compass needle near a wire", 4.1);
  const fWireEnd = te("placed a compass needle near a wire", 5.8);
  const fCurrent = t("carrying current", 5.8);
  const fMove = t("the needle MOVED", 7.1);
  const fMoveEnd = te("the needle MOVED", 8.5);
  const fMagnet = t("creates magnetism", 9.7);

  // bar_magnet (scene-02)
  const fFieldGlow = t("magnetic field around it", 1.0);
  const fLines = t("using field lines", 8.4);
  const fLinesEnd = te("enter the SOUTH pole", 14.5);
  const fInside = t("go from south to north", 16.9);
  const fInsideEnd = te("go from south to north", 18.4);
  const fLoops = t("form CLOSED LOOPS", 19.4);
  const fCross = t("NEVER cross", 22.6);
  const fStrong = t("the field is strong", 25.5);
  const fWeak = t("the field is weak", 28.2);

  // straight_conductor (scene-03): slow step-by-step right-hand rule
  const fCheck = t("check the direction of the CURRENT", 12.1);
  const fUp = t("current is flowing UP the wire", 14.4);
  const fThumbUp = t("point your right thumb UP", 16.8);
  const fCurl = t("curl your fingers", 20.1);
  const fFieldDir = t("show the direction of the MAGNETIC FIELD", 22.3);
  const fAnti = t("curl ANTI-clockwise", 25.3);
  const fRecapUp = t("field ANTI-clockwise", 30.5);
  const fDown = t("current flows DOWN", 34.3);
  const fThumbDown = t("point your thumb DOWN", 38.3);
  const fCurl2 = t("curl your fingers again", 41.0);
  const fClock = t("curl CLOCKWISE", 44.6);
  const fRecapDown = t("field CLOCKWISE", 49.0);
  const fRemember = t("the THUMB follows the current", 54.3);

  // solenoid (scene-04)
  const fTurns = t("many circular turns", 1.6);
  const fAdd = t("COMBINE into one", 7.5);
  const fAddEnd = te("COMBINE into one", 8.7);
  const fSoInside = t("UNIFORM and STRONG", 16.3);
  const fSoInsideEnd = te("UNIFORM and STRONG", 18.0);
  const fOutside = t("looks exactly like a bar magnet", 20.1);
  const fOutsideEnd = te("looks exactly like a bar magnet", 22.0);
  const fPoles = t("NORTH pole, and the other end", 23.5);
  const fPolesEnd = te("NORTH pole, and the other end", 25.2);

  // electromagnet (scene-05)
  const fCore = t("SOFT IRON core", 1.7);
  const fOn = t("picks up iron pins", 9.1);
  const fOnEnd = te("picks up iron pins", 10.4);
  const fOff = t("the pins drop", 14.6);
  const fOffEnd = te("the pins drop", 15.7);
  const fUses = t("cranes use them", 21.9);
  const fDoor = t("doorbells use them too", 23.8);

  // fleming (scene-06): textbook Activity 12.7 — horse-shoe magnet, rod slides
  const fSetup = t("between the poles of a strong magnet", 3.0);
  const fField = t("from the NORTH pole to the SOUTH pole", 6.3);
  const fCurIn = t("INTO the page", 12.4);
  const fForce = t("experiences a FORCE", 15.4);
  const fLeft = t("It moves to the LEFT", 18.1);
  const fRev = t("Reverse the current", 19.6);
  const fCurOut = t("OUT of the page", 20.8);
  const fMoveRight = t("moves to the RIGHT", 22.6);
  const fPerp = t("at RIGHT ANGLES to the field", 25.5);
  const fFlRule = t("FLEMING'S LEFT HAND RULE", 29.3);
  const fStretch = t("all mutually perpendicular", 37.4);
  const fFlField = t("FIRST finger points", 40.0);
  const fFlFieldEnd = te("FIRST finger points", 41.0);
  const fFlCur = t("MIDDLE finger points", 43.2);
  const fFlCurEnd = te("MIDDLE finger points", 44.2);
  const fFlThumb = t("THUMB points", 46.7);
  const fFlThumbEnd = te("THUMB points", 47.5);
  const fRight = t("all at right angles to each other", 56.2);

  // induction (scene-07)
  const fIn = t("Push the magnet INTO the coil", 9.4);
  const fInEnd = te("Push the magnet INTO the coil", 11.4);
  const fDeflect = t("needle DEFLECTS", 12.6);
  const fDeflectEnd = te("needle DEFLECTS", 14.0);
  const fStill = t("the needle returns to zero", 16.1);
  const fStillEnd = te("the needle returns to zero", 17.5);
  const fOut = t("deflects the OTHER way", 20.3);
  const fOutEnd = te("deflects the OTHER way", 21.5);
  const fMoving = t("the magnet is MOVING", 24.7);
  const fCutting = t("CUTTING the coil", 27.8);
  const fGenerator = t("principle of the electric generator", 30.6);

  // motor_generator (scene-08)
  const fMotor = t("ELECTRIC MOTOR converts", 1.4);
  const fMotorForce = t("force on a current-carrying conductor", 6.0);
  const fGen = t("GENERATOR converts", 9.7);
  const fRecapIn = t("current IN, motion OUT", 16.9);
  const fRecapOut = t("motion IN, current OUT", 20.9);
  const fMotion = t("MOTOR gives you MOTION", 24.8);

  // ---- Per-variant animation state ---------------------------------------
  // intro
  const introCapP = p(frame, fIntroCap, fIntroCap + 30);
  const chip1P = p(frame, fChip1, fChip1 + 30);
  const chip2P = p(frame, fChip2, fChip2 + 30);
  const chip3P = p(frame, fChip3, fChip3 + 30);
  const chip4P = p(frame, fChip4, fChip4 + 30);
  const chip5P = p(frame, fChip5, fChip5 + 30);
  const chip6P = p(frame, fChip6, fChip6 + 30);
  const goP = p(frame, fGo, fGo + 45);

  // oersted
  const oeWireP = p(frame, fWire, fWireEnd);
  const oeCurP = p(frame, fCurrent, fCurrent + 60);
  const oeMoveP = p(frame, fMove, fMoveEnd);
  const oeMagP = p(frame, fMagnet, fMagnet + 40);

  // bar_magnet
  const bmGlowP = p(frame, fFieldGlow, fFieldGlow + 40);
  const bmLineP = p(frame, fLines, fLinesEnd);
  const bmInsideP = p(frame, fInside, fInsideEnd);
  const bmLoopsP = p(frame, fLoops, fLoops + 30);
  const bmCrossP = p(frame, fCross, fCross + 30);
  const bmStrongP = p(frame, fStrong, fStrong + 30);
  const bmWeakP = p(frame, fWeak, fWeak + 30);

  // straight_conductor (scene-03)
  const scCheckP = p(frame, fCheck, fCheck + 40);
  const scUpP = p(frame, fUp, fUp + 40);
  const scHandP = p(frame, fThumbUp, fThumbUp + 40);
  const scCurlP = p(frame, fCurl, fCurl + 40);
  const scCurl2P = p(frame, fCurl2, fCurl2 + 40);
  const scCircP = p(frame, fFieldDir, fAnti);
  const scAntiP = p(frame, fAnti, fRecapUp);
  const scRecapUpP = p(frame, fRecapUp, fRecapUp + 40);
  const scFlipP = p(frame, fDown, fThumbDown); // current arrow flips + hand rotates to thumb-down
  const scClockP = p(frame, fClock, fRecapDown); // circle arrows flip to clockwise
  const scRecapDownP = p(frame, fRecapDown, fRecapDown + 40);
  const scRememberP = p(frame, fRemember, fRemember + 50);
  const scHandAngle = lerp(0, 180, scFlipP);

  // solenoid
  const soTurnsP = p(frame, fTurns, fAdd);
  const soAddP = p(frame, fAdd, fAddEnd);
  const soInsideP = p(frame, fSoInside, fSoInsideEnd);
  const soOutsideP = p(frame, fOutside, fOutsideEnd);
  const soPolesP = p(frame, fPoles, fPolesEnd);

  // electromagnet
  const emCoreP = p(frame, fCore, fCore + 30);
  const emOnP = p(frame, fOn, fOnEnd);
  const emOffP = p(frame, fOff, fOffEnd);
  const emUsesP = p(frame, fUses, fUses + 30);
  const emDoorP = p(frame, fDoor, fDoor + 30);

  // fleming (scene-06)
  const flSetupP = p(frame, fSetup, fSetup + 40);
  const flFieldP = p(frame, fField, fField + 60);
  const flCurInP = p(frame, fCurIn, fCurIn + 30);
  const flForceP = p(frame, fForce, fLeft);
  const flLeftP = p(frame, fLeft, fRev);
  const flOutP = p(frame, fCurOut, fMoveRight + 30);
  const flMoveRightP = p(frame, fMoveRight, fMoveRight + 40);
  const flPerpP = p(frame, fPerp, fPerp + 40);
  const flHandP = p(frame, fFlRule, fStretch);
  const flStretchP = p(frame, fStretch, fStretch + 30);
  const flFieldHiP = p(frame, fFlField, fFlFieldEnd);
  const flCurHiP = p(frame, fFlCur, fFlCurEnd);
  const flThumbHiP = p(frame, fFlThumb, fFlThumbEnd);
  const flFinalP = p(frame, fRight, fRight + 40);
  // rod slide: left during "It moves to the LEFT", right during "moves to the RIGHT"
  const flRodX = lerp(lerp(0, -50, flLeftP), 50, flMoveRightP);

  // induction
  const inMagP = p(frame, fIn, fInEnd);
  const inDefP = p(frame, fDeflect, fDeflectEnd);
  const inStillP = p(frame, fStill, fStillEnd);
  const inOutP = p(frame, fOut, fOutEnd);
  const inMovingP = p(frame, fMoving, fMoving + 40);
  const inCutP = p(frame, fCutting, fCutting + 40);
  const inGenP = p(frame, fGenerator, fGenerator + 40);

  // motor_generator
  const mgMotorP = p(frame, fMotor, fMotor + 40);
  const mgForceP = p(frame, fMotorForce, fMotorForce + 40);
  const mgGenP = p(frame, fGen, fGen + 40);
  const mgRecInP = p(frame, fRecapIn, fRecapIn + 30);
  const mgRecOutP = p(frame, fRecapOut, fRecapOut + 30);
  const mgMotionP = p(frame, fMotion, fMotion + 45);

  // electron_trick (scene-01 & scene-03)
  const etElectronP = p(frame, 30, 90);
  const etFieldP = p(frame, 90, 150);
  const etDeflectP = p(frame, 150, 210);
  
  const etOppositeP = p(frame, 250, 300); // For scene-03 trap

  // arrows_rule (scene-04)
  const arLinesP = p(frame, 30, 90);
  const arRotateP = p(frame, 150, 300);

  const needleAngle = inDefP * 35 - inOutP * 35;

  // Induction magnet position: moves INTO the coil during fIn, back OUT during fOut
  const magX = lerp(lerp(90, 265, inMagP), lerp(265, 90, inOutP), inOutP);

  // Solenoid loop positions (shared by solenoid + electromagnet variants)
  const coilXs = [115, 157, 198, 240, 282, 323, 365];

  return (
    <div style={{ width: 1920, height: 1080, display: "flex", flexDirection: "column", backgroundColor: C.dark }}>
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

        {/* Right Column: SVG canvas */}
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
            width="100%"
            height="100%"
            viewBox="0 0 480 340"
            preserveAspectRatio="xMidYMid meet"
            style={{
              backgroundColor: "#151813", // Updated to ChapterReady Dark
              border: "2px solid #334155",
              borderRadius: "16px",
              boxShadow: "0 12px 32px rgba(0, 0, 0, 0.25)",
            }}
          >
            {/* ============ VARIANT: intro roadmap (scene-00) ============ */}
            {variant === "intro" && (
              <>
                {introCapP > 0 && (
                  <text x={240} y={58} fontFamily={outfitFont} fontSize="22" fontWeight="800" fill={C.sky} textAnchor="middle" opacity={introCapP}>
                    IN THIS VIDEO
                  </text>
                )}
                {/* Roadmap chips: row 1 */}
                {chip1P > 0 && (
                  <g opacity={chip1P}>
                    <rect x={40} y={96} width="130" height="62" rx="10" fill="#1E293B" stroke={C.red} strokeWidth="1.5" />
                    <circle cx={52} cy={108} r="8" fill={C.red} />
                    <text x={52} y={112} fontFamily={outfitFont} fontSize="10" fontWeight="800" fill={C.dark} textAnchor="middle">1</text>
                    <g transform="translate(56, 140)"><MiniIcon type="compass" color={C.red} /></g>
                    <text x={74} y={120} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.white}>Compass</text>
                    <text x={74} y={133} fontFamily={outfitFont} fontSize="9" fill={C.slate}>needle moves</text>
                  </g>
                )}
                {chip2P > 0 && (
                  <g opacity={chip2P}>
                    <rect x={175} y={96} width="130" height="62" rx="10" fill="#1E293B" stroke={C.blue} strokeWidth="1.5" />
                    <circle cx={187} cy={108} r="8" fill={C.blue} />
                    <text x={187} y={112} fontFamily={outfitFont} fontSize="10" fontWeight="800" fill={C.dark} textAnchor="middle">2</text>
                    <g transform="translate(191, 140)"><MiniIcon type="magnet" color={C.blue} /></g>
                    <text x={209} y={120} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.white}>Field lines</text>
                    <text x={209} y={133} fontFamily={outfitFont} fontSize="9" fill={C.slate}>magnet & wire</text>
                  </g>
                )}
                {chip3P > 0 && (
                  <g opacity={chip3P}>
                    <rect x={310} y={96} width="130" height="62" rx="10" fill="#1E293B" stroke={C.amber} strokeWidth="1.5" />
                    <circle cx={322} cy={108} r="8" fill={C.amber} />
                    <text x={322} y={112} fontFamily={outfitFont} fontSize="10" fontWeight="800" fill={C.dark} textAnchor="middle">3</text>
                    <g transform="translate(326, 140)"><MiniIcon type="coil" color={C.amber} /></g>
                    <text x={344} y={120} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.white}>Solenoid</text>
                    <text x={344} y={133} fontFamily={outfitFont} fontSize="9" fill={C.slate}>& electromagnet</text>
                  </g>
                )}
                {/* Roadmap chips: row 2 */}
                {chip4P > 0 && (
                  <g opacity={chip4P}>
                    <rect x={40} y={176} width="130" height="62" rx="10" fill="#1E293B" stroke={C.green} strokeWidth="1.5" />
                    <circle cx={52} cy={188} r="8" fill={C.green} />
                    <text x={52} y={192} fontFamily={outfitFont} fontSize="10" fontWeight="800" fill={C.dark} textAnchor="middle">4</text>
                    <g transform="translate(56, 220)"><MiniIcon type="hand" color={C.green} /></g>
                    <text x={74} y={200} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.white}>Left hand</text>
                    <text x={74} y={213} fontFamily={outfitFont} fontSize="9" fill={C.slate}>rule (force)</text>
                  </g>
                )}
                {chip5P > 0 && (
                  <g opacity={chip5P}>
                    <rect x={175} y={176} width="130" height="62" rx="10" fill="#1E293B" stroke={C.orange} strokeWidth="1.5" />
                    <circle cx={187} cy={188} r="8" fill={C.orange} />
                    <text x={187} y={192} fontFamily={outfitFont} fontSize="10" fontWeight="800" fill={C.dark} textAnchor="middle">5</text>
                    <g transform="translate(191, 220)"><MiniIcon type="induction" color={C.orange} /></g>
                    <text x={209} y={200} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.white}>Induction</text>
                    <text x={209} y={213} fontFamily={outfitFont} fontSize="9" fill={C.slate}>magnet + coil</text>
                  </g>
                )}
                {chip6P > 0 && (
                  <g opacity={chip6P}>
                    <rect x={310} y={176} width="130" height="62" rx="10" fill="#1E293B" stroke={C.sky} strokeWidth="1.5" />
                    <circle cx={322} cy={188} r="8" fill={C.sky} />
                    <text x={322} y={192} fontFamily={outfitFont} fontSize="10" fontWeight="800" fill={C.dark} textAnchor="middle">6</text>
                    <g transform="translate(326, 220)"><MiniIcon type="motor" color={C.sky} /></g>
                    <text x={344} y={200} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.white}>Motor vs</text>
                    <text x={344} y={213} fontFamily={outfitFont} fontSize="9" fill={C.slate}>Generator</text>
                  </g>
                )}
                {goP > 0 && (
                  <text x={240} y={312} fontFamily={outfitFont} fontSize="20" fontWeight="800" fill={C.green} textAnchor="middle" opacity={goP}>
                    Let's get started!
                  </text>
                )}
              </>
            )}

            {/* ============ VARIANT: oersted (scene-01) ============ */}
            {variant === "oersted" && (
              <>
                {/* Wire */}
                {oeWireP > 0 && (
                  <line x1={150} y1={60} x2={150} y2={lerp(60, 280, oeWireP)} stroke={C.amber} strokeWidth="4" strokeLinecap="round" />
                )}
                {/* Current dots flowing up */}
                {oeCurP > 0 && (
                  <g opacity={oeCurP}>
                    {[0, 1, 2, 3].map((i) => {
                      const cy = 280 - ((frame * 4 + i * 22) % 220);
                      return <circle key={i} cx={150} cy={cy} r="3.5" fill={C.amber} />;
                    })}
                    <text x={108} y={295} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber}>
                      current
                    </text>
                  </g>
                )}
                {/* Compass */}
                <g opacity={oeWireP > 0 ? 1 : 0}>
                  <circle cx={310} cy={170} r="30" fill="#1E293B" stroke={C.slate} strokeWidth="2" />
                  <text x={305} y={170 - 34} fontFamily={outfitFont} fontSize="11" fill={C.slate}>N</text>
                  <g transform={`rotate(${lerp(-90, 0, oeMoveP)} 310 170)`}>
                    <line x1={310} y1={170} x2={310} y2={148} stroke={C.red} strokeWidth="4" strokeLinecap="round" />
                    <line x1={310} y1={170} x2={310} y2={192} stroke={C.slate} strokeWidth="4" strokeLinecap="round" />
                  </g>
                  <circle cx={310} cy={170} r="3" fill={C.white} />
                </g>
                {/* Magnetism rings around the wire */}
                {oeMagP > 0 && (
                  <g opacity={oeMagP}>
                    <circle cx={150} cy={170} r={40} fill="none" stroke={C.sky} strokeWidth="1.5" strokeDasharray="4 4" />
                    <circle cx={150} cy={170} r={70} fill="none" stroke={C.sky} strokeWidth="1.5" strokeDasharray="4 4" opacity="0.6" />
                    <text x={40} y={40} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill={C.sky}>
                      Current creates MAGNETISM!
                    </text>
                  </g>
                )}
              </>
            )}

            {/* ============ VARIANT: bar_magnet (scene-02) ============ */}
            {variant === "bar_magnet" && (
              <>
                {/* Bar magnet */}
                <rect x={160} y={145} width="80" height="50" rx="6" fill={C.red} opacity="0.9" />
                <rect x={240} y={145} width="80" height="50" rx="6" fill={C.blue} opacity="0.9" />
                <text x={186} y={178} fontFamily={outfitFont} fontSize="20" fontWeight="800" fill={C.white} textAnchor="middle">N</text>
                <text x={294} y={178} fontFamily={outfitFont} fontSize="20" fontWeight="800" fill={C.white} textAnchor="middle">S</text>

                {/* Field glow while the field is introduced */}
                {bmGlowP > 0 && (
                  <ellipse cx={240} cy={170} rx={110} ry={72} fill="none" stroke={C.sky} strokeWidth="2" strokeDasharray="6 6" opacity={bmGlowP * 0.5} />
                )}
                {/* Field lines drawing N -> S (pathLength trick) */}
                {bmLineP > 0 &&
                  [
                    "M 175 138 Q 240 60 305 138",
                    "M 168 130 Q 240 30 312 130",
                    "M 175 202 Q 240 280 305 202",
                    "M 168 210 Q 240 310 312 210",
                    "M 160 118 Q 240 5 320 118",
                    "M 160 222 Q 240 335 320 222",
                  ].map((d, i) => (
                    <path
                      key={i}
                      d={d}
                      fill="none"
                      stroke={C.sky}
                      strokeWidth="2.5"
                      pathLength={1}
                      strokeDasharray="1"
                      strokeDashoffset={1 - bmLineP}
                    />
                  ))}

                {/* Inside arrows S -> N */}
                {bmInsideP > 0 && (
                  <g opacity={bmInsideP}>
                    <line x1={280} y1={170} x2={195} y2={170} stroke={C.sky} strokeWidth="2" />
                    <polygon points={`195,170 208,165 208,175`} fill={C.sky} />
                    <text x={200} y={132} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.sky}>
                      inside: S → N
                    </text>
                  </g>
                )}

                {/* Callouts */}
                {bmLoopsP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill={C.sky} opacity={bmLoopsP}>
                    Field lines form CLOSED LOOPS!
                  </text>
                )}
                {bmCrossP > 0 && (
                  <text x={40} y={320} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill={C.red} opacity={bmCrossP}>
                    Two field lines NEVER cross!
                  </text>
                )}
                {bmStrongP > 0 && (
                  <text x={40} y={66} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.green} opacity={bmStrongP}>
                    Close lines = STRONG field
                  </text>
                )}
                {bmWeakP > 0 && (
                  <text x={280} y={66} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber} opacity={bmWeakP}>
                    Spread lines = WEAK field
                  </text>
                )}
              </>
            )}

            {/* ============ VARIANT: straight_conductor (scene-03) ============ */}
            {variant === "straight_conductor" && (
              <>
                {/* Wire */}
                <line x1={240} y1={40} x2={240} y2={300} stroke={C.amber} strokeWidth="4" />
                {/* Step 1: check the current first — arrow appears, points UP */}
                {scCheckP > 0 && (
                  <g opacity={scCheckP}>
                    {scFlipP < 1 ? (
                      <polygon points={`240,64 228,84 252,84`} fill={C.amber} />
                    ) : (
                      <polygon points={`240,276 228,256 252,256`} fill={C.amber} />
                    )}
                    <text x={262} y={scFlipP < 1 ? 60 : 300} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.amber}>
                      current
                    </text>
                  </g>
                )}
                {/* Pulse on the arrow while 'current is flowing UP' */}
                {scUpP > 0 && (
                  <circle cx={240} cy={76} r={12 + Math.sin(frame * 0.3) * 4} fill="none" stroke={C.amber} strokeWidth="2" opacity={scUpP * 0.7} />
                )}
                {/* Field circles draw while the fingers curl */}
                {scCircP > 0 &&
                  [45, 75, 105].map((r, i) => (
                    <circle
                      key={i}
                      cx={240}
                      cy={170}
                      r={r}
                      fill="none"
                      stroke={C.sky}
                      strokeWidth="2.5"
                      pathLength={1}
                      strokeDasharray="1"
                      strokeDashoffset={1 - scCircP}
                    />
                  ))}
                {/* Direction arrows: anti-clockwise -> flip to clockwise */}
                {scCircP > 0.99 &&
                  [45, 75, 105].map((r, ci) =>
                    [45, 135, 225, 315].map((deg, ai) => {
                      const rad = (deg * Math.PI) / 180;
                      const ax = 240 + r * Math.cos(rad);
                      const ay = 170 + r * Math.sin(rad);
                      const tAng = scClockP > 0 ? deg + 90 : deg - 90;
                      return (
                        <polygon
                          key={`${ci}-${ai}`}
                          points={`${ax},${ay} ${ax - 8},${ay + 5} ${ax - 8},${ay - 5}`}
                          fill={C.sky}
                          opacity={scAntiP * 0.9}
                          transform={`rotate(${tAng} ${ax} ${ay})`}
                        />
                      );
                    })
                  )}
                {/* Real RIGHT-hand thumbs-up (skin color); rotates 180° when current goes DOWN */}
                {scHandP > 0 && (
                  <g opacity={scHandP}>
                    <g transform={`rotate(${scHandAngle} 405 265)`}>
                      <g transform="translate(350 210) scale(0.215)">
                        <g transform="translate(512 0) scale(-1 1)">
                          <path d={RIGHT_HAND_D} fill="#E8B48C" stroke="#B07040" strokeWidth="12" />
                        </g>
                      </g>
                    </g>
                    <text x={356} y={198} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.amber}>
                      RIGHT hand
                    </text>
                    <text x={356} y={332} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.amber}>
                      thumb = CURRENT
                    </text>
                    <text x={356} y={348} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.sky}>
                      fingers = FIELD
                    </text>
                  </g>
                )}
                {/* Pulse ring while 'curl your fingers' is spoken */}
                {(scCurlP > 0 || scCurl2P > 0) && (
                  <circle
                    cx={405}
                    cy={265}
                    r={62 + Math.sin(frame * 0.25) * 10}
                    fill="none"
                    stroke={C.sky}
                    strokeWidth="2.5"
                    opacity={0.5 + Math.sin(frame * 0.25) * 0.3}
                  />
                )}
                {/* Recap chips */}
                {scRecapUpP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.sky} opacity={scRecapUpP}>
                    current UP → field ANTI-clockwise
                  </text>
                )}
                {scRecapDownP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.amber} opacity={scRecapDownP}>
                    current DOWN → field CLOCKWISE
                  </text>
                )}
                {scRememberP > 0 && (
                  <text x={40} y={320} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.green} opacity={scRememberP}>
                    THUMB = CURRENT, FINGERS = FIELD
                  </text>
                )}
              </>
            )}

            {/* ============ VARIANT: solenoid (scene-04) ============ */}
            {variant === "solenoid" && (
              <>
                {/* Coil turns appear one by one */}
                {coilXs.map((x, i) =>
                  soTurnsP > i / coilXs.length ? (
                    <ellipse key={i} cx={x} cy={170} rx="24" ry="58" fill="none" stroke={C.amber} strokeWidth="3" opacity={lerp(0, 1, Math.min(1, (soTurnsP - i / coilXs.length) * 7))} />
                  ) : null
                )}
                {/* Turns combine -> flash + caption while 'COMBINE into one' is spoken */}
                {soAddP > 0 && (
                  <ellipse cx={240} cy={170} rx={155} ry={72} fill="none" stroke={C.amber} strokeWidth="3" opacity={soAddP * 0.8} />
                )}
                {soAddP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.amber} opacity={soAddP * (1 - soInsideP)}>
                    Fields COMBINE into ONE stronger field!
                  </text>
                )}
                {/* Current arrow through the coil */}
                {soTurnsP > 0.2 && (
                  <>
                    <line x1={100} y1={170} x2={385} y2={170} stroke={C.amber} strokeWidth="3" />
                    <polygon points={`385,170 368,162 368,178`} fill={C.amber} />
                    <text x={105} y={190} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.amber}>current</text>
                  </>
                )}
                {/* Uniform inside field */}
                {soInsideP > 0 && (
                  <g opacity={soInsideP}>
                    {[140, 170, 200].map((y) => (
                      <g key={y}>
                        <line x1={125} y1={y} x2={355} y2={y} stroke={C.sky} strokeWidth="2.5" />
                        <polygon points={`355,${y} 340,${y - 5} 340,${y + 5}`} fill={C.sky} />
                      </g>
                    ))}
                    <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.sky}>
                      INSIDE: straight, parallel, UNIFORM & STRONG
                    </text>
                  </g>
                )}
                {/* Outside pattern like a bar magnet */}
                {soOutsideP > 0 && (
                  <g opacity={soOutsideP}>
                    <path d="M 375 120 Q 430 170 375 220" fill="none" stroke={C.sky} strokeWidth="2" />
                    <path d="M 105 120 Q 50 170 105 220" fill="none" stroke={C.sky} strokeWidth="2" />
                    <text x={40} y={300} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.green}>
                      Outside = just like a BAR MAGNET!
                    </text>
                  </g>
                )}
                {/* N/S pole labels */}
                {soPolesP > 0 && (
                  <g opacity={soPolesP}>
                    <text x={365} y={108} fontFamily={outfitFont} fontSize="18" fontWeight="800" fill={C.red}>N</text>
                    <text x={102} y={108} fontFamily={outfitFont} fontSize="18" fontWeight="800" fill={C.blue}>S</text>
                    <text x={140} y={132} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.slate}>
                      right end = NORTH, left end = SOUTH
                    </text>
                  </g>
                )}
              </>
            )}

            {/* ============ VARIANT: electromagnet (scene-05) ============ */}
            {variant === "electromagnet" && (
              <>
                {/* Iron core */}
                {emCoreP > 0 && (
                  <g opacity={emCoreP}>
                    <rect x={140} y={155} width="200" height="30" rx="8" fill="#64748B" stroke={emOnP > 0 ? C.amber : "#475569"} strokeWidth="2.5" />
                    <text x={155} y={145} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.slate}>soft iron core</text>
                  </g>
                )}
                {/* Coil around the core */}
                {[150, 186, 222, 258, 294, 330].map((x, i) => (
                  <ellipse key={i} cx={x} cy={170} rx="26" ry="48" fill="none" stroke={C.amber} strokeWidth="3" opacity={emCoreP * 0.9} />
                ))}
                {/* Pins: jump up when ON, drop when OFF */}
                {[165, 210, 255, 300].map((x, i) => {
                  const pinY = lerp(250, 188, emOnP) + lerp(0, 62, emOffP);
                  return (
                    <g key={i}>
                      <rect x={x} y={pinY} width="9" height="20" rx="2" fill="#94A3B8" />
                    </g>
                  );
                })}
                {/* Captions (cross-fade: OFF replaces ON, icons replace OFF) */}
                {emOnP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.green} opacity={emOnP * (1 - emOffP)}>
                    Current ON → strong magnet! Pins stick!
                  </text>
                )}
                {emOffP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.red} opacity={emOffP * (1 - emUsesP)}>
                    Current OFF → magnetism gone! Pins drop!
                  </text>
                )}
                {/* Use-case icons: crane + doorbell (paths from public/assets) */}
                {emUsesP > 0 && (
                  <g opacity={emUsesP}>
                    <g transform="translate(46 292) scale(0.075)">
                      <path d={CRANE_D} fill="#CBD5E1" />
                    </g>
                    <text x={92} y={318} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber}>
                      Cranes lift scrap iron
                    </text>
                  </g>
                )}
                {emDoorP > 0 && (
                  <g opacity={emDoorP}>
                    <g transform="translate(196 286) scale(0.042)">
                      {DOORBELL_PATHS.map(([d, fill], i) => (
                        <path key={i} d={d} fill={fill} />
                      ))}
                    </g>
                    <text x={246} y={318} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber}>
                      Doorbells ring!
                    </text>
                  </g>
                )}
              </>
            )}

            {/* ============ VARIANT: fleming (scene-06) ============ */}
            {variant === "fleming" && (
              <>
                {/* Horse-shoe magnet: N below, S above -> field UP (textbook Fig 12.12) */}
                {flSetupP > 0 && (
                  <g opacity={flSetupP}>
                    <rect x={90} y={252} width="300" height="26" rx="8" fill={C.red} />
                    <text x={100} y={270} fontFamily={outfitFont} fontSize="14" fontWeight="800" fill={C.white}>N</text>
                    <text x={360} y={270} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.white}>pole below</text>
                    <rect x={90} y={62} width="300" height="26" rx="8" fill={C.blue} />
                    <text x={100} y={80} fontFamily={outfitFont} fontSize="14" fontWeight="800" fill={C.white}>S</text>
                    <text x={360} y={80} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.white}>pole above</text>
                  </g>
                )}
                {/* Field arrows UP (from N below to S above) */}
                {flFieldP > 0 &&
                  [140, 240, 340].map((x, i) => (
                    <g key={i}>
                      <line x1={x} y1={234} x2={x} y2={112} stroke={C.blue} strokeWidth="3" pathLength={1} strokeDasharray="1" strokeDashoffset={1 - flFieldP} />
                      <polygon points={`${x},102 ${x - 6},118 ${x + 6},118`} fill={C.blue} opacity={flFieldP} />
                    </g>
                  ))}
                {/* Conductor (cross-section), current ⊗ INTO / ⊙ OUT of page, slides LEFT then RIGHT */}
                <g transform={`translate(${flRodX}, 0)`}>
                  <circle cx={240} cy={170} r="17" fill="#1E293B" stroke={C.orange} strokeWidth="4" />
                  {flCurInP > 0 && (
                    <g opacity={flCurInP}>
                      {flOutP > 0 ? (
                        <circle cx={240} cy={170} r="5" fill={C.amber} />
                      ) : (
                        <>
                          <line x1={233} y1={163} x2={247} y2={177} stroke={C.amber} strokeWidth="3.5" />
                          <line x1={247} y1={163} x2={233} y2={177} stroke={C.amber} strokeWidth="3.5" />
                        </>
                      )}
                      <circle cx={240} cy={170} r={20 + (frame % 30) * 0.4} fill="none" stroke={C.amber} strokeWidth="1.5" opacity={0.6 - (frame % 30) * 0.02} />
                      <text x={262} y={164} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.amber}>
                        {flOutP > 0 ? "current ⊙ OUT" : "current ⊗ IN"}
                      </text>
                    </g>
                  )}
                  {/* Force arrow LEFT (rod motion) */}
                  {flForceP > 0 && (
                    <g opacity={flForceP}>
                      <line x1={218} y1={170} x2={132} y2={170} stroke={C.green} strokeWidth="4" />
                      <polygon points={`132,170 150,162 150,178`} fill={C.green} />
                      <text x={122} y={156} fontFamily={outfitFont} fontSize="13" fontWeight="800" fill={C.green}>FORCE</text>
                    </g>
                  )}
                </g>
                {/* Right-angle marker at the rod (current ⊥ field) */}
                {flPerpP > 0 && (
                  <rect x={222 + flRodX} y={150} width="14" height="14" fill="none" stroke="#F8FAFC" strokeWidth="2" opacity={flPerpP} />
                )}
                {/* Captions (cross-faded) */}
                {flCurInP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.amber} opacity={flCurInP * (1 - flForceP)}>
                    Current ⊗ INTO the page
                  </text>
                )}
                {flForceP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.green} opacity={flForceP * (1 - flOutP)}>
                    Force! The rod moves LEFT
                  </text>
                )}
                {flOutP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.amber} opacity={flOutP * (1 - flPerpP)}>
                    Current ⊙ OUT → rod moves RIGHT
                  </text>
                )}
                {flPerpP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.sky} opacity={flPerpP * (1 - flHandP)}>
                    Current ⊥ Field → MAXIMUM force!
                  </text>
                )}
                {/* Left hand: INDEX up (field), MIDDLE ⊗ (current into page), THUMB left (force) */}
                {flHandP > 0 && (
                  <g opacity={flHandP}>
                    {/* palm */}
                    <rect x={330} y={230} width="56" height="58" rx="10" fill="#334155" />
                    {/* INDEX finger = FIELD (UP) */}
                    <rect x={344} y={148} width="20" height="82" rx="8" fill={C.blue} stroke={flFieldHiP > 0 ? "#F8FAFC" : "none"} strokeWidth={flFieldHiP > 0 ? 3 : 0} />
                    {/* MIDDLE finger = CURRENT (INTO the page, circle-cross) */}
                    <circle cx={358} cy={258} r="11" fill="none" stroke={C.amber} strokeWidth="3.5" />
                    <line x1={351} y1={251} x2={365} y2={265} stroke={C.amber} strokeWidth="3.5" />
                    <line x1={365} y1={251} x2={351} y2={265} stroke={C.amber} strokeWidth="3.5" />
                    {flCurHiP > 0 && <circle cx={358} cy={258} r="15" fill="none" stroke="#F8FAFC" strokeWidth="2.5" opacity={flCurHiP} />}
                    {/* THUMB = FORCE (LEFT) */}
                    <rect x={272} y={250} width="58" height="20" rx="8" fill={C.green} stroke={flThumbHiP > 0 ? "#F8FAFC" : "none"} strokeWidth={flThumbHiP > 0 ? 3 : 0} />
                    {/* right-angle markers */}
                    <rect x={340} y={226} width="10" height="10" fill="none" stroke="#F8FAFC" strokeWidth="1.5" opacity="0.7" />
                    <rect x={326} y={246} width="10" height="10" fill="none" stroke="#F8FAFC" strokeWidth="1.5" opacity="0.7" />
                    {/* labels */}
                    <text x={344} y={136} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.blue}>INDEX = FIELD ↑</text>
                    <text x={330} y={296} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.amber}>MIDDLE = CURRENT ⊗</text>
                    <text x={140} y={262} fontFamily={outfitFont} fontSize="10" fontWeight="bold" fill={C.green}>THUMB = FORCE ←</text>
                    <text x={330} y={314} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.white}>LEFT HAND</text>
                  </g>
                )}
                {/* Pulse ring while 'all mutually perpendicular' is spoken */}
                {flStretchP > 0 && (
                  <circle cx={370} cy={250} r={90 + Math.sin(frame * 0.25) * 10} fill="none" stroke={C.sky} strokeWidth="2" opacity={flStretchP * 0.6} />
                )}
                {flFinalP > 0 && (
                  <text x={40} y={40} fontFamily={outfitFont} fontSize="15" fontWeight="bold" fill={C.sky} opacity={flFinalP}>
                    Field, Current, Force — at RIGHT ANGLES!
                  </text>
                )}
              </>
            )}

            {/* ============ VARIANT: induction (scene-07) ============ */}
            {variant === "induction" && (
              <>
                {/* Coil */}
                {[122, 146, 170, 194, 218].map((y, i) => (
                  <ellipse key={i} cx={300} cy={y} rx="22" ry="26" fill="none" stroke={C.amber} strokeWidth="3" />
                ))}
                {/* Magnet moving in/out */}
                <g transform={`translate(${magX}, 155)`}>
                  <rect x="0" y="0" width="35" height="30" rx="4" fill={C.red} />
                  <rect x="35" y="0" width="35" height="30" rx="4" fill={C.blue} />
                  <text x="17" y="21" fontFamily={outfitFont} fontSize="14" fontWeight="800" fill={C.white} textAnchor="middle">N</text>
                  <text x="52" y="21" fontFamily={outfitFont} fontSize="14" fontWeight="800" fill={C.white} textAnchor="middle">S</text>
                </g>
                {/* Wires coil -> galvanometer */}
                <path d="M 300 218 L 300 285 L 150 285 L 150 292" fill="none" stroke={C.slate} strokeWidth="3" />
                {/* Galvanometer */}
                <g transform="translate(120, 265)">
                  <circle cx="0" cy="0" r="27" fill="#1E293B" stroke={C.slate} strokeWidth="2" />
                  <text x="-10" y="6" fontFamily={outfitFont} fontSize="15" fontWeight="800" fill={C.white}>G</text>
                  <line x1="0" y1="0" x2="20" y2="14" stroke={C.slate} strokeWidth="1.5" opacity="0.6" />
                  <line x1="0" y1="0" x2="-20" y2="14" stroke={C.slate} strokeWidth="1.5" opacity="0.6" />
                  <line x1="0" y1="0" x2={22 * Math.cos((needleAngle * Math.PI) / 180)} y2={-22 * Math.sin((needleAngle * Math.PI) / 180)} stroke={C.red} strokeWidth="3" strokeLinecap="round" />
                  <circle cx="0" cy="0" r="3" fill={C.white} />
                </g>
                {/* Field lines being cut */}
                {inCutP > 0 && (
                  <g opacity={inCutP}>
                    {[150, 185].map((y, i) => (
                      <line key={i} x1={130} y1={y} x2={280} y2={y} stroke={C.sky} strokeWidth="2" strokeDasharray="6 5" />
                    ))}
                    <text x={40} y={40} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.sky}>
                      Field lines CUTTING the coil!
                    </text>
                  </g>
                )}
                {/* Captions */}
                {inDefP > 0 && (
                  <text x={40} y={100} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.green} opacity={inDefP * (1 - inStillP)}>
                    Needle DEFLECTS — current induced!
                  </text>
                )}
                {inStillP > 0 && (
                  <text x={40} y={100} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.slate} opacity={inStillP * (1 - inOutP)}>
                    Magnet still → needle ZERO → no current
                  </text>
                )}
                {inOutP > 0 && (
                  <text x={40} y={100} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber} opacity={inOutP}>
                    Pull OUT → needle swings the OTHER way!
                  </text>
                )}
                {inMovingP > 0 && (
                  <text x={40} y={130} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.red} opacity={inMovingP}>
                    Induced ONLY while the magnet MOVES!
                  </text>
                )}
                {inGenP > 0 && (
                  <text x={40} y={320} fontFamily={outfitFont} fontSize="14" fontWeight="bold" fill={C.green} opacity={inGenP}>
                    This is how a GENERATOR works!
                  </text>
                )}
              </>
            )}

            {/* ============ VARIANT: motor_generator (scene-08) ============ */}
            {variant === "motor_generator" && (
              <>
                {/* Divider */}
                <line x1={270} y1={70} x2={270} y2={280} stroke="#334155" strokeWidth="2" strokeDasharray="4 4" />
                {/* Headers */}
                <text x={100} y={55} fontFamily={outfitFont} fontSize="18" fontWeight="800" fill={C.sky} textAnchor="middle">MOTOR</text>
                <text x={380} y={55} fontFamily={outfitFont} fontSize="18" fontWeight="800" fill={C.green} textAnchor="middle">GENERATOR</text>

                {/* Motor side */}
                <rect x={78} y={120} width="16" height="100" rx="4" fill={C.red} />
                <text x={86} y={178} fontFamily={outfitFont} fontSize="14" fontWeight="800" fill={C.white} textAnchor="middle">N</text>
                <rect x={196} y={120} width="16" height="100" rx="4" fill={C.blue} />
                <text x={204} y={178} fontFamily={outfitFont} fontSize="14" fontWeight="800" fill={C.white} textAnchor="middle">S</text>
                <rect x={118} y={148} width="56" height="44" rx="5" fill="none" stroke={C.orange} strokeWidth="4" />
                <path d="M 146 148 A 22 22 0 1 1 145 147" fill="none" stroke={C.green} strokeWidth="3" />
                <polygon points={`168,132 178,150 158,150`} fill={C.green} />
                <line x1={118} y1={170} x2={94} y2={170} stroke={C.amber} strokeWidth="3" />
                <polygon points={`94,170 108,163 108,177`} fill={C.amber} />

                {/* Generator side */}
                <rect x={318} y={148} width="56" height="44" rx="5" fill="none" stroke={C.orange} strokeWidth="4" />
                <path d="M 346 148 A 22 22 0 1 1 345 147" fill="none" stroke={C.sky} strokeWidth="3" />
                <line x1={374} y1={170} x2={398} y2={170} stroke={C.amber} strokeWidth="3" />
                <polygon points={`398,170 384,163 384,177`} fill={C.amber} />

                {/* Motor highlight */}
                {mgMotorP > 0 && (
                  <g opacity={mgMotorP}>
                    <rect x={70} y={70} width={158} height={180} rx="10" fill="none" stroke={C.sky} strokeWidth="2.5" />
                    <text x={84} y={268} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.sky}>
                      electrical → mechanical
                    </text>
                  </g>
                )}
                {mgForceP > 0 && (
                  <text x={84} y={286} fontFamily={outfitFont} fontSize="11" fontWeight="bold" fill={C.orange} opacity={mgForceP}>
                    force on conductor in field
                  </text>
                )}
                {/* Generator highlight */}
                {mgGenP > 0 && (
                  <g opacity={mgGenP}>
                    <rect x={312} y={70} width={158} height={180} rx="10" fill="none" stroke={C.green} strokeWidth="2.5" />
                    <text x={326} y={268} fontFamily={outfitFont} fontSize="12" fontWeight="bold" fill={C.green}>
                      mechanical → electrical
                    </text>
                  </g>
                )}
                {/* Recap chips */}
                {mgRecInP > 0 && (
                  <text x={40} y={316} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber} opacity={mgRecInP}>
                    Motor: current IN → motion OUT
                  </text>
                )}
                {mgRecOutP > 0 && (
                  <text x={260} y={316} fontFamily={outfitFont} fontSize="13" fontWeight="bold" fill={C.amber} opacity={mgRecOutP}>
                    Generator: motion IN → current OUT
                  </text>
                )}
                {mgMotionP > 0 && (
                  <text x={105} y={240} fontFamily={outfitFont} fontSize="17" fontWeight="800" fill={C.green} opacity={mgMotionP}>
                    MOTOR = MOTION!
                  </text>
                )}
              </>
            )}

            {/* ============ NEW VARIANT: electron_trick ============ */}
            {variant === "electron_trick" && (
              <>
                {/* Electron moving right */}
                {etElectronP > 0 && (
                  <g transform={`translate(${lerp(100, 350, etElectronP)}, 170)`}>
                    <circle cx={0} cy={0} r={15} fill="#f3883b" />
                    <text x={0} y={5} fontFamily={outfitFont} fontSize="14" fontWeight="900" fill="#151813" textAnchor="middle">e⁻</text>
                  </g>
                )}
                {etElectronP > 0.5 && (
                  <g opacity={1}>
                    <line x1={80} y1={200} x2={350} y2={200} stroke="#f3883b" strokeWidth="2" strokeDasharray="5,5" />
                    <text x={215} y={220} fontFamily={outfitFont} fontSize="14" fontWeight="800" fill="#f3883b" textAnchor="middle">Electron Flow ➔</text>
                  </g>
                )}
                {/* Magnetic field poles (Scene 1 hook) */}
                {etFieldP > 0 && subtitle === "THE CBSE TRICK QUESTION!" && (
                  <g opacity={etFieldP}>
                    <rect x={180} y={40} width="120" height="40" fill={C.red} opacity="0.8" />
                    <text x={240} y={65} fontFamily={outfitFont} fontSize="20" fontWeight="900" fill={C.white} textAnchor="middle">N</text>
                    <rect x={180} y={260} width="120" height="40" fill={C.blue} opacity="0.8" />
                    <text x={240} y={285} fontFamily={outfitFont} fontSize="20" fontWeight="900" fill={C.white} textAnchor="middle">S</text>
                  </g>
                )}
                {/* Opposite Current flow (Scene 3 trap) */}
                {etOppositeP > 0 && (
                  <g opacity={etOppositeP}>
                    <rect x={40} y={40} width="400" height="260" fill="none" stroke={C.red} strokeWidth="6" opacity="0.5" />
                    <line x1={400} y1={250} x2={100} y2={250} stroke="#f3883b" strokeWidth="8" />
                    <polygon points={`100,250 120,240 120,260`} fill="#f3883b" />
                    <text x={250} y={280} fontFamily={outfitFont} fontSize="20" fontWeight="900" fill="#f3883b" textAnchor="middle">Current (I) ⬅</text>
                  </g>
                )}
              </>
            )}

            {/* ============ NEW VARIANT: arrows_rule ============ */}
            {variant === "arrows_rule" && (() => {
              // Timing synced to voiceover:
              // "rotate them" (4.7s) -> frame 140 to 220
              const rotP = p(frame, 140, 220); 
              const A = lerp(0, Math.PI, rotP);
              
              // 3D vectors
              const mid3D = { x: Math.cos(A), y: 0, z: -Math.sin(A) }; // Middle (Current)
              const thm3D = { x: Math.sin(A), y: 0, z: -Math.cos(A) }; // Thumb (Force)
              
              // Projection to 2D (isometric-ish):
              // Index finger is fixed DOWN (Y axis)
              const proj = (v: {x: number, y: number, z: number}, length: number) => ({
                x: v.x * length + v.z * (-length * 0.6),
                y: v.y * length + v.z * (length * 0.6)
              });
              
              // Base pulses
              const indexPulse = p(frame, 200, 220) - p(frame, 250, 270);
              const middlePulse = p(frame, 273, 293) - p(frame, 330, 350);
              const thumbPulse = p(frame, 372, 392) - p(frame, 460, 480);
              
              const indLen = 120 * (1 + indexPulse * 0.15);
              const midLen = 120 * (1 + middlePulse * 0.15);
              const thmLen = 120 * (1 + thumbPulse * 0.15);

              const mid2D = proj(mid3D, midLen);
              const thm2D = proj(thm3D, thmLen);
              const ind2D = { x: 0, y: indLen }; // Fixed DOWN
              
              // Colors matching cbse-bycodex-web brand (#f3883b, #bd4f10)
              const indColor = indexPulse > 0.1 ? "#FFFFFF" : "#bd4f10";
              const midColor = middlePulse > 0.1 ? "#FFFFFF" : "#f3883b";
              const thmColor = thumbPulse > 0.1 ? "#FFFFFF" : "#FCD34D";

              const Arrow = ({ end, label, color, delayP }: { end: {x: number, y: number}, label: string, color: string, delayP: number }) => {
                const angle = Math.atan2(end.y, end.x) * (180 / Math.PI);
                // Auto-place text based on quadrant to avoid overlap
                const textX = end.x > 10 ? 15 : end.x < -10 ? -15 : 0;
                const textY = end.y > 10 ? 25 : end.y < -10 ? -15 : 0;
                const anchor = end.x > 10 ? "start" : end.x < -10 ? "end" : "middle";
                
                return (
                  <g opacity={delayP}>
                    <line x1={0} y1={0} x2={end.x} y2={end.y} stroke={color} strokeWidth="8" strokeLinecap="round" />
                    <g transform={`translate(${end.x}, ${end.y}) rotate(${angle})`}>
                      <polygon points={`12,0 -10,-10 -10,10`} fill={color} />
                    </g>
                    <text x={end.x + textX} y={end.y + textY} fontFamily={outfitFont} fontSize="22" fontWeight="900" fill={color} textAnchor={anchor}>
                      {label}
                    </text>
                  </g>
                );
              };

              // Final answer pop
              const answerP = p(frame, 480, 500);

              return (
                <g opacity={arLinesP} transform={`translate(240, 110)`}>
                  {/* Draw order for 3D illusion: Back to Front */}
                  {thm3D.z < 0 && <Arrow end={thm2D} label="Thumb (Force)" color={thmColor} delayP={1} />}
                  {mid3D.z < 0 && <Arrow end={mid2D} label="Middle (Current)" color={midColor} delayP={1} />}
                  
                  <Arrow end={ind2D} label="Index (Field)" color={indColor} delayP={1} />
                  
                  {mid3D.z >= 0 && <Arrow end={mid2D} label="Middle (Current)" color={midColor} delayP={1} />}
                  {thm3D.z >= 0 && <Arrow end={thm2D} label="Thumb (Force)" color={thmColor} delayP={1} />}
                  
                  {/* Origin connector */}
                  <circle cx={0} cy={0} r={8} fill={C.white} />
                  
                  {/* Explicit Exam Answer Stamp with Reasoning */}
                  {answerP > 0 && (
                    <g transform={`translate(0, 165) scale(${lerp(0.5, 1, answerP)})`} opacity={answerP}>
                      {/* Card Background */}
                      <rect x={-210} y={-40} width={420} height={100} rx={12} fill="#111827" stroke="#FCD34D" strokeWidth={3} />
                      
                      {/* Answer Title */}
                      <text x={0} y={-10} fontFamily={outfitFont} fontSize="20" fontWeight="900" fill="#FCD34D" textAnchor="middle">
                        ✍️ EXAM ANSWER: Out of the page
                      </text>
                      
                      {/* Reasoning Line 1 */}
                      <text x={0} y={15} fontFamily={outfitFont} fontSize="14" fontWeight="700" fill="#cbd5e1" textAnchor="middle">
                        Reason: Electrons are (-), so current flows OPPOSITE (Left).
                      </text>
                      {/* Reasoning Line 2 */}
                      <text x={0} y={35} fontFamily={outfitFont} fontSize="14" fontWeight="700" fill="#cbd5e1" textAnchor="middle">
                        By Fleming's Left-Hand Rule, the force is directed outwards.
                      </text>
                      
                      {/* Marks Badge */}
                      <rect x={-45} y={45} width={90} height={16} rx={8} fill="#bd4f10" />
                      <text x={0} y={57} fontFamily={outfitFont} fontSize="11" fontWeight="900" fill="#FFFFFF" textAnchor="middle">
                        FULL 3 MARKS
                      </text>
                    </g>
                  )}
                </g>
              );
            })()}
          </svg>
        </div>
      </div>
    </div>
  );
};
