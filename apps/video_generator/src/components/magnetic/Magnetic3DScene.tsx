import React from "react";
import { useCurrentFrame, useVideoConfig, Audio, staticFile } from "remotion";
import { ThreeCanvas } from "@remotion/three";
import { useThree } from "@react-three/fiber";
import { WordAlignment } from "../../data/schema";

import { 
  Intro3D, Oersted3D, BarMagnet3D, StraightConductor3D, 
  Solenoid3D, Electromagnet3D, Fleming3D, Induction3D, MotorGenerator3D 
} from "./variants";
import { useAlignments } from "./utils";

const CameraSetup = () => {
  const { camera } = useThree();
  camera.lookAt(0, 0, 0);
  return null;
};

type Variant =
  | "intro"
  | "oersted"
  | "bar_magnet"
  | "straight_conductor"
  | "solenoid"
  | "electromagnet"
  | "fleming"
  | "induction"
  | "motor_generator";

interface Magnetic3DSceneProps {
  title: string;
  subtitle?: string;
  audio?: string;
  variant?: Variant;
  alignments?: WordAlignment[];
  teacherScript?: string;
}

export const Magnetic3DScene: React.FC<Magnetic3DSceneProps> = ({
  title,
  subtitle,
  audio,
  variant = "oersted",
  alignments,
  teacherScript = "",
}) => {
  const frame = useCurrentFrame();
  const { fps, width, height } = useVideoConfig();
  const { t, te } = useAlignments(teacherScript, alignments, fps);

  const renderVariant = () => {
    switch (variant) {
      case "intro":
        return <Intro3D frame={frame} fps={fps} t={t} te={te} />;
      case "oersted":
        return <Oersted3D frame={frame} fps={fps} t={t} te={te} />;
      case "bar_magnet":
        return <BarMagnet3D frame={frame} fps={fps} t={t} te={te} />;
      case "straight_conductor":
        return <StraightConductor3D frame={frame} fps={fps} t={t} te={te} />;
      case "solenoid":
        return <Solenoid3D frame={frame} fps={fps} t={t} te={te} />;
      case "electromagnet":
        return <Electromagnet3D frame={frame} fps={fps} t={t} te={te} />;
      case "fleming":
        return <Fleming3D frame={frame} fps={fps} t={t} te={te} />;
      case "induction":
        return <Induction3D frame={frame} fps={fps} t={t} te={te} />;
      case "motor_generator":
        return <MotorGenerator3D frame={frame} fps={fps} t={t} te={te} />;
      default:
        return null;
    }
  };

  return (
    <div style={{ flex: 1, backgroundColor: "#18181B", display: "flex", flexDirection: "column", position: "relative" }}>
      {audio && <Audio src={staticFile(audio)} />}
      
      {/* 2D Overlay (Titles, Captions) */}
      <div style={{ position: "absolute", top: 80, width: "100%", textAlign: "center", zIndex: 10 }}>
        <h1 style={{ fontFamily: "Outfit, sans-serif", color: "#F59E0B", fontSize: 60, margin: 0 }}>{title}</h1>
        {subtitle && (
          <h2 style={{ fontFamily: "Outfit, sans-serif", color: "#3B82F6", fontSize: 32, margin: "10px 0 0 0" }}>{subtitle}</h2>
        )}
        <p style={{ fontFamily: "Georgia, serif", color: "#FAFAFA", fontSize: 40, width: "80%", margin: "20px auto" }}>
          {teacherScript}
        </p>
      </div>

      {/* 3D Scene */}
      <ThreeCanvas width={width} height={height} style={{ position: "absolute", inset: 0 }} camera={{ position: [0, 4, 10], fov: 45 }}>
        <CameraSetup />
        <ambientLight intensity={0.6} />
        <pointLight position={[10, 10, 10]} intensity={1.5} color="#FFFFFF" />
        <pointLight position={[-10, 10, -10]} intensity={0.8} color="#F59E0B" />
        {renderVariant()}
      </ThreeCanvas>
    </div>
  );
};
