import React from "react";
import { spring, interpolate } from "remotion";

interface VariantProps {
  frame: number;
  fps: number;
  t: (phrase: string, fallback: number) => number;
  te: (phrase: string, fallback: number) => number;
}

export const Intro3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const compassP = spring({ frame: frame - t("compass needle", 8), fps });
  const magnetP = spring({ frame: frame - t("magnetic field lines", 10), fps });
  const solenoidP = spring({ frame: frame - t("solenoid", 15), fps });
  const inductionP = spring({ frame: frame - t("induction", 24), fps });

  return (
    <group position={[0, -1, 0]}>
      <mesh position={[-4, 0, 0]} scale={compassP}>
        <cylinderGeometry args={[1, 1, 0.2, 32]} />
        <meshStandardMaterial color="#334155" />
      </mesh>
      <mesh position={[-1.5, 0, 0]} scale={magnetP}>
        <boxGeometry args={[2, 0.5, 0.5]} />
        <meshStandardMaterial color="#EF4444" />
      </mesh>
      <mesh position={[1.5, 0, 0]} scale={solenoidP} rotation={[Math.PI/2, 0, 0]}>
        <torusGeometry args={[0.8, 0.2, 16, 50]} />
        <meshStandardMaterial color="#F59E0B" />
      </mesh>
      <mesh position={[4, 0, 0]} scale={inductionP}>
        <boxGeometry args={[1, 1, 1]} />
        <meshStandardMaterial color="#3B82F6" />
      </mesh>
    </group>
  );
};

export const Oersted3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const moveP = spring({ frame: frame - t("MOVED", 7.9), fps });
  const rotation = interpolate(moveP, [0, 1], [0, Math.PI / 4]);
  return (
    <group>
      <mesh position={[0, 1, 0]} rotation={[0, 0, Math.PI / 2]}>
        <cylinderGeometry args={[0.1, 0.1, 12, 16]} />
        <meshStandardMaterial color="#B87333" />
      </mesh>
      <mesh position={[0, -1, 0]} rotation={[0, rotation, 0]}>
        <boxGeometry args={[3, 0.2, 0.5]} />
        <meshStandardMaterial color="#EF4444" />
      </mesh>
      <mesh position={[0, -1, 0]}>
        <cylinderGeometry args={[1, 1, 0.1, 32]} />
        <meshStandardMaterial color="#334155" />
      </mesh>
    </group>
  );
};

export const BarMagnet3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const linesP = spring({ frame: frame - t("field lines", 8.6), fps, config: { damping: 200, mass: 2 } });
  const sceneRotationY = interpolate(frame, [0, 300], [-0.2, 0.2]);
  
  return (
    <group rotation={[0, sceneRotationY, 0]}>
      {/* Magnet */}
      <mesh position={[1.5, 0, 0]} rotation={[0, 0, Math.PI/2]}>
        <cylinderGeometry args={[0.8, 0.8, 3, 32]} />
        <meshStandardMaterial color="#EF4444" />
      </mesh>
      <mesh position={[-1.5, 0, 0]} rotation={[0, 0, Math.PI/2]}>
        <cylinderGeometry args={[0.8, 0.8, 3, 32]} />
        <meshStandardMaterial color="#3B82F6" />
      </mesh>
      
      {/* Field Lines */}
      {linesP > 0 && [-2, -1, 1, 2].map((y, i) => (
        <mesh key={i} position={[0, y, 0]} scale={linesP}>
          <torusGeometry args={[3 + Math.abs(y), 0.05, 8, 50]} />
          <meshBasicMaterial color="#F59E0B" transparent opacity={0.3} />
        </mesh>
      ))}
    </group>
  );
};

export const StraightConductor3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const circlesP = spring({ frame: frame - t("concentric circles", 7), fps });
  
  return (
    <group>
      <mesh position={[0, 0, 0]}>
        <cylinderGeometry args={[0.2, 0.2, 10, 16]} />
        <meshStandardMaterial color="#B87333" />
      </mesh>
      {circlesP > 0 && [1, 2, 3].map((r, i) => (
        <mesh key={i} position={[0, 0, 0]} rotation={[Math.PI/2, 0, 0]} scale={circlesP}>
          <torusGeometry args={[r * 1.5, 0.05, 16, 50]} />
          <meshBasicMaterial color="#3B82F6" transparent opacity={0.5} />
        </mesh>
      ))}
    </group>
  );
};

