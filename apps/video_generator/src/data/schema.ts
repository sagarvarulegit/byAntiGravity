import { z } from "zod";

export const WordAlignmentSchema = z.object({
  word: z.string(),
  start: z.number(),
  end: z.number(),
});

export const DiagramComponentSchema = z.object({
  id: z.string(),
  type: z.enum(["battery", "switch", "ammeter", "bulb", "resistor", "voltmeter"]),
  x: z.number(),
  y: z.number(),
  label: z.string().optional(),
});

export const DiagramWireSchema = z.object({
  id: z.string(),
  points: z.array(z.tuple([z.number(), z.number()])),
});

const TitleSceneSchema = z.object({
  id: z.string(),
  type: z.literal("title"),
  durationInFrames: z.number(),
  content: z.object({
    text: z.string(),
    subtitle: z.string().optional(),
  }),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
});

const KineticSceneSchema = z.object({
  id: z.string(),
  type: z.literal("kinetic_typography"),
  durationInFrames: z.number(),
  content: z.object({
    text: z.string(),
  }),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
});

const TextSceneSchema = z.object({
  id: z.string(),
  type: z.literal("text"),
  durationInFrames: z.number(),
  content: z.object({
    heading: z.string(),
    bullets: z.array(z.string()),
  }),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
});

const DiagramSceneSchema = z.object({
  id: z.string(),
  type: z.literal("diagram"),
  durationInFrames: z.number(),
  content: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    components: z.array(DiagramComponentSchema).optional(),
    wires: z.array(DiagramWireSchema).optional(),
  }),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
});

export const VideoSchema = z.object({
  id: z.string(),
  title: z.string(),
  durationInFrames: z.number(),
  fps: z.number().default(30),
  scenes: z.array(
    z.discriminatedUnion("type", [
      TitleSceneSchema,
      KineticSceneSchema,
      TextSceneSchema,
      DiagramSceneSchema,
    ])
  ),
});

export type VideoData = z.infer<typeof VideoSchema>;
export type WordAlignment = z.infer<typeof WordAlignmentSchema>;
export type DiagramComponent = z.infer<typeof DiagramComponentSchema>;
export type DiagramWire = z.infer<typeof DiagramWireSchema>;
