import React, { useRef } from "react";
import { useCurrentFrame, useVideoConfig, spring, interpolate, Audio, staticFile } from "remotion";
import { ThreeCanvas } from "@remotion/three";
import { useThree } from "@react-three/fiber";
import { WordAlignment } from "../../data/schema";

const CameraSetup = () => {
  const { camera } = useThree();
  camera.lookAt(0, 0, 0);
  return null;
};

export const MagneticInduction3DScene: React.FC<{
  title: string;
  teacherScript: string;
  alignments?: WordAlignment[];
  audio?: string;
}> = ({ title, audio, alignments, teacherScript }) => {
  const frame = useCurrentFrame();
  const { fps, width, height } = useVideoConfig();

  const cleanWord = (w: string) => w.toLowerCase().replace(/[^a-z0-9]/g, "");

  // Find the exact word "flips" in alignments to trigger animation
  const flipsAlignment = alignments?.find((a) => cleanWord(a.word) === "flips" || cleanWord(a.word) === "flip");
  const flipsFrame = flipsAlignment ? flipsAlignment.start * fps : 100; // Fallback to frame 100

  return (
    <div style={{ flex: 1, backgroundColor: "#18181B", display: "flex", flexDirection: "column", position: "relative" }}>
      {audio && <Audio src={staticFile(audio)} />}
      
      {/* 2D Overlay (Titles, Captions) */}
      <div style={{ position: "absolute", top: 80, width: "100%", textAlign: "center", zIndex: 10 }}>
        <h1 style={{ fontFamily: "Outfit, sans-serif", color: "#F59E0B", fontSize: 60, margin: 0 }}>{title}</h1>
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
        
        {/* The 3D Scene contents */}
        <AnimatedInductionScene frame={frame} fps={fps} flipsFrame={flipsFrame} />
      </ThreeCanvas>
    </div>
  );
};

const AnimatedInductionScene: React.FC<{ frame: number; fps: number; flipsFrame: number }> = ({ frame, fps, flipsFrame }) => {
  // Magnet rotation based on 'flips' spoken word
  const flipProgress = spring({
    frame: frame - flipsFrame,
    fps,
    config: { damping: 14, mass: 1, stiffness: 60 },
  });

  // The magnet flips 180 degrees (Math.PI) along the Z axis
  const magnetRotationZ = interpolate(flipProgress, [0, 1], [0, Math.PI]);
  
  // Current surge visualization:
  // When the magnet flips, electrons are "pushed", creating a surge of current (a bright glow)
  const currentSurge = interpolate(flipProgress, [0, 0.5, 1], [0, 1, 0]);
  
  // Electron flow animation (moving around the ring)
  const electronFlow = frame * 0.1 * (flipProgress > 0 && flipProgress < 1 ? 5 : 1);

  // Slow scene rotation to show 3D depth
  const sceneRotationY = interpolate(frame, [0, 300], [-0.3, 0.3]);

  return (
    <group rotation={[0, sceneRotationY, 0]}>
      
      {/* The Copper Wire Loop (Coil) */}
      <mesh position={[0, 0, 0]} rotation={[Math.PI / 2, 0, 0]}>
        <torusGeometry args={[3, 0.3, 32, 100]} />
        <meshStandardMaterial 
          color="#B87333" // Copper color
          metalness={0.8} 
          roughness={0.2} 
        />
      </mesh>

      {/* Induced Current Glow (Flares up during the flip) */}
      {currentSurge > 0.01 && (
        <mesh position={[0, 0, 0]} rotation={[Math.PI / 2, 0, 0]}>
          <torusGeometry args={[3.05, 0.35, 32, 100]} />
          <meshBasicMaterial 
            color="#3B82F6" // Electric blue for electrons/current
            transparent 
            opacity={currentSurge * 0.8} 
            blending={2} // Additive blending for a nice glow
          />
        </mesh>
      )}

      {/* The Bar Magnet */}
      <group position={[0, 0, 0]} rotation={[0, 0, magnetRotationZ]}>
        {/* North Pole (Red) */}
        <mesh position={[0, 1.5, 0]}>
          <cylinderGeometry args={[1, 1, 3, 32]} />
          <meshStandardMaterial color="#EF4444" metalness={0.3} roughness={0.4} />
        </mesh>
        
        {/* South Pole (Blue) */}
        <mesh position={[0, -1.5, 0]}>
          <cylinderGeometry args={[1, 1, 3, 32]} />
          <meshStandardMaterial color="#3B82F6" metalness={0.3} roughness={0.4} />
        </mesh>

        {/* N / S Labels */}
        <mesh position={[0, 2.5, 1.01]}>
          <planeGeometry args={[0.5, 0.5]} />
          <meshBasicMaterial color="#FFFFFF" transparent opacity={0.9} />
          {/* Note: In a full project, use Text geometry here, but a white dot serves as a marker */}
        </mesh>
      </group>

    </group>
  );
};
