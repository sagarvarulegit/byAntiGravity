import { WordAlignment } from "../../data/schema";

export const cleanWord = (w: string) => w.toLowerCase().replace(/[^a-z0-9]/g, "");

export const useAlignments = (teacherScript: string = "", alignments?: WordAlignment[], fps: number = 30) => {
  const scriptWords = teacherScript.split(/\s+/).map(cleanWord);
  
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
  
  return { t, te };
};