export const Solenoid3D: React.FC<VariantProps> = ({ frame }) => {
  const sceneRotationY = interpolate(frame, [0, 300], [-0.2, 0.2]);
  return (
    <group rotation={[0, sceneRotationY, 0]}>
      {/* Fake helix using multiple toruses */}
      {[-3, -2, -1, 0, 1, 2, 3].map((x, i) => (
        <mesh key={i} position={[x, 0, 0]} rotation={[Math.PI/2, 0.2, 0]}>
          <torusGeometry args={[1.5, 0.1, 16, 50]} />
          <meshStandardMaterial color="#B87333" />
        </mesh>
      ))}
    </group>
  );
};

export const Electromagnet3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const coreP = spring({ frame: frame - t("iron core", 5), fps });
  return (
    <group>
      <Solenoid3D frame={frame} fps={fps} t={t} te={(p, f) => f} />
      <mesh position={[0, 0, 0]} rotation={[0, 0, Math.PI/2]} scale={coreP}>
        <cylinderGeometry args={[1.2, 1.2, 8, 32]} />
        <meshStandardMaterial color="#94A3B8" metalness={0.8} />
      </mesh>
    </group>
  );
};

export const Fleming3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const forceP = spring({ frame: frame - t("thumb", 10), fps });
  const fieldP = spring({ frame: frame - t("index", 5), fps });
  const currentP = spring({ frame: frame - t("middle", 15), fps });
  
  return (
    <group position={[0, -2, 0]}>
      {/* Field (Index) */}
      <mesh position={[3 * fieldP, 0, 0]} rotation={[0, 0, Math.PI/2]}>
        <cylinderGeometry args={[0.2, 0.2, 6 * fieldP, 16]} />
        <meshStandardMaterial color="#3B82F6" />
      </mesh>
      {/* Current (Middle) */}
      <mesh position={[0, 0, 3 * currentP]} rotation={[Math.PI/2, 0, 0]}>
        <cylinderGeometry args={[0.2, 0.2, 6 * currentP, 16]} />
        <meshStandardMaterial color="#F59E0B" />
      </mesh>
      {/* Force (Thumb) */}
      <mesh position={[0, 3 * forceP, 0]}>
        <cylinderGeometry args={[0.2, 0.2, 6 * forceP, 16]} />
        <meshStandardMaterial color="#EF4444" />
      </mesh>
    </group>
  );
};

export const Induction3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const flipProgress = spring({ frame: frame - t("flips", 2), fps, config: { damping: 14 } });
  const magnetRotationZ = interpolate(flipProgress, [0, 1], [0, Math.PI]);
  const currentSurge = interpolate(flipProgress, [0, 0.5, 1], [0, 1, 0]);
  const sceneRotationY = interpolate(frame, [0, 300], [-0.3, 0.3]);

  return (
    <group rotation={[0, sceneRotationY, 0]}>
      <mesh position={[0, 0, 0]} rotation={[Math.PI / 2, 0, 0]}>
        <torusGeometry args={[3, 0.3, 32, 100]} />
        <meshStandardMaterial color="#B87333" metalness={0.8} roughness={0.2} />
      </mesh>
      {currentSurge > 0.01 && (
        <mesh position={[0, 0, 0]} rotation={[Math.PI / 2, 0, 0]}>
          <torusGeometry args={[3.05, 0.35, 32, 100]} />
          <meshBasicMaterial color="#3B82F6" transparent opacity={currentSurge * 0.8} blending={2} />
        </mesh>
      )}
      <group position={[0, 0, 0]} rotation={[0, 0, magnetRotationZ]}>
        <mesh position={[0, 1.5, 0]}>
          <cylinderGeometry args={[1, 1, 3, 32]} />
          <meshStandardMaterial color="#EF4444" metalness={0.3} roughness={0.4} />
        </mesh>
        <mesh position={[0, -1.5, 0]}>
          <cylinderGeometry args={[1, 1, 3, 32]} />
          <meshStandardMaterial color="#3B82F6" metalness={0.3} roughness={0.4} />
        </mesh>
      </group>
    </group>
  );
};

export const MotorGenerator3D: React.FC<VariantProps> = ({ frame, fps, t }) => {
  const rotateP = spring({ frame: frame - t("motor", 5), fps });
  const rotationY = frame * 0.1 * rotateP;

  return (
    <group>
      {/* Magnets on sides */}
      <mesh position={[-4, 0, 0]}>
        <boxGeometry args={[1, 4, 4]} />
        <meshStandardMaterial color="#EF4444" />
      </mesh>
      <mesh position={[4, 0, 0]}>
        <boxGeometry args={[1, 4, 4]} />
        <meshStandardMaterial color="#3B82F6" />
      </mesh>
      {/* Coil spinning in middle */}
      <mesh position={[0, 0, 0]} rotation={[0, rotationY, 0]}>
        <boxGeometry args={[3, 0.2, 4]} />
        <meshStandardMaterial color="#B87333" />
      </mesh>
    </group>
  );
};
