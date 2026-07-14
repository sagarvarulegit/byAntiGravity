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

const EquationCompoundSchema = z.object({
  formula: z.string(), // e.g. H2O
  coefficient: z.number().default(1),
  state: z.string().optional(), // e.g. (g), (aq)
});

export const BoardExamSchema = z.object({
  repeated: z.number(),
  years: z.array(z.string()),
  marks: z.number().optional(),
});

const EquationSceneSchema = z.object({
  id: z.string(),
  type: z.literal("equation"),
  durationInFrames: z.number(),
  content: z.object({
    reactants: z.array(EquationCompoundSchema),
    products: z.array(EquationCompoundSchema),
    focusSide: z.enum(["none", "lhs", "rhs", "both"]).default("none"),
    focusElement: z.string().optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const ActivitySceneSchema = z.object({
  id: z.string(),
  type: z.literal("activity"),
  durationInFrames: z.number(),
  content: z.object({
    activityName: z.string(),
    description: z.string(),
    animationType: z.enum(["magnesium_burn", "zinc_acid", "lead_nitrate", "quicklime_water", "iron_copper_sulphate", "electrolysis"]),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});


const TitleSceneSchema = z.object({
  id: z.string(),
  type: z.literal("title"),
  durationInFrames: z.number(),
  content: z.object({
    text: z.string(),
    subtitle: z.string().optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const KineticSceneSchema = z.object({
  id: z.string(),
  type: z.literal("kinetic_typography"),
  durationInFrames: z.number(),
  content: z.object({
    text: z.string(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const TextSceneSchema = z.object({
  id: z.string(),
  type: z.literal("text"),
  durationInFrames: z.number(),
  content: z.object({
    heading: z.string(),
    bullets: z.array(z.string()),
    imageUrl: z.string().optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
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
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

export const ConversationMessageSchema = z.object({
  speaker: z.string(),
  role: z.string(),
  text: z.string(),
  avatarUrl: z.string().optional(),
});

const ConversationSceneSchema = z.object({
  id: z.string(),
  type: z.literal("conversation"),
  durationInFrames: z.number(),
  content: z.object({
    messages: z.array(ConversationMessageSchema),
    imageUrl: z.string().optional(),
  }),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
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
      EquationSceneSchema,
      ActivitySceneSchema,
      ConversationSceneSchema,
    ])
  ),
});

export type VideoData = z.infer<typeof VideoSchema>;
export type WordAlignment = z.infer<typeof WordAlignmentSchema>;
export type DiagramComponent = z.infer<typeof DiagramComponentSchema>;
export type DiagramWire = z.infer<typeof DiagramWireSchema>;
export type EquationCompound = z.infer<typeof EquationCompoundSchema>;
export type ConversationMessage = z.infer<typeof ConversationMessageSchema>;
