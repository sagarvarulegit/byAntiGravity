import React from "react";
import { TransitionSeries, linearTiming } from "@remotion/transitions";
import { slide } from "@remotion/transitions/slide";
import { useCurrentFrame, useVideoConfig, AbsoluteFill, Audio, Img, staticFile } from "remotion";
import { VideoData } from "../data/schema";
import { AppColors, outfitFont, serifFont } from "../theme";
import { DiagramScene } from "./DiagramScene";
import { RayDiagramScene } from "./RayDiagramScene";
import { BoardExamHighlight } from "./BoardExamHighlight";
import { LensSignDiagram } from "./LensSignDiagram";
import { MagneticScene } from "./MagneticScene";
import { ActivityScene } from "./ActivityScene";
import { EquationScene } from "./EquationScene";
import { TrigonometryScene } from "./TrigonometryScene";
import { BiologyScene } from "./BiologyScene";

export const ReelComposition: React.FC<VideoData> = (props) => {
  const frame = useCurrentFrame();
  const { durationInFrames } = useVideoConfig();

  // Progress Bar calculation
  const progressPercent = (frame / durationInFrames) * 100;

  // Determine Brand Color dynamically based on the subject/scene type
  // The type of the 2nd scene is usually the "subject" (trigonometry, biology, physics_lens, etc)
  const firstRealScene = props.scenes.find(s => s.type !== "title" && s.type !== "text");
  const subjectType = firstRealScene?.type || "physics_lens";
  
  let brandColor = AppColors.physicsChem;
  if (subjectType.includes("biology") || subjectType.includes("heart")) brandColor = AppColors.biology;
  if (subjectType.includes("maths") || subjectType.includes("trigonometry")) brandColor = AppColors.maths;

  return (
    <AbsoluteFill style={{ backgroundColor: AppColors.obsidian, overflow: "hidden" }}>
      {/* Top Animated Progress Bar */}
      <div
        style={{
          position: "absolute",
          top: 0,
          left: 0,
          height: "8px",
          width: `${progressPercent}%`,
          backgroundColor: brandColor,
          zIndex: 100,
          boxShadow: `0 0 12px ${brandColor}`,
        }}
      />

      {/* Top Branding Header */}
      <div
        style={{
          position: "absolute",
          top: "40px",
          left: "40px",
          right: "40px",
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          zIndex: 50,
        }}
      >
        <div
          style={{
            backgroundColor: `${brandColor}44`,
            border: `2px solid ${brandColor}`,
            color: brandColor,
            fontFamily: outfitFont,
            fontSize: "24px",
            fontWeight: 800,
            padding: "10px 24px",
            borderRadius: "30px",
            boxShadow: "0 4px 16px rgba(0,0,0,0.3)",
            letterSpacing: "0.5px",
          }}
        >
          CBSE CLASS 10 • PHYSICS ⚡
        </div>

        <div
          style={{
            backgroundColor: AppColors.orange,
            color: "#FFFFFF",
            fontFamily: outfitFont,
            fontSize: "22px",
            fontWeight: 900,
            padding: "8px 20px",
            borderRadius: "20px",
          }}
        >
          REEL #10
        </div>
      </div>

      {/* Main Content Vertical Frame */}
      <TransitionSeries>
        {props.scenes.map((scene, idx) => {
          return (
            <React.Fragment key={scene.id}>
              <TransitionSeries.Sequence durationInFrames={scene.durationInFrames}>
                <AbsoluteFill style={{ padding: "120px 40px 140px 40px", display: "flex", flexDirection: "column" }}>
                  {scene.audio && <Audio src={staticFile(scene.audio)} />}
                  
                  {/* Title Scene in Vertical format */}
                  {scene.type === "title" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center", textAlign: "center", padding: "0 20px" }}>
                      <h1 style={{ fontFamily: outfitFont, fontSize: "72px", fontWeight: 900, color: "#FFFFFF", marginBottom: "24px", lineHeight: 1.1 }}>
                        {scene.content.text}
                      </h1>
                      {scene.content.subtitle && (
                        <p style={{ fontFamily: serifFont, fontSize: "36px", color: "#94A3B8", lineHeight: 1.4 }}>
                          {scene.content.subtitle}
                        </p>
                      )}
                    </div>
                  )}

                  {/* Activity Scene in Vertical format */}
                  {scene.type === "activity" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center", gap: "30px", overflow: "hidden" }}>
                      <div style={{ transform: "scale(1.5)", transformOrigin: "center center", width: "100%", height: "100%", display: "flex", justifyContent: "center", alignItems: "center" }}>
                        <ActivityScene
                          activityName={scene.content.activityName}
                          description={scene.content.description}
                          animationType={scene.content.animationType}
                          alignments={scene.alignments}
                        />
                      </div>
                    </div>
                  )}

                  {/* Kinetic Typography Scene in Vertical format */}
                  {scene.type === "kinetic_typography" && (
                    <div style={{ flex: 1, display: "flex", justifyContent: "center", alignItems: "center", padding: "0 30px" }}>
                      <p style={{ fontFamily: outfitFont, fontSize: "52px", fontWeight: 800, color: AppColors.orange, textAlign: "center", lineHeight: 1.35 }}>
                        {scene.content.text}
                      </p>
                    </div>
                  )}

                  {/* Text Scene with Image & Bullets in Vertical Stack */}
                  {scene.type === "text" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", gap: "30px", justifyContent: "center" }}>
                      <h2 style={{ fontFamily: outfitFont, fontSize: "52px", fontWeight: 800, color: "#38BDF8", margin: 0, textAlign: "center" }}>
                        {scene.content.heading}
                      </h2>

                      {scene.content.imageUrl && (
                        <div style={{ width: "100%", height: "800px", borderRadius: "24px", overflow: "hidden", boxShadow: "0 12px 32px rgba(0,0,0,0.4)", backgroundColor: "#0F172A" }}>
                          <Img src={staticFile(scene.content.imageUrl)} alt="Illustration" style={{ width: "100%", height: "100%", objectFit: "contain" }} />
                        </div>
                      )}

                      {scene.content.imageUrls && scene.content.imageUrls.map((url, iIdx) => (
                        <div key={iIdx} style={{ width: "100%", height: "400px", borderRadius: "24px", overflow: "hidden", boxShadow: "0 12px 32px rgba(0,0,0,0.4)", backgroundColor: "#0F172A" }}>
                          <Img src={staticFile(url)} alt={`Illustration ${iIdx}`} style={{ width: "100%", height: "100%", objectFit: "contain" }} />
                        </div>
                      ))}

                      <div style={{ display: "flex", flexDirection: "column", gap: "16px", backgroundColor: "#1E293B", padding: "30px", borderRadius: "24px", border: "1px solid #334155" }}>
                        {scene.content.bullets.map((b, bIdx) => (
                          <div key={bIdx} style={{ display: "flex", gap: "16px", alignItems: "flex-start" }}>
                            <span style={{ color: AppColors.orange, fontSize: "32px", fontWeight: 900 }}>⚡</span>
                            <span style={{ fontFamily: serifFont, fontSize: "32px", color: "#F8FAFC", lineHeight: 1.3 }}>{b}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Diagram Scene in Vertical format */}
                  {scene.type === "diagram" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center", gap: "30px" }}>
                      <h2 style={{ fontFamily: outfitFont, fontSize: "48px", fontWeight: 800, color: "#38BDF8", textAlign: "center", margin: 0 }}>
                        {scene.content.title}
                      </h2>

                      <div style={{ transform: "scale(1.3)", transformOrigin: "center center", margin: "40px 0" }}>
                        <DiagramScene
                          title=""
                          components={scene.content.components}
                          wires={scene.content.wires}
                        />
                      </div>

                      {scene.content.subtitle && (
                        <p style={{ fontFamily: serifFont, fontSize: "30px", color: "#CBD5E1", textAlign: "center", backgroundColor: "#1E293B", padding: "20px 30px", borderRadius: "20px", lineHeight: 1.4 }}>
                          {scene.content.subtitle}
                        </p>
                      )}
                    </div>
                  )}

                  {/* Ray Diagram Scene in Vertical format */}
                  {scene.type === "ray_diagram" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center", gap: "30px" }}>
                      <h2 style={{ fontFamily: outfitFont, fontSize: "48px", fontWeight: 800, color: "#38BDF8", textAlign: "center", margin: 0 }}>
                        {scene.content.title}
                      </h2>

                      <div style={{ transform: "scale(1.2)", transformOrigin: "center center", margin: "30px 0" }}>
                        <RayDiagramScene
                          title=""
                          objectPosition={scene.content.objectPosition}
                        />
                      </div>

                      {scene.content.subtitle && (
                        <p style={{ fontFamily: serifFont, fontSize: "30px", color: "#CBD5E1", textAlign: "center", backgroundColor: "#1E293B", padding: "20px 30px", borderRadius: "20px", lineHeight: 1.4 }}>
                          {scene.content.subtitle}
                        </p>
                      )}
                    </div>
                  )}

                  {/* Magnetic Scene in Vertical format */}
                  {scene.type === "magnetic" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center", gap: "30px" }}>
                      <h2 style={{ fontFamily: outfitFont, fontSize: "48px", fontWeight: 800, color: "#38BDF8", textAlign: "center", margin: 0 }}>
                        {scene.content.title}
                      </h2>

                      <div style={{ transform: "scale(0.55)", transformOrigin: "center center", margin: "30px 0" }}>
                        <MagneticScene
                          title=""
                          subtitle={scene.content.subtitle}
                          variant={scene.content.variant}
                          alignments={scene.alignments}
                          teacherScript={scene.teacherScript}
                        />
                      </div>

                      {scene.content.subtitle && (
                        <p style={{ fontFamily: serifFont, fontSize: "30px", color: "#CBD5E1", textAlign: "center", backgroundColor: "#1E293B", padding: "20px 30px", borderRadius: "20px", lineHeight: 1.4 }}>
                          {scene.content.subtitle}
                        </p>
                      )}
                    </div>
                  )}

                  {/* Trigonometry Scene in Vertical format */}
                  {scene.type === "trigonometry" && (
                    <div style={{ flex: 1, display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center", gap: "30px" }}>
                      <h2 style={{ fontFamily: outfitFont, fontSize: "48px", fontWeight: 800, color: "#FBBF24", textAlign: "center", margin: 0 }}>
                        {scene.content.title}
                      </h2>

                      <div style={{ transform: "scale(1.2)", transformOrigin: "center center", margin: "30px 0" }}>
                        <TrigonometryScene
                          title=""
                          subtitle={scene.content.subtitle}
                          variant={scene.content.variant}
                          alignments={scene.alignments}
                        />
                      </div>
                    </div>
                  )}

                  {scene.boardExam && (
                    <div style={{ position: "absolute", bottom: "160px", left: "40px", right: "40px" }}>
                      <BoardExamHighlight
                        repeated={scene.boardExam.repeated}
                        years={scene.boardExam.years}
                        marks={scene.boardExam.marks}
                      />
                    </div>
                  )}
                </AbsoluteFill>
              </TransitionSeries.Sequence>

              {idx < props.scenes.length - 1 && (
                <TransitionSeries.Transition
                  presentation={slide({ direction: "from-right" })}
                  timing={linearTiming({ durationInFrames: 12 })}
                />
              )}
            </React.Fragment>
          );
        })}
      </TransitionSeries>

      {/* Bottom Sticky Call-to-Action Footer */}
      <div
        style={{
          position: "absolute",
          bottom: "30px",
          left: "40px",
          right: "40px",
          height: "80px",
          backgroundColor: "#0284C7",
          borderRadius: "40px",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          color: "#FFFFFF",
          fontFamily: outfitFont,
          fontSize: "26px",
          fontWeight: 800,
          boxShadow: "0 8px 24px rgba(2, 132, 199, 0.4)",
          letterSpacing: "0.5px",
        }}
      >
        🎯 Full Masterclass & PYQ Notes Link Below
      </div>
    </AbsoluteFill>
  );
};
